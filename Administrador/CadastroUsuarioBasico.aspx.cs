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
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
    public partial class CadastroUsuarioBasico : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ((Admin)Page.Master).ConteudoVisible = true;
                string id = Request.QueryString["id"];
                ViewState["id"] = 0;

                if(string.IsNullOrEmpty(id))
                    id = Request.QueryString["idGrupo"];

                if (!string.IsNullOrEmpty(id))
                {
                    int idGrupo = Convert.ToInt32(id);
                    PopularGrupo(idGrupo);
                }
            }
        }

        private void PopularGrupo(int idGrupo)
        {
            using (DataKartDataContext dk = new DataKartDataContext())
            {
                Kart_Grupo grupo = (from g in dk.Kart_Grupos
                                    where g.Ativo == true
                                    && g.idGrupo == idGrupo
                                    select g).FirstOrDefault();
                if (grupo != null)
                {
                    var Lider = (from u in dk.Usuarios
                                 where u.idUsuario == grupo.Id_Usuario_Lider
                                 select new { u.Nome, u.Email }).FirstOrDefault();

                    if (Lider != null)
                        lblGrupo.Text = "<b>" + grupo.NomeGrupo + "</b> - Lider: <a href='mailto:" + Lider.Email + "'>" + Lider.Nome + "</a>";
                    else
                        lblGrupo.Text = "<b>" + grupo.NomeGrupo + "</b>";

                    ViewState["id"] = grupo.idGrupo.ToString();
                }
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

            DataKartDataContext dk = new DataKartDataContext();

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

                #region phpbb_user Disabled
                //Efetuar o cadastro no Forum
                //phpbb_user phpu = new phpbb_user()
                //{
                //    user_type = 1,
                //    group_id = 2,
                //    user_permissions = "",
                //    user_perm_from = 0,
                //    user_ip = "",
                //    user_regdate = 1396623164,
                //    username = "",
                //    username_clean = "",
                //    user_password = EncryptMd5("123qwe"), 
                //    user_passchg = 1396623164,
                //    user_pass_convert = 0,
                //    user_email = "",
                //    user_email_hash = EncryptCRC32(usr.Email + usr.Email.Length.ToString()),
                //    user_birthday = "",
                //    user_lastvisit = 0,
                //    user_lastmark = 1396623164,
                //    user_lastpost_time = 0,
                //    user_lastpage = "",
                //    user_last_confirm_key = "",
                //    user_last_search = 0,
                //    user_warnings = 0,
                //    user_last_warning = 0,
                //    user_login_attempts = 0,
                //    user_inactive_reason = 1,
                //    user_inactive_time = 1396623164,
                //    user_posts = 0,
                //    user_lang = "pt_br",
                //    user_timezone = -3,
                //    user_dst = 1,
                //    user_dateformat = "D M d, Y h:i",
                //    user_style = 2,
                //    user_rank = 0,
                //    user_colour = "",
                //    user_new_privmsg = 0,
                //    user_unread_privmsg = 0,
                //    user_last_privmsg = 0,
                //    user_message_rules = 0,
                //    user_full_folder = -3,
                //    user_emailtime = 0,
                //    user_topic_show_days = 0,
                //    user_topic_sortby_type = "t",
                //    user_topic_sortby_dir = "d",
                //    user_post_show_days = 0,
                //    user_post_sortby_type = "t",
                //    user_post_sortby_dir = "a",
                //    user_notify = 0,
                //    user_notify_pm = 1,
                //    user_notify_type = 0,
                //    user_allow_pm = 1,
                //    user_allow_viewonline = 1,
                //    user_allow_viewemail = 1,
                //    user_allow_massemail = 1,
                //    user_options = 230271,
                //    user_avatar = "",
                //    user_avatar_type = 0,
                //    user_avatar_width = 0,
                //    user_avatar_height = 0,
                //    user_sig = "",
                //    user_sig_bbcode_uid = "",
                //    user_sig_bbcode_bitfield = "",
                //    user_from = "",
                //    user_icq = "",
                //    user_aim = "",
                //    user_yim = "",
                //    user_msnm = "",
                //    user_jabber = "",
                //    user_website = "",
                //    user_occ = "",
                //    user_interests = "",
                //    user_actkey = "8XC9FRJ9",
                //    user_newpasswd = "",
                //    user_form_salt = "52567f871eccdc80",
                //    user_new = 1,
                //    user_reminded = 0,
                //    user_reminded_time = 0
                //};

                //phpu.username = mail;
                //phpu.username_clean = mail;
                //phpu.user_email = mail;                               
                //dk.phpbb_users.InsertOnSubmit(phpu);
                //dk.SubmitChanges();

                //dk.phpbb_user_groups.InsertOnSubmit(new phpbb_user_group() { user_id = phpu.user_id, group_id = 2, group_leader = 0, user_pending = 0 });
                //dk.SubmitChanges();

                //dk.phpbb_user_groups.InsertOnSubmit(new phpbb_user_group() { user_id = phpu.user_id, group_id = 7, group_leader = 0, user_pending = 0 });
                //dk.SubmitChanges();
                #endregion

                //ScriptManager.RegisterStartupScript(this, this.GetType(), "AddPHP", " $(document).ready(function() {$.ajax({ type: 'post', data: 'password=" + usr.Senha.Trim() + "&email=" + usr.Email.Trim() + "', url: 'http://forum.afonsoft.com.br/UserAddScript.php', success: function (retorno) { $('#" + HiddenFieldReturnAjax.ClientID + "').value = retorno; } }); });  ", true);

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

