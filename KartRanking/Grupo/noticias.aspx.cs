using System;
using System.Linq;
using KartRanking.Page;
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
    public partial class noticias : PageBaseGrupo
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["idNoticia"] != null)
                {
                    PopularNoticia(Convert.ToInt32(Request.QueryString["idNoticia"]));
                }
                else
                {
                    PopularNoticias();
                }
            }
        }

        private void PopularNoticias()
        {
            PanelNoticias.Visible = true;
            PanelReadNoticia.Visible = false;

            using (DataKartDataContext dk = new DataKartDataContext())
            {
                var noticias = (from n in dk.Kart_Noticias_Grupos
                                join u in dk.Usuarios on n.IdUsuario equals u.idUsuario
                                where n.idGrupo == IdGrupo
                                && n.Ativo
                                orderby n.dtCriacao descending
                                select new
                                {
                                    n.idNoticias,
                                    n.IdUsuario,
                                    u.Nome,
                                    n.Titulo,
                                    n.dtCriacao,
                                    Noticia = n.Noticia.Substring(0, n.Noticia.Length > 150 ? 150 : n.Noticia.Length)
                                }).Take(50);

                RptNoticias.DataSource = noticias;
                RptNoticias.DataBind();
            }
        }
        private void PopularNoticia(int idNoticia)
        {
            PanelNoticias.Visible = false;
            PanelReadNoticia.Visible = true;

            using (DataKartDataContext dk = new DataKartDataContext())
            {
                var noticias = (from n in dk.Kart_Noticias_Grupos
                                join u in dk.Usuarios on n.IdUsuario equals u.idUsuario
                                where n.idGrupo == IdGrupo
                                && n.idNoticias == idNoticia
                                orderby n.dtCriacao ascending
                                select new
                                {
                                    n.idNoticias,
                                    n.IdUsuario,
                                    u.Nome,
                                    n.Titulo,
                                    n.Noticia,
                                    n.dtCriacao
                                }).FirstOrDefault();

                if (noticias != null)
                {
                    lbNoticia.Text = noticias.Noticia;
                    lbTitulo.Text = noticias.Titulo;
                    lbNome.Text = noticias.Nome;
                }
            }
        }
    }
}
