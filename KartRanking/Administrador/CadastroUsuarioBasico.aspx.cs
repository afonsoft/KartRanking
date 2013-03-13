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
    public partial class CadastroUsuarioBasico : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                ViewState["id"] = 0;
                if (!string.IsNullOrEmpty(id))
                {
                    int idGrupo = Convert.ToInt32(id);
                    PopularGrupo(idGrupo);
                }
            }
        }

        private void PopularGrupo(int idGrupo)
        {
            Kart_Grupo grupo = (from g in dk.Kart_Grupos
                                where g.Ativo == true
                                && g.idGrupo == idGrupo
                                select g).FirstOrDefault();
            if (grupo != null)
            {
                string NomeLider = (from u in dk.Usuarios
                                    where u.idUsuario == grupo.Id_Usuario_Lider
                                    select u.Nome).FirstOrDefault();

                if (!string.IsNullOrEmpty(NomeLider))
                    lblGrupo.Text = grupo.NomeGrupo + " - Lider: " + NomeLider;
                else
                    lblGrupo.Text = grupo.NomeGrupo;

                ViewState["id"] = grupo.idGrupo.ToString();
            }

        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
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
        }
    }
}
