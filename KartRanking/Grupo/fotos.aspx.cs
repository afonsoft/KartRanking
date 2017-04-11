using System;
using System.Collections.Generic;
using System.Linq;
using KartRanking.Page;
using System.IO;
using KartRanking.BaseDados;

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
        private int IdAlbum { get; set; }

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
                IdAlbum = Convert.ToInt32(Request.QueryString["idalbum"]);
                PopularAlbum(IdAlbum);
            }
        }

        public string NomeAlbum
        {
            get
            {
                if (IdAlbum > 0)
                {
                    DataKartDataContext dk = new DataKartDataContext();
                    return (from f in dk.Kart_Album_Grupos
                            where f.idGrupo == IdGrupo
                            && f.idAlbum == IdAlbum
                            select f.NomeAlbum).FirstOrDefault();
                }
                return "";
            }
        }

        private void PopularAlbum(int idAlbum)
        {
            DataKartDataContext dk = new DataKartDataContext();
            Album album = new Album();
            var fotos = (from f in dk.Kart_Album_Grupos
                         where f.idGrupo == IdGrupo
                         && f.idAlbum == idAlbum
                         select f).FirstOrDefault();
            if (fotos != null)
            {
                album.DtEvento = fotos.dtEvento;
                album.IdAlbum = fotos.idAlbum;
                album.IdGrupo = fotos.idGrupo;
                album.NomeAlbum = fotos.NomeAlbum;
                album.PathFotos = fotos.PathFotos;
                album.UrlFotos = fotos.UrlFotos;
                album.Itens = RecuperarTodosItens(fotos.PathFotos, fotos.UrlFotos, fotos.idAlbum, fotos.idGrupo);

                TotalCol = 0;
                TotalImg = (from a in album.Itens where a.Ativo select a).Count();
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
            DataKartDataContext dk = new DataKartDataContext();
            List<Album> albuns = new List<Album>();
            var ft = (from f in dk.Kart_Album_Grupos
                      where f.idGrupo == IdGrupo
                      select f);

            foreach (var f in ft)
            {
                albuns.Add(new Album()
                {
                    DtEvento = f.dtEvento,
                    IdAlbum = f.idAlbum,
                    IdGrupo = f.idGrupo,
                    NomeAlbum = f.NomeAlbum,
                    PathFotos = f.PathFotos,
                    UrlFotos = f.UrlFotos,
                    Itens = RecuperarItens(f.PathFotos, f.UrlFotos, f.idAlbum, f.idGrupo)
                });
            }

            RepeaterAlbum.DataSource = albuns;
            RepeaterAlbum.DataBind();
        }

        private List<Item> RecuperarTodosItens(string path, string url, int idAlbum, int idGrupo)
        {
            List<Item> itens = new List<Item>();

            if (Directory.Exists(path))
            {
                string[] str = Directory.GetFiles(path);

                foreach (string i in str)
                {
                    itens.Add(new Item()
                    {
                        Foto = "http://kart.afonsoft.com.br" + url + "/" + i.Substring(i.LastIndexOf("\\", StringComparison.Ordinal) + 1, i.Length - i.LastIndexOf("\\", StringComparison.Ordinal) - 1),
                        Nome = i.Substring(i.LastIndexOf("\\", StringComparison.Ordinal) + 1, i.Length - i.LastIndexOf("\\", StringComparison.Ordinal) - 1),
                        Ativo = true,
                        IdAlbum = idAlbum,
                        IdGrupo = idGrupo
                    });
                }
            }
           
            return itens;
        }

        private List<Item> RecuperarItens(string path, string url, int idAlbum, int idGrupo)
        {
            List<Item> itens = new List<Item>();

            if (Directory.Exists(path))
            {
                string[] str = Directory.GetFiles(path);

                foreach (string i in str)
                {
                    itens.Add(new Item()
                    {
                        Foto = "http://kart.afonsoft.com.br" + url + "/" + i.Substring(i.LastIndexOf("\\", StringComparison.Ordinal) + 1, i.Length - i.LastIndexOf("\\", StringComparison.Ordinal) - 1),
                        Nome = i.Substring(i.LastIndexOf("\\", StringComparison.Ordinal) + 1, i.Length - i.LastIndexOf("\\", StringComparison.Ordinal) - 1),
                        Ativo = true,
                        IdAlbum = idAlbum,
                        IdGrupo = idGrupo
                    });
                }
            }

            if (itens.Count < 6)
            {
                for (int i = itens.Count; i < 6; i++)
                    itens.Add(new Item() { Foto = "", Nome = "", Ativo = false });
            }

            return itens.Take(6).ToList();
        }
    }

    #region Classe Album e Item

    [Serializable]
    public class Album
    {
        public int IdAlbum { get; set; }
        public int IdGrupo { get; set; }
        public string NomeAlbum { get; set; }
        public DateTime DtEvento { get; set; }
        public string PathFotos { get; set; }
        public string UrlFotos { get; set; }
        public List<Item> Itens { get; set; }
        public int TotalItens => Itens?.Count ?? 0;
    }

    [Serializable]
    public class Item
    {
        public int IdAlbum { get; set; }
        public string Foto { get; set; }
        public string Nome { get; set; }
        public bool Ativo { get; set; }
        public int IdGrupo { get; set; }
    }

    #endregion
}
