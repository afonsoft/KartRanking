using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using System.IO;
using KartRanking.Tools;
using KartRanking.BaseDados;

namespace KartRanking.Administrador
{
    public partial class Fotos : PageBaseSecurity
    {
        public int TotalCol { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["idalbum"] == null)
                {
                    PopularAlbuns();
                    PanelAlbum.Visible = false;
                    PanelListAlbum.Visible = true;
                }
                else
                {
                    int idAlbum = Convert.ToInt32(Request.QueryString["idalbum"]);
                    PopularAlbum(idAlbum);
                    PanelAlbum.Visible = true;
                    PanelListAlbum.Visible = false;
                }
            }
        }

        private void PopularAlbum(int idAlbum)
        {
            List<Album> Albuns = new List<Album>();
            var ft = (from f in dk.Kart_Album_Grupos
                      where f.idGrupo == IdGrupo
                      && f.idAlbum == idAlbum
                      select f);
            
            foreach (var f in ft)
            {
                lbDtEvento.Text = f.dtEvento.ToString("dd/MM/yyyy");
                lbTituloAlbum.Text = f.NomeAlbum;

                Albuns.Add(new Album()
                {
                    dtEvento = f.dtEvento,
                    idAlbum = f.idAlbum,
                    idGrupo = f.idGrupo,
                    NomeAlbum = f.NomeAlbum,
                    PathFotos = f.PathFotos,
                    UrlFotos = f.UrlFotos,
                    Itens = RecuperarTodosItens(f.PathFotos, f.UrlFotos)
                });
            }
            TotalCol = 0;
            RepeaterAlbum.DataSource = Albuns;
            RepeaterAlbum.DataBind();

        }

        private void PopularAlbuns()
        {
            List<Album> Albuns = new List<Album>();
            var ft = (from f in dk.Kart_Album_Grupos
                      where f.idGrupo == IdGrupo
                      select f);

            foreach (var f in ft)
            {
                Albuns.Add(new Album()
                {
                    dtEvento = f.dtEvento,
                    idAlbum = f.idAlbum,
                    idGrupo = f.idGrupo,
                    NomeAlbum = f.NomeAlbum,
                    PathFotos = f.PathFotos,
                    UrlFotos = f.UrlFotos,
                    Itens = RecuperarItens(f.PathFotos, f.UrlFotos)
                });
            }

            RepeaterAlbum.DataSource = Albuns;
            RepeaterAlbum.DataBind();
        }

        private List<Item> RecuperarTodosItens(string path, string url)
        {
            List<Item> Itens = new List<Item>();

            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            string[] str = Directory.GetFiles(path);

            foreach (string i in str)
            {
                Itens.Add(new Item()
                {
                    Foto = url + "/" + i.Substring(i.LastIndexOf("\\"), i.Length - i.LastIndexOf("\\")),
                    Nome = i.Substring(i.LastIndexOf("\\"), i.Length - i.LastIndexOf("\\")),
                    Ativo = true
                });
            }

            return Itens;
        }

        private List<Item> RecuperarItens(string path, string url)
        {
            List<Item> Itens = new List<Item>();
            
            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            string[] str = Directory.GetFiles(path);

            foreach (string i in str)
            {
                Itens.Add(new Item()
                {
                    Foto = url + "/" + i.Substring(i.LastIndexOf("\\"), i.Length - i.LastIndexOf("\\")),
                    Nome = i.Substring(i.LastIndexOf("\\"), i.Length - i.LastIndexOf("\\")),
                    Ativo = true
                });
            }

            if (Itens.Count() < 6)
            {
                for (int i = Itens.Count(); i < 6; i++)
                    Itens.Add(new Item() { Foto = "", Nome = "", Ativo = false });
            }

            return Itens.Take(6).ToList();
        }

        protected void lnkConfirmar_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsAdmin)
                {
                    DateTime dtEvento = DateTime.Now;

                    try
                    {
                        dtEvento = Convert.ToDateTime(txtDtEvento.Text);
                    }
                    catch { }

                    string UrlPath = "/Fotos/" + IdGrupo.ToString() + "_" + DateTime.Now.ToString("ddMMyyyyHHmm");
                    string FullPath = PathUtil.GetFullPathRoot() + UrlPath;

                    Kart_Album_Grupo album = new Kart_Album_Grupo();
                    album.idGrupo = IdGrupo;
                    album.PathFotos = FullPath;
                    album.NomeAlbum = txtNomeAlbum.Text;
                    album.IdUsuario = UsuarioLogado.idUsuario;
                    album.UrlFotos = UrlPath;
                    album.Descricao = "";
                    album.dtCriacao = DateTime.Now;
                    album.dtEvento = dtEvento;

                    dk.Kart_Album_Grupos.InsertOnSubmit(album);
                    dk.SubmitChanges();
                    PopularAlbuns();
                    Alert("Album cadastro com sucesso!");
                }
                else
                    Alert("Você não é o administrador do grupo para efetuar essa operação!");
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }
    }

    [Serializable]
    public class Album
    {
        public int idAlbum { get; set; }
        public int idGrupo { get; set; }
        public string NomeAlbum { get; set; }
        public DateTime dtEvento { get; set; }
        public string PathFotos { get; set; }
        public string UrlFotos { get; set; }
        public List<Item> Itens { get; set; }
        public int TotalItens { get { return Itens == null ? 0 : Itens.Count(); } }
    }

    [Serializable]
    public class Item
    {
        public string Foto { get; set; }
        public string Nome { get; set; }
        public bool Ativo { get; set; }
    }
}
