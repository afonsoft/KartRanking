using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;

namespace KartRanking.Administrador
{
    public partial class Noticias : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    popularNoticia(Convert.ToInt32(Request.QueryString["id"]));
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
                            orderby n.dtCriacao ascending
                            select new
                            {
                                n.idNoticias,
                                n.IdUsuario,
                                u.Nome,
                                n.Titulo,
                                n.dtCriacao,
                                Noticia = n.Noticia.Substring(0, n.Noticia.Length > 200 ? 200 : n.Noticia.Length)
                            });

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

        protected void RptNoticias_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int idNoticia = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "VerNoticia")
            {
                popularNoticia(idNoticia);
            }
            else if (e.CommandName == "Deletar")
            {
                if (IsAdmin)
                {
                    deletarNoticia(idNoticia);
                }
                else
                {
                    Alert("Você não possue permissão para editar noticias deste grupo!");
                }
            }
        }

        private void deletarNoticia(int idNoticia)
        {
            try
            {
                Kart_Noticias_Grupo noticias = (from n in dk.Kart_Noticias_Grupos
                                                where n.idGrupo == IdGrupo
                                                && n.idNoticias == idNoticia
                                                select n).FirstOrDefault();

                noticias.Ativo = false;
                dk.SubmitChanges();
                popularNoticias();
                Alert("Operação efetuado com sucesso.");
            }
            catch (Exception ex)
            {
                Alert(ex.Message, ex);
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            popularNoticias();
        }

        protected void btnAddNoticias_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsAdmin)
                {
                    Page.ClientScript.RegisterStartupScript(PanelNoticias.GetType(), "Cadastro", "CadastrarNoticia();", true);
                }
                else
                {
                    Alert("Você não possue permissão para editar noticias deste grupo!");
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message, ex);
            }
        }
    }
}