﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.BaseDados;
using System.Data.Linq;
using KartRanking.Page;
using KartRanking.Tools;

namespace KartRanking
{
    public partial class MeusDados : PageBaseSecurity
    {

        bool Desativado = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    //MeusDados.aspx?idUsuario={0}&Edit={1}&idGrupo={2}
                    bool EditUser = false;
                    int idUsuario = 0;
                    int idGrupo = 0;
                    Usuario user = null;

                    if (Request.QueryString["idUsuario"] != null && Request.QueryString["Edit"] != null && Request.QueryString["idGrupo"] != null)
                    {
                        idUsuario = Convert.ToInt16(Request.QueryString["idUsuario"]);
                        idGrupo = Convert.ToInt16(Request.QueryString["idGrupo"]);

                        if (idGrupo <= 0 || idUsuario <= 0)
                            throw new Exception("Informações inválida!");

                        Session["idGrupo"] = idGrupo;

                        try { EditUser = Convert.ToBoolean(Request.QueryString["Edit"]); }
                        catch { EditUser = false; }

                        user = (from p in dk.Usuarios
                                join g in dk.Kart_Usuario_Grupos on p.idUsuario equals g.idUsuario
                                where p.idUsuario == idUsuario
                                && g.idGrupo == idGrupo
                                select p).FirstOrDefault();
                    }
                    else
                    {
                        user = (Usuario)Session["Usuario"];

                        user = (from p in dk.Usuarios
                                where p.idUsuario == user.idUsuario
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
                        ImgPerfil.ImageUrl = "~/Admin/ImageHandler.ashx?id=" + user.idUsuario;

   
                        if (EditUser && idGrupo > 0 && idUsuario > 0 && IsAdmin)
                        {
                            DesativarCampos(false);
                        }
                        else if (idUsuario == 0 || user.idUsuario == ((Usuario)Session["Usuario"]).idUsuario)
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
            Desativado = op;
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
        }

        protected void btnAtualizar_Click(object sender, EventArgs e)
        {

            try
            {
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
                if (!Desativado)
                {
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
                else
                {
                    Alert("Você não pode modificar a foto deste usuário.");
                }
            }
            catch (Exception)
            {
                Alert("O upload da foto tem de ser JPG, JPEG ou GIF");
            }
        }
    }
}