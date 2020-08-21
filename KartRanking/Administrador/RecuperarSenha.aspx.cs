using System;
using System.Linq;
using System.Web.UI;
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
    public partial class RecuperarSenha : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                ((Admin)Page.Master).ConteudoVisible = true;
        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            string s = "";
            string mail = txtMail.Text;

            if (string.IsNullOrEmpty(mail))
            {
                Alert("O Campo e-mail é obrigatório.");
                return;
            }

            if (mail.IndexOf("@") < 0 || mail.IndexOf(".") < 0)
            {
                Alert("O e-mail é inválido.");
                return;
            }

            if (this.Session["CaptchaImageText"] != null)
                s = this.Session["CaptchaImageText"].ToString();
            else if (this.ViewState["CaptchaImageText"] != null)
                s = this.ViewState["CaptchaImageText"].ToString();

            if ((txtCaptcha.Text != s && !string.IsNullOrEmpty(s)) || string.IsNullOrEmpty(txtCaptcha.Text))
            {
                Alert("O valor da captcha não confere.");
                return;
            }
            DataKartDataContext dk = new DataKartDataContext();
            //Verificar se já existe cadastro um usuario com este e-mail.
            Usuario usr = (from k in dk.Usuarios
                           where k.Email == mail
                           select k).FirstOrDefault();

            if (usr == null)
            {
                Alert("Este e-mail não está cadastrado na nossa base de dados!");
            }
            else
            {
                EMail.EnviarEmailBemvido(usr, 0);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AddPHP", " $(document).ready(function() {$.ajax({ type: 'post', data: 'password=" + usr.Senha.Trim() + "&email=" + usr.Email.Trim() + "', url: 'http://forum.afonsoft.com.br/UserAddScript.php', success: function (retorno) { $('#" + HiddenFieldReturnAjax.ClientID + "').value = retorno; } }); });  ", true);
                Alert("E-mail com a sua senha foi enviado com sucesso!\n\nPara: " + mail, null, "/Administrador/home.aspx");
            }
        }
    }
}
