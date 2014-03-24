using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;

namespace KartRanking.Grupo
{
    public partial class noticias : PageBaseGrupo
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["idNoticia"] != null)
                {
                    popularNoticia(Convert.ToInt32(Request.QueryString["idNoticia"]));
                }
                else
                {
                    popularNoticias();
                }
            }
        }

        private void popularNoticias()
        {
            PanelNoticias.Visible = true;
            PanelReadNoticia.Visible = false;

            var noticias = (from n in dk.Kart_Noticias_Grupos
                            join u in dk.Usuarios on n.IdUsuario equals u.idUsuario
                            where n.idGrupo == IdGrupo
                            && n.Ativo == true
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
        private void popularNoticia(int idNoticia)
        {
            PanelNoticias.Visible = false;
            PanelReadNoticia.Visible = true;

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
