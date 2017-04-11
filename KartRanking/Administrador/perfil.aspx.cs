using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using System.Data.Linq;
using KartRanking.Tools;
using KartRanking.email;

namespace KartRanking.Administrador
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)    *
    * DATA: 26-03-2014                                      *
    * E-MAIL: afonsoft@outlook.com.br                       *
    * *******************************************************
    * ALTERAÇÕES:                                           *
    * 04-04-2014 - phpbb Forum insert user                  *
    ********************************************************/
    public partial class perfil : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    //perfil.aspx?idUsuario={0}&Edit={1}&idGrupo={2}
                    bool EditUser = false;
                    int idUsuario = 0;
                    int idGrupo = 0;
                    Usuario user = null;
                    DataKartDataContext dk = new DataKartDataContext();
                    if (Request.QueryString["idUsuario"] != null)
                    {
                        idUsuario = Convert.ToInt16(Request.QueryString["idUsuario"]);
                        
                        if(Request.QueryString["idGrupo"] != null)
                            idGrupo = Convert.ToInt16(Request.QueryString["idGrupo"]);

                        if (idUsuario <= 0)
                            throw new Exception("Informações inválida!");

                        try { EditUser = Convert.ToBoolean(Request.QueryString["Edit"]); }
                        catch { EditUser = false; }

                        if (idGrupo > 0)
                        {
                            user = (from p in dk.Usuarios
                                    join g in dk.Kart_Usuario_Grupos on p.idUsuario equals g.idUsuario
                                    where p.idUsuario == idUsuario
                                    && g.idGrupo == idGrupo
                                    select p).FirstOrDefault();
                        }

                        if (user == null)
                        {
                            user = (from p in dk.Usuarios
                                    where p.idUsuario == idUsuario
                                    select p).FirstOrDefault();
                        }
                    }

                    else
                    {

                        user = (from p in dk.Usuarios
                                where p.idUsuario == UsuarioLogado.idUsuario
                                select p).FirstOrDefault();

                    }

                    if (user != null)
                    {
                        IdUsuario.Value = user.idUsuario.ToString();
                        txtNome.Text = user.Nome;
                        txtEmail.Text = user.Email;
                        txtEmail.ReadOnly = true;
                        txtDtNascimento.Text = user.DtNascimento.HasValue ? user.DtNascimento.Value.ToString("dd/MM/yyyy") : "";
                        txtApelido.Text = user.Apelido;
                        txtPeso.Text = user.Peso.ToString();
                        txtAltura.Text = user.Altura.ToString();
                        txtTelefone.Text = user.Telefone;
                        txtCelular.Text = user.Celular;
                        txtEndereco.Text = user.Endereco;
                        txtCidade.Text = user.Cidade;
                        if (!String.IsNullOrEmpty(user.Estado))
                            ddlEstado.Items.FindByValue(user.Estado).Selected = true;
                        if (user.Sexo.HasValue)
                            ddlSexo.Items.FindByValue(user.Sexo.Value.ToString()).Selected = true;

                        txtPerfilFacebook.Text = user.Perfil_Facebook;
                        txtPerfilTwitter.Text = user.Perfil_Twitter;
                        txtPerfilPlus.Text = user.Perfil_Plus;
                        txtObs.Text = user.Obs;
                        ImgPerfil.ImageUrl = "~/Administrador/ImageHandler.ashx?id=" + user.idUsuario;


                        if (EditUser && idGrupo > 0 && idUsuario > 0 && IsAdmin)
                        {
                            DesativarCampos(false);
                        }
                        else if (idUsuario == 0 || user.idUsuario == UsuarioLogado.idUsuario)
                            DesativarCampos(false);
                        else
                            DesativarCampos(true);
                    }
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message, "index.aspx");
            }
        }

        private void DesativarCampos(bool op)
        {
            txtNome.ReadOnly = op;
            txtDtNascimento.ReadOnly = op;
            txtApelido.ReadOnly = op;
            txtPeso.ReadOnly = op;
            ddlSexo.Enabled = !op;
            txtAltura.ReadOnly = op;
            ddlEstado.Enabled = !op;
            txtTelefone.ReadOnly = op;
            txtCelular.ReadOnly = op;
            txtEndereco.ReadOnly = op;
            txtCidade.ReadOnly = op;
            txtPerfilFacebook.ReadOnly = op;
            txtPerfilTwitter.ReadOnly = op;
            txtPerfilPlus.ReadOnly = op;
            txtObs.ReadOnly = op;
            btnAtualizar.Enabled = !op;
            lnkFile.Enabled = !op;
            btnAlterSenha.Visible = !op;
        }

        protected void lnkAlterarSenha_Click(object sender, EventArgs e)
        {
            try
            {
                DataKartDataContext dk = new DataKartDataContext();
                Usuario u = (from p in dk.Usuarios
                             where p.idUsuario == Convert.ToInt16(IdUsuario.Value)
                             select p).FirstOrDefault();

                if (u != null)
                {
                    if (u.Senha.Trim() != txtSenhaAntiga.Text.Trim())
                    {
                        Alert("A senha antiga não confere!");
                        return;
                    }
                    if (txtSenhaNova1.Text.Trim() != txtSenhaNova2.Text.Trim())
                    {
                        Alert("A senhas novas não confere!");
                        return;
                    }
                    u.Senha = txtSenhaNova1.Text.Trim();
                    dk.SubmitChanges(ConflictMode.FailOnFirstConflict);
                    
                    txtSenhaAntiga.Text = "";
                    txtSenhaNova1.Text = "";
                    txtSenhaNova2.Text = "";

                    phpbb_user userbb = (from f in dk.phpbb_users
                                         where f.user_email == u.Email
                                         || f.username == u.Email
                                         select f).FirstOrDefault();
                    if (userbb != null)
                    {
                        userbb.user_password = EncryptMd5(u.Senha);
                        userbb.user_email_hash = EncryptCrc32(u.Email + u.Email.Length.ToString());
                        dk.SubmitChanges();
                    }

                    Alert("Senha alterada com sucesso!");
                }
                else
                {
                    Alert("Erro para alterar a senha!\nTente mais tarde!");
                }
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }
        protected void btnAtualizar_Click(object sender, EventArgs e)
        {

            try
            {
                DataKartDataContext dk = new DataKartDataContext();
                Usuario u = (from p in dk.Usuarios
                             where p.idUsuario == Convert.ToInt16(IdUsuario.Value)
                             select p).FirstOrDefault();

                if (u != null)
                {

                    u.Nome = txtNome.Text;
                    //u.Email= txtEmail.Text;
                    u.Apelido = txtApelido.Text;
                    if (!string.IsNullOrEmpty(txtPeso.Text))
                        u.Peso = Convert.ToDecimal(txtPeso.Text);
                    if (!string.IsNullOrEmpty(txtAltura.Text))
                        u.Altura = Convert.ToDecimal(txtAltura.Text);
                    if (!string.IsNullOrEmpty(txtDtNascimento.Text))
                        u.DtNascimento = Convert.ToDateTime(txtDtNascimento.Text);

                    u.Telefone = txtTelefone.Text;
                    u.Celular = txtCelular.Text;
                    u.Endereco = txtEndereco.Text;
                    u.Cidade = txtCidade.Text;
                    u.Estado = ddlEstado.SelectedValue;
                    u.Sexo = Convert.ToChar(ddlSexo.SelectedValue);
                    u.Perfil_Facebook = txtPerfilFacebook.Text;
                    u.Perfil_Plus = txtPerfilPlus.Text;
                    u.Perfil_Twitter = txtPerfilTwitter.Text;
                    u.Obs = txtObs.Text;
                    u.MostarInfo = true;
                    u.Ativo = true;

                    dk.SubmitChanges(ConflictMode.FailOnFirstConflict);
                    
                    if (UsuarioLogado.idUsuario == u.idUsuario)
                        Session["Usuario"] = u;

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

                    Alert("Perfil atualizado com sucesso!", null, "/Administrador/home.aspx");
                }
                else
                    throw new Exception("Usuario não localizado na base!");
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

        protected void lnkUploadFile_Click(object sender, EventArgs e)
        {
            try
            {
                DataKartDataContext dk = new DataKartDataContext();
                if (!string.IsNullOrEmpty(flUpload.FileName))
                {
                    if (flUpload.HasFile)
                    {
                        if (flUpload.FileName.IndexOf(".jpg") > 0 || flUpload.FileName.IndexOf(".jpeg") > 0 || flUpload.FileName.IndexOf(".gif") > 0)
                        {
                            byte[] fl = flUpload.FileBytes;

                            //Convert a imagem para o tamanho correto.
                            System.Drawing.Image img = ImageUtil.ResizeImage(ImageUtil.BinaryToImage(fl), 170, 190, true);
                            byte[] newFl = ImageUtil.ImageToBinary(img);

                            Usuario u = (from p in dk.Usuarios
                                         where p.idUsuario == Convert.ToInt16(IdUsuario.Value)
                                         select p).FirstOrDefault();

                            if (u != null)
                            {
                                u.Foto = newFl;
                                dk.SubmitChanges(ConflictMode.FailOnFirstConflict);
                                ImgPerfil.ImageUrl = "~/Admin/ImageHandler.ashx?id=" + u.idUsuario;
                                Alert("Foto do perfil atualizado com sucesso.");
                            }
                            else
                                Alert("Usuário não localizado na base!");

                        }
                        else
                            Alert("O upload da foto tem de ser JPG, JPEG ou GIF");
                    }
                    else
                        Alert("Não foi possivel efetuar o upload, tente novamente!");
                }
            }
            catch (Exception)
            {
                Alert("O upload da foto tem de ser JPG, JPEG ou GIF");
            }
        }

        protected void lnkFile_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Open", "OpenFileUpload();", true);
        }

    }
}
