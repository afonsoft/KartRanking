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
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
    public partial class Fotos : PageBaseSecurity
    {
        public int TotalCol { get; set; }
        public int TotalImg { get; set; }
        public int TotalImgCount { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
                if (!IsPostBack)
                {
                    if (Request.QueryString["idalbum"] == null)
                    {
                        PanelAlbum.Visible = false;
                        PanelListAlbum.Visible = true;
                        PopularAlbuns();
                        PopularEtapas();
                    }
                    else
                    {
                        PanelAlbum.Visible = true;
                        PanelListAlbum.Visible = false;
                        int idAlbum = Convert.ToInt32(Request.QueryString["idalbum"]);
                        PopularAlbum(idAlbum);
                    }
                }
            //}
            //catch (UnauthorizedAccessException uex)
            //{
            //    LogErro.Log.Logar(uex, HttpContext.Current);
            //    Alert("Erro de permissão ao diretório!\nEntre em contado com o suporte!", null, "/Administrador/index.aspx");
            //}
            //catch (Exception ex)
            //{
            //    Alert(ex);
            //}
        }

        private void PopularEtapas()
        {
            ddlEtapas.Items.Clear();
            using (DataKartDataContext dk = new DataKartDataContext())
            {
                var LinqEtapas = (from e in dk.Kart_Calendario_Campeonatos
                                  orderby e.Data ascending
                                  where (e.Ativo == true || e.Ativo == null)
                                  && e.idCampeonato == IdCampeonato
                                  select new { e.Nome, e.Data, e.idCalendario }).ToList();

                var etapas = (from l in LinqEtapas
                              orderby l.Data ascending
                              select new { Nome = l.Nome + " - " + l.Data.ToString("dd/MM/yyyy"), l.idCalendario });

                ddlEtapas.DataSource = etapas;
                ddlEtapas.DataTextField = "Nome";
                ddlEtapas.DataValueField = "idCalendario";
                ddlEtapas.DataBind();
            }

            ddlEtapas.Items.Insert(0, new ListItem("Nenhum", "0"));

        }

        private void PopularAlbum(int idAlbum)
        {
            Album album = new Album();
            var fotos = (from f in dk.Kart_Album_Grupos
                     where f.idGrupo == IdGrupo
                     && f.idAlbum == idAlbum
                     select f).FirstOrDefault();
            if (fotos != null)
            {
                lbDtEvento.Text = fotos.dtEvento.ToString("dd/MM/yyyy");
                lbTituloAlbum.Text = fotos.NomeAlbum;

                album.dtEvento = fotos.dtEvento;
                album.idAlbum = fotos.idAlbum;
                album.idGrupo = fotos.idGrupo;
                album.NomeAlbum = fotos.NomeAlbum;
                album.PathFotos = fotos.PathFotos;
                album.UrlFotos = fotos.UrlFotos;
                album.idCalendario = fotos.idCalendario.HasValue ? fotos.idCalendario.Value : 0;
                album.Itens = RecuperarTodosItens(fotos.PathFotos, fotos.UrlFotos, fotos.idAlbum);

                TotalCol = 0;
                TotalImg = (from a in album.Itens where a.Ativo == true select a).Count();
                TotalImgCount = 0;
                RepeaterFotos.DataSource = album.Itens;
                RepeaterFotos.DataBind();
            }
            else
            {
                Alert("Album não localizado, ou não pertence a este grupo!", null, "/Administrador/home.aspx");
            }
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
                    idCalendario = f.idCalendario.HasValue ? f.idCalendario.Value : 0,
                    Itens = RecuperarItens(f.PathFotos, f.UrlFotos, f.idAlbum)
                });
            }

            RepeaterAlbum.DataSource = Albuns;
            RepeaterAlbum.DataBind();
        }

        private List<Item> RecuperarTodosItens(string path, string url, int idAlbum)
        {
            List<Item> Itens = new List<Item>();

            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            string[] str = Directory.GetFiles(path);

            foreach (string i in str)
            {
                Itens.Add(new Item()
                {
                    Foto = "http://kart.afonsoft.com.br" + url + "/" + i.Substring(i.LastIndexOf("\\") + 1, i.Length - i.LastIndexOf("\\") - 1),
                    Nome = i.Substring(i.LastIndexOf("\\") + 1, i.Length - i.LastIndexOf("\\") - 1),
                    Ativo = true,
                    idAlbum = idAlbum
                });
            }

            if (Itens.Count() < 6)
            {
                for (int i = Itens.Count(); i < 6; i++)
                    Itens.Add(new Item() { Foto = "", Nome = "", Ativo = false });
            }

            return Itens;
        }

        private List<Item> RecuperarItens(string path, string url, int idAlbum)
        {
            List<Item> Itens = new List<Item>();
            
            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            string[] str = Directory.GetFiles(path);

            foreach (string i in str)
            {
                Itens.Add(new Item()
                {
                    Foto = "http://kart.afonsoft.com.br" + url + "/" + i.Substring(i.LastIndexOf("\\") + 1, i.Length - i.LastIndexOf("\\") - 1),
                    Nome = i.Substring(i.LastIndexOf("\\") + 1, i.Length - i.LastIndexOf("\\") - 1),
                    Ativo = true,
                    idAlbum = idAlbum
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

                    string pasta = IdGrupo.ToString() + "_" + DateTime.Now.ToString("ddMMyyyyHHmm");
                    string UrlPath = "/Fotos/" + pasta;
                    string FullPath = PathUtil.GetFullPathRoot() + "\\Fotos\\" + pasta;
                    
                    Trace.Write("UrlPath: " + UrlPath);
                    Trace.Write("FullPath: " + FullPath);

                    Kart_Album_Grupo album = new Kart_Album_Grupo();
                    album.idGrupo = IdGrupo;
                    album.PathFotos = FullPath;
                    album.NomeAlbum = txtNomeAlbum.Text;
                    if (ddlEtapas.SelectedIndex > 0)
                        album.idCalendario = Convert.ToInt32(ddlEtapas.SelectedValue);
                    album.IdUsuario = UsuarioLogado.idUsuario;
                    album.UrlFotos = UrlPath;
                    album.Descricao = "";
                    album.dtCriacao = DateTime.Now;
                    album.dtEvento = dtEvento;

                    dk.Kart_Album_Grupos.InsertOnSubmit(album);
                    dk.SubmitChanges();
                    PopularAlbuns();

                    if (album.idAlbum > 0)
                        email.EMail.EnviarEmailAlbum(IdGrupo, album.idAlbum);

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

        protected void lnkConfirmarUp_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsAdmin)
                {
                    int idAlbum = Convert.ToInt32(Request.QueryString["idalbum"]);
                    string msg = "";
                    msg += UploadFile(FileUploadControl1, idAlbum);
                    msg += UploadFile(FileUploadControl2, idAlbum);
                    msg += UploadFile(FileUploadControl3, idAlbum);
                    msg += UploadFile(FileUploadControl4, idAlbum);
                    msg += UploadFile(FileUploadControl5, idAlbum);

                    PopularAlbum(idAlbum);

                    if (string.IsNullOrEmpty(msg))
                        Alert("Todas as fotos foram enviadas com sucesso!");
                    else
                        Alert("Houver alguns erros no upload!\n\n"+msg +"\nAs demais fotos foram enviadas!");

                }
                else
                    Alert("Você não é o administrador do grupo para efetuar essa operação!");
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

        private string UploadFile(FileUpload FileUploadControl, int idAlbum)
        {
            if (FileUploadControl.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUploadControl.FileName).ToLower();

                    if (filename.IndexOf(".jpg") > 0 || filename.IndexOf(".jpeg") > 0)
                    {
                        string PathFoto = (from al in dk.Kart_Album_Grupos
                                           where al.idAlbum == idAlbum
                                           && al.idGrupo == IdGrupo
                                           select al.PathFotos).FirstOrDefault();

                        string FullPath = Path.Combine(PathFoto, filename);

                        if (!Directory.Exists(PathFoto))
                            Directory.CreateDirectory(PathFoto);

                        FileUploadControl.SaveAs(FullPath);
                    }
                    else
                    {
                        throw new Exception("Formato inválido de arquivo!\n");
                    }
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }

            return ""; 
        }

        protected void btnDesativarAlbum_Click(object sender, EventArgs e)
        {
            try
            {
                int idAlbum = Convert.ToInt32(Request.QueryString["idalbum"]);

                string PathFoto = (from al in dk.Kart_Album_Grupos
                                   where al.idAlbum == idAlbum
                                   && al.idGrupo == IdGrupo
                                   select al.PathFotos).FirstOrDefault();


                if (Directory.Exists(PathFoto))
                {
                    string[] Arquivos = Directory.GetFiles(PathFoto);
                    foreach (string arquivo in Arquivos)
                        File.Delete(arquivo);

                    Directory.Delete(PathFoto);

                    var delItem = dk.Kart_Album_Grupos.Where(x => x.idAlbum == idAlbum && x.idGrupo == IdGrupo);
                    dk.Kart_Album_Grupos.DeleteAllOnSubmit(delItem);
                    dk.SubmitChanges();

                    Alert("Album deletado com sucesso.", null, "/Administrador/Fotos.aspx");
                }
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

    }

    #region Classe Album e Item

    [Serializable]
    public class Album
    {
        public int idAlbum { get; set; }
        public int idGrupo { get; set; }
        public int idCalendario { get; set; }
        public string NomeCalendario { get; set; }
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
        public int idAlbum { get; set; }
        public string Foto { get; set; }
        public string Nome { get; set; }
        public bool Ativo { get; set; }
    }

    #endregion
}
