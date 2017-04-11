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
    public partial class updateUserForum : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateUserForumPHP();
            }
        }

        private void UpdateUserForumPHP()
        {
            DataKartDataContext dk = new DataKartDataContext();
            try
            {
                Usuario[] us = (from p in dk.Usuarios
                                where p.Ativo == true
                                select p).ToArray();

                foreach (Usuario u in us)
                {
                    //Verificar se exsite no forum
                    bool exiteForum = (from f in dk.phpbb_users
                                       where f.user_email == u.Email
                                       || f.username == u.Email
                                       select f).Count() > 0;

                    if (exiteForum == false)
                    {
                        //Efetuar o cadastro no Forum
                        phpbb_user phpu = new phpbb_user()
                        {
                            user_type = 1,
                            group_id = 2,
                            user_permissions = "",
                            user_perm_from = 0,
                            user_ip = "",
                            user_regdate = 1396623164,
                            username = "",
                            username_clean = "",
                            user_password = EncryptMd5(u.Senha),
                            user_passchg = 1396623164,
                            user_pass_convert = 0,
                            user_email = "",
                            user_email_hash = EncryptCrc32(u.Email + u.Email.Length.ToString()),
                            user_birthday = "",
                            user_lastvisit = 0,
                            user_lastmark = 1396623164,
                            user_lastpost_time = 0,
                            user_lastpage = "",
                            user_last_confirm_key = "",
                            user_last_search = 0,
                            user_warnings = 0,
                            user_last_warning = 0,
                            user_login_attempts = 0,
                            user_inactive_reason = 1,
                            user_inactive_time = 1396623164,
                            user_posts = 0,
                            user_lang = "pt_br",
                            user_timezone = -3,
                            user_dst = 1,
                            user_dateformat = "D M d, Y h:i",
                            user_style = 2,
                            user_rank = 0,
                            user_colour = "",
                            user_new_privmsg = 0,
                            user_unread_privmsg = 0,
                            user_last_privmsg = 0,
                            user_message_rules = 0,
                            user_full_folder = -3,
                            user_emailtime = 0,
                            user_topic_show_days = 0,
                            user_topic_sortby_type = "t",
                            user_topic_sortby_dir = "d",
                            user_post_show_days = 0,
                            user_post_sortby_type = "t",
                            user_post_sortby_dir = "a",
                            user_notify = 0,
                            user_notify_pm = 1,
                            user_notify_type = 0,
                            user_allow_pm = 1,
                            user_allow_viewonline = 1,
                            user_allow_viewemail = 1,
                            user_allow_massemail = 1,
                            user_options = 230271,
                            user_avatar = "",
                            user_avatar_type = 0,
                            user_avatar_width = 0,
                            user_avatar_height = 0,
                            user_sig = "",
                            user_sig_bbcode_uid = "",
                            user_sig_bbcode_bitfield = "",
                            user_from = "",
                            user_icq = "",
                            user_aim = "",
                            user_yim = "",
                            user_msnm = "",
                            user_jabber = "",
                            user_website = "",
                            user_occ = "",
                            user_interests = "",
                            user_actkey = Tools.UniqueKey.GetUniqueKey(8), //"8XC9FRJ9",
                            user_newpasswd = "",
                            user_form_salt = Tools.UniqueKey.GetUniqueKey(16, false, false), //"52567f871eccdc80",
                            user_new = 1,
                            user_reminded = 0,
                            user_reminded_time = 0
                        };

                        phpu.username = u.Email;
                        phpu.username_clean = u.Email;
                        phpu.user_email = u.Email;
                        phpu.user_password = EncryptMd5(u.Senha);
                        dk.phpbb_users.InsertOnSubmit(phpu);
                        dk.SubmitChanges();

                        dk.phpbb_user_groups.InsertOnSubmit(new phpbb_user_group() { user_id = phpu.user_id, group_id = 2, group_leader = 0, user_pending = 0 });
                        dk.SubmitChanges();

                        dk.phpbb_user_groups.InsertOnSubmit(new phpbb_user_group() { user_id = phpu.user_id, group_id = 7, group_leader = 0, user_pending = 0 });
                        dk.SubmitChanges();
                    }
                }
            }
            finally
            {
                if (dk != null)
                    dk.Dispose();
            }
        }
    }
}