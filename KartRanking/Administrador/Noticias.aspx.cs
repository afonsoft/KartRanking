using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using KartRanking.email;

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
    public partial class Noticias : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HiddenFieldIdNoticia.Value = "0";
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
            using (DataKartDataContext dk = new DataKartDataContext())
            {
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
        }
        private void popularNoticia(int idNoticia)
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

        protected void RptNoticias_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int idNoticia = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "VerNoticia")
            {
                popularNoticia(idNoticia);
            }
            else if (e.CommandName == "Alterar")
            {
                if (IsAdmin)
                {
                    popularEditNoticia(idNoticia);
                }
                else
                {
                    Alert("Você não possue permissão para editar noticias deste grupo!");
                }
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

        private void popularEditNoticia(int idNoticia)
        {
            using (DataKartDataContext dk = new DataKartDataContext())
            {
                var noticia = (from n in dk.Kart_Noticias_Grupos
                               where n.idGrupo == IdGrupo
                               && n.idNoticias == idNoticia
                               orderby n.dtCriacao ascending
                               select n).FirstOrDefault();

                if (noticia != null)
                {

                    HiddenFieldIdNoticia.Value = noticia.idNoticias.ToString();
                    txtTitulo.Text = noticia.Titulo;
                    textarea.Text = noticia.Noticia;
                    Page.ClientScript.RegisterStartupScript(PanelNoticias.GetType(), "Cadastro", "CadastrarNoticia();", true);
                }
                else
                {
                    Alert("Não foi possivel abrir essa noticia para edição!");
                }
            }
        }

        private void deletarNoticia(int idNoticia)
        {
            try
            {
                using (DataKartDataContext dk = new DataKartDataContext())
                {
                    Kart_Noticias_Grupo noticias = (from n in dk.Kart_Noticias_Grupos
                                                    where n.idGrupo == IdGrupo
                                                    && n.idNoticias == idNoticia
                                                    select n).FirstOrDefault();

                    noticias.Ativo = false;
                    dk.SubmitChanges();
                }

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
                    HiddenFieldIdNoticia.Value = "0";
                    txtTitulo.Text = "";
                    textarea.Text = "";
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

        protected void lnkCadastrar_Click(object sender, EventArgs e)
        {
            if (IsAdmin)
            {
                DataKartDataContext dk = new DataKartDataContext();
                Kart_Noticias_Grupo noticia = null;
                int idNoticia = Convert.ToInt32(HiddenFieldIdNoticia.Value);

                if (idNoticia <= 0)
                    noticia = new Kart_Noticias_Grupo();
                else
                    noticia = (from n in dk.Kart_Noticias_Grupos
                               where n.idNoticias == idNoticia
                               select n).FirstOrDefault();

                if(noticia == null)
                    noticia = new Kart_Noticias_Grupo();

                noticia.idGrupo = IdGrupo;
                noticia.dtCriacao = DateTime.Now;
                noticia.Ativo = true;
                noticia.IdUsuario = UsuarioLogado.idUsuario;
                noticia.Titulo = txtTitulo.Text;
                noticia.Noticia = textarea.Text;
                
                if (idNoticia <= 0)
                    dk.Kart_Noticias_Grupos.InsertOnSubmit(noticia);

                dk.SubmitChanges();
                popularNoticias();

                if (idNoticia <= 0 && noticia.idNoticias > 0)
                    EMail.EnviarEmailNoticias(IdGrupo, noticia.idNoticias);
                
                Alert("Operação efetuado com sucesso!");
            }
            else
            {
                Alert("Você não possue permissão para editar noticias deste grupo!");
            }
        }
    }
}