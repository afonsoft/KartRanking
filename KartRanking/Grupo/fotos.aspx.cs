using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using System.IO;

namespace KartRanking.Grupo
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
    public partial class fotos : PageBaseGrupo
    {
        public int TotalCol { get; set; }
        public int TotalImg { get; set; }
        public int TotalImgCount { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["idalbum"] == null)
            {
                PanelAlbum.Visible = false;
                PanelListAlbum.Visible = true;
                PopularAlbuns();
            }
            else
            {
                PanelAlbum.Visible = true;
                PanelListAlbum.Visible = false;
                int idAlbum = Convert.ToInt32(Request.QueryString["idalbum"]);
                PopularAlbum(idAlbum);
            }
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
                titleAlbum.ImageUrl = "/Grupo/ImgTitleHandler.ashx?Text=" + fotos.NomeAlbum + "&f=28";

                album.dtEvento = fotos.dtEvento;
                album.idAlbum = fotos.idAlbum;
                album.idGrupo = fotos.idGrupo;
                album.NomeAlbum = fotos.NomeAlbum;
                album.PathFotos = fotos.PathFotos;
                album.UrlFotos = fotos.UrlFotos;
                album.Itens = RecuperarTodosItens(fotos.PathFotos, fotos.UrlFotos, fotos.idAlbum, fotos.idGrupo);

                TotalCol = 0;
                TotalImg = (from a in album.Itens where a.Ativo == true select a).Count();
                TotalImgCount = 0;
                RepeaterFotos.DataSource = album.Itens;
                RepeaterFotos.DataBind();
            }
            else
            {
                Alert("Album não localizado, ou não pertence a este grupo!", null, "/index.aspx");
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
                    Itens = RecuperarItens(f.PathFotos, f.UrlFotos, f.idAlbum, f.idGrupo)
                });
            }

            RepeaterAlbum.DataSource = Albuns;
            RepeaterAlbum.DataBind();
        }

        private List<Item> RecuperarTodosItens(string path, string url, int idAlbum, int idGrupo)
        {
            List<Item> Itens = new List<Item>();

            if (Directory.Exists(path))
            {
                string[] str = Directory.GetFiles(path);

                foreach (string i in str)
                {
                    Itens.Add(new Item()
                    {
                        Foto = "http://kart.afonsoft.com.br" + url + "/" + i.Substring(i.LastIndexOf("\\") + 1, i.Length - i.LastIndexOf("\\") - 1),
                        Nome = i.Substring(i.LastIndexOf("\\") + 1, i.Length - i.LastIndexOf("\\") - 1),
                        Ativo = true,
                        idAlbum = idAlbum,
                        idGrupo = idGrupo
                    });
                }
            }
           
            return Itens;
        }

        private List<Item> RecuperarItens(string path, string url, int idAlbum, int idGrupo)
        {
            List<Item> Itens = new List<Item>();

            if (Directory.Exists(path))
            {
                string[] str = Directory.GetFiles(path);

                foreach (string i in str)
                {
                    Itens.Add(new Item()
                    {
                        Foto = "http://kart.afonsoft.com.br" + url + "/" + i.Substring(i.LastIndexOf("\\") + 1, i.Length - i.LastIndexOf("\\") - 1),
                        Nome = i.Substring(i.LastIndexOf("\\") + 1, i.Length - i.LastIndexOf("\\") - 1),
                        Ativo = true,
                        idAlbum = idAlbum,
                        idGrupo = idGrupo
                    });
                }
            }

            if (Itens.Count() < 6)
            {
                for (int i = Itens.Count(); i < 6; i++)
                    Itens.Add(new Item() { Foto = "", Nome = "", Ativo = false });
            }

            return Itens.Take(6).ToList();
        }
    }

    #region Classe Album e Item

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
        public int idAlbum { get; set; }
        public string Foto { get; set; }
        public string Nome { get; set; }
        public bool Ativo { get; set; }
        public int idGrupo { get; set; }
    }

    #endregion
}
