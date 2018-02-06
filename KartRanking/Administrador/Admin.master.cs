using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.BaseDados;
using System.Collections.Specialized;

namespace KartRanking.Administrador
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    * Incluido no menu o item da regra                      *
    ********************************************************/
    public partial class Admin : System.Web.UI.MasterPage
    {

        #region Alert
        public void Alert(Exception ex)
        {
            this.Alert(null, ex);
        }
        public void Alert(string msg, Exception ex)
        {
            string alert = "";

            alert = string.IsNullOrEmpty(msg) ? "" : msg.Replace("'", "`").Replace(Environment.NewLine, "\\n").Replace("\n", "\\n");
            alert += ex == null ? "" : ex.Message.Replace("'", "`").Replace(Environment.NewLine, "\\n").Replace("\n", "\\n");

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('" + alert + "');", true);

            if (ex != null && ex.InnerException != null)
                LogErro.Log.Logar(ex, HttpContext.Current);

        }
        #endregion

        #region AutoLogin
        private void AutoLogin()
        {
            HttpCookie cookie = Request.Cookies["KartRankingAutoLogin"];
            HttpCookie cookieUser = Request.Cookies["KartRankingUserName"];

            if (!string.IsNullOrEmpty(cookieUser?.Value))
            {
                txtEmail.Text = cookieUser.Value;
            }

            if (!string.IsNullOrEmpty(cookie?.Value))
            {
                if (Session["Usuario"] == null)
                {

                    DataKartDataContext dk = new DataKartDataContext();
                    Usuario user = (from p in dk.Usuarios
                        where p.Email.Equals(cookie.Value)
                        select p).FirstOrDefault();

                    if (user != null)
                    {
                        Session["Usuario"] = user;
                        pnlMenu.Visible = pnlConteudo.Visible = ddlGrupos.Enabled = imgAssociarGrupo.Enabled = true;
                        pnlLogin.Visible = pnlNotLogin.Visible = false;
                        lblNomeUsuario.Text = user.Nome;

                        CarregarGruposUsuario();
                    }
                }
            }
        }
        #endregion 

        #region Login e Logout
        protected void lnkSair_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            lblNomeUsuario.Text = "Visitante";
            HttpCookie cookie = Request.Cookies["KartRankingAutoLogin"];
            if (cookie != null)
            {
                cookie.Expires = DateTime.Now.AddDays(-1);
                cookie.Value = "";
                Response.Cookies.Add(cookie);
            }
            pnlMenu.Visible = pnlConteudo.Visible = ddlGrupos.Enabled = imgAssociarGrupo.Enabled = false;
            pnlLogin.Visible = pnlNotLogin.Visible = true;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtPassword.Text) || string.IsNullOrEmpty(txtEmail.Text))
                    throw new Exception("Informe um usuário e senha.");

                using (var dk = new DataKartDataContext())
                {
                    Usuario user = (from p in dk.Usuarios
                                    where p.Email.Equals(txtEmail.Text.ToLower().Trim()) && p.Senha.Equals(txtPassword.Text.ToLower().Trim())
                                    select p).FirstOrDefault();

                    if (user == null)
                        throw new Exception("Usuário ou Senha inválidos!");

                    Session["Usuario"] = user;
                    lblNomeUsuario.Text = user.Nome;


                    pnlMenu.Visible = pnlConteudo.Visible = ddlGrupos.Enabled = imgAssociarGrupo.Enabled = true;
                    pnlLogin.Visible = pnlNotLogin.Visible = false;


                    HttpCookie cookieEmail = new HttpCookie("KartRankingUserName", txtEmail.Text);
                    cookieEmail.Expires = DateTime.Now.AddMonths(1);
                    Response.Cookies.Add(cookieEmail);

                    if (chkLembrar.Checked)
                    {
                        //Criar um cookie
                        HttpCookie cookie = new HttpCookie("KartRankingAutoLogin", txtEmail.Text);
                        cookie.Expires = DateTime.Now.AddMonths(1);
                        Response.Cookies.Add(cookie);
                    }

                    CarregarGruposUsuario();

                    dk.Kart_log_acessos.InsertOnSubmit(new Kart_log_acesso() { dtAcesso = DateTime.Now, idUsuario = user.idUsuario });
                    dk.SubmitChanges();
                }
                Page.ClientScript.RegisterStartupScript(GetType(), "Redirect", "window.location.href='/Administrador/home.aspx';", true);
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }
        #endregion

        public bool ConteudoVisible
        {
            get
            {
                return pnlConteudo.Visible;
            }
            set
            {
                pnlConteudo.Visible = value;
                pnlNotLogin.Visible = !value;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (!IsPostBack)
            {
                HiddenidGrupo.Value = "0";

                if (Request.QueryString["IdGrupo"] != null)
                {
                    Session["IdGrupo"] = Request.QueryString["IdGrupo"];
                }
                if (Session["IdGrupo"] != null)
                    HiddenidGrupo.Value = Session["IdGrupo"].ToString();

                if (Session["Usuario"] != null)
                {
                    lblNomeUsuario.Text = ((Usuario)Session["Usuario"]).Nome;
                    pnlMenu.Visible = pnlConteudo.Visible = true;
                    pnlLogin.Visible = pnlNotLogin.Visible = false;
                    CarregarGruposUsuario();

                    if (!((Usuario)Session["Usuario"]).Ativo.Value && Request.Path.IndexOf("perfil") < 0)
                    {
                        Response.Redirect("~/Administrador/perfil.aspx?idUsuario=" + ((Usuario)Session["Usuario"]).idUsuario);
                    }

                }
                else
                {
                    lblNomeUsuario.Text = "Visitante";
                    pnlMenu.Visible = ddlGrupos.Enabled = imgAssociarGrupo.Enabled = false;
                    pnlLogin.Visible = true;

                    pnlConteudo.Visible = ConteudoVisible;
                    pnlNotLogin.Visible = !ConteudoVisible;
                }

            }

            AutoLogin();
        }

        private void CarregarGruposUsuario()
        {
            Usuario user = (Usuario)Session["Usuario"];
            DataKartDataContext dk = new DataKartDataContext();

            var grupos = (from gu in dk.Kart_Usuario_Grupos
                          join g in dk.Kart_Grupos
                          on gu.idGrupo equals g.idGrupo
                          orderby g.dtCriacao descending
                          where gu.idUsuario == user.idUsuario
                          && g.Ativo == true
                          select new { id = g.idGrupo, Nome = g.NomeGrupo });

            if (grupos.Any())
            {
                ddlGrupos.DataSource = grupos;
                ddlGrupos.DataTextField = "Nome";
                ddlGrupos.DataValueField = "id";
                ddlGrupos.DataBind();

                int idGrupoSelecionado = Convert.ToInt16(HiddenidGrupo.Value);
                if (idGrupoSelecionado > 0)
                {
                    ddlGrupos.Items.FindByValue(idGrupoSelecionado.ToString()).Selected = true;
                }

                Session["IdGrupo"] = ddlGrupos.SelectedValue;
                CarregarCampeonato(Convert.ToInt16(ddlGrupos.SelectedValue));
            }
            else
            {
                ddlGrupos.Items.Insert(0, new ListItem("Nenhum Grupo associado", "0", true));

                if (!Request.Url.LocalPath.Contains("AdminGrupo.aspx") && !Request.Url.LocalPath.Contains("perfil.aspx"))
                    Response.Redirect("~/Administrador/AdminGrupo.aspx");
            }

        }

        private void CarregarCampeonato(int idGrupo)
        {
            DataKartDataContext dk = new DataKartDataContext();
            var campeonato = (from c in dk.Kart_Campeonatos
                               where c.idGrupo == idGrupo
                               && c.Ativo == true
                               orderby c.dtFim descending, c.dtCriacao descending, c.NomeCampeonato ascending
                               select c).FirstOrDefault();

            if (campeonato != null)
                Session["IdCampeonato"] = campeonato.idCampeonato;
            else
                Session["IdCampeonato"] = 0;

        }

        protected void ddlGrupos_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["IdCalendario"] = 0;
            Session["IdCampeonato"] = 0;
            Session["IdGrupo"] = ddlGrupos.SelectedValue;
            CarregarCampeonato(Convert.ToInt16(ddlGrupos.SelectedValue));
            string url = AlterarGrupo("/Administrador/home.aspx", Request.QueryString, ddlGrupos.SelectedValue);
            Response.Redirect(url);
        }

        private string AlterarGrupo(string url, NameValueCollection nameValueCollection, string idGrupo)
        {
            string rurl = "";
            foreach (string q in nameValueCollection.AllKeys)
            {
                if (q.ToLower() != "idgrupo" && q.ToLower() != "idcampeonato")
                {
                    if (rurl.IndexOf("?") >= 0)
                        rurl += "&" + q + "=" + nameValueCollection[q];
                    else
                        rurl += "?" + q + "=" + nameValueCollection[q];
                }
            }
            if (rurl.IndexOf("?") >= 0)
                return url + rurl + "&IdGrupo=" + idGrupo;
            else
                return url + rurl + "?IdGrupo=" + idGrupo;
        }

        protected void imgAssociarGrupo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Administrador/ListarGrupos.aspx");
        }

    }
}