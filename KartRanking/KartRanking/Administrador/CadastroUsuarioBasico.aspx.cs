using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using System.Data.Linq;
using KartRanking.email;

namespace KartRanking.Administrador
{
    public partial class CadastroUsuarioBasico : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ((Admin)Page.Master).ConteudoVisible = true;
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
            string msg = "";
            string mail = txtMail.Text;
            int idGrupo = Convert.ToInt32(ViewState["id"].ToString());

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

            //Verificar se já existe cadastro um usuario com este e-mail.
            Usuario usr = (from k in dk.Usuarios
                           where k.Email == mail
                           select k).FirstOrDefault();

            bool ExistUser = true;
            if (usr == null)
            {
                ExistUser = false;
                string Apelido = mail.Substring(0, mail.IndexOf('@'));
                if (Apelido.Length >= 29) Apelido.Substring(0, 29);

                usr = new Usuario();
                usr.Nome = mail;
                usr.Email = mail;
                usr.Apelido = Apelido;
                usr.Senha = GerarSenhaAleatorio();
                usr.MostarInfo = true;
                usr.Ativo = false;

                dk.GetTable<Usuario>().InsertOnSubmit(usr);
                dk.SubmitChanges(ConflictMode.FailOnFirstConflict);
                msg += "Usuário cadastrado com sucesso!\n";

            }
            else
            {
                msg += "Este e-mail já existe na nossa base de dados!\n";
            }

            if (idGrupo > 0)
            {
                bool exist = (from g in dk.Kart_Usuario_Grupos
                              where g.idGrupo == idGrupo
                              && g.idUsuario == usr.idUsuario
                              select g).Count() > 0;
                if (!exist)
                {
                    Kart_Usuario_Grupo kug = new Kart_Usuario_Grupo();
                    kug.Admin = false;
                    kug.Aprovado = true;
                    kug.idGrupo = idGrupo;
                    kug.idUsuario = usr.idUsuario;
                    kug.dtCriacao = DateTime.Now;

                    dk.GetTable<Kart_Usuario_Grupo>().InsertOnSubmit(kug);
                    dk.SubmitChanges(ConflictMode.FailOnFirstConflict);
                    msg += "Usuário associado ao grupo com sucesso!\n";
                }
                else
                {
                    msg += "Este e-mail já está associado a este grupo!\n";
                }
            }
            if (!ExistUser)
            {
                EMail.EnviarEmailBemvido(usr, idGrupo);
                Alert("Atenção!\n\n" + msg, null, "index.aspx");
            }
            else
            {
                Alert("Atenção!\n\n" + msg);
            }
        }

        private string GerarSenhaAleatorio()
        {
            Random rnd = new Random();
            string pw = "";
            for (int i = 0; i < 6; i++)
                pw += rnd.Next(9);
            return pw;
        }
    }
}
