using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.BaseDados;

namespace KartRanking.Administrador
{
    public partial class Admin : System.Web.UI.MasterPage
    {

        #region dk
        private DataKartDataContext _dk = null;

        public DataKartDataContext dk
        {
            get
            {
                if (_dk == null)
                    _dk = new DataKartDataContext();
                return _dk;
            }
        }
        #endregion

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

        private void AutoLogin()
        {
            HttpCookie cookie = Request.Cookies["KartRankingAutoLogin"];
            if (cookie != null)
            {
                if (cookie.Expires >= DateTime.Now)
                {
                    if (!string.IsNullOrEmpty(cookie.Value))
                    {
                        Usuario user = (from p in dk.Usuarios
                                        where p.Email.Equals(cookie.Value)
                                        select p).FirstOrDefault();

                        if (user != null)
                        {
                            Session["Usuario"] = user;
                            pnlMenu.Visible = true;
                            pnlLogin.Visible = false;
                        }
                    }
                }
            }
        }

        #region Login e Logout
        protected void lnkSair_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            
            HttpCookie cookie = Request.Cookies["KartRankingAutoLogin"];
            if (cookie != null)
            {
                cookie.Expires = DateTime.Now.AddDays(-1);
                cookie.Value = "";
                Response.Cookies.Add(cookie);
            }
            pnlMenu.Visible = false;
            pnlLogin.Visible = true;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtPassword.Text) || string.IsNullOrEmpty(txtEmail.Text))
                    throw new Exception("Informe um usuário e senha.");

                BaseDados.DataKartDataContext dk = new BaseDados.DataKartDataContext();

                Usuario user = (from p in dk.Usuarios
                                where p.Email.Equals(txtEmail.Text.ToLower().Trim()) && p.Senha.Equals(txtPassword.Text.ToLower().Trim())
                                select p).FirstOrDefault();

                if (user == null)
                    throw new Exception("Usuário ou Senha inválidos!");

                Session["Usuario"] = user;
                pnlMenu.Visible = true;
                pnlLogin.Visible = false;
                
                if (chkLembrar.Checked)
                {
                    //Criar um cookie
                    HttpCookie cookie = new HttpCookie("KartRankingAutoLogin", txtEmail.Text);
                    cookie.Expires = DateTime.Now.AddMonths(1);
                    Response.Cookies.Add(cookie);
                }

            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] != null)
                {
                    pnlMenu.Visible = true;
                    pnlLogin.Visible = false;
                }
                else
                {
                    pnlMenu.Visible = false;
                    pnlLogin.Visible = true;
                }

            }
        }

    }
}