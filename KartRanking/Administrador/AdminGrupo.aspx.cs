using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.email;
using KartRanking.BaseDados;

namespace KartRanking.Administrador
{
    public partial class AdminGrupo : PageBaseSecurity
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ltTitulo.Text = "Informações do Grupo";
                ltDescricao.Text = "Efetuar alteração do Grupo";

                if (IdGrupo > 0)
                {
                    popularTela(IdGrupo);
                    DisableEditGrupo(true);
                    CarregarCampeonato(IdGrupo);
                    CarregarGruposDesativados();
                }
                else
                {
                    ltTitulo.Text = "Cadastro do Grupo";
                    ltDescricao.Text = "Efetuar um cadastro de um Grupo";
                    DisableEditGrupo(false);
                    btnEditar.Visible = false;
                }
            }
        }

        private void CarregarGruposDesativados()
        {
            Usuario user = (Usuario)Session["Usuario"];

            var Grupos = (from gu in dk.Kart_Usuario_Grupos
                          join g in dk.Kart_Grupos
                          on gu.idGrupo equals g.idGrupo
                          orderby g.dtCriacao descending
                          where gu.idUsuario == user.idUsuario
                          && g.Ativo == false
                          select new { id = g.idGrupo, Nome = g.NomeGrupo });
            
            ddlGruposDesativados.Items.Clear();
            if (Grupos != null && Grupos.Count() > 0)
            {
                ddlGruposDesativados.DataSource = Grupos;
                ddlGruposDesativados.DataTextField = "Nome";
                ddlGruposDesativados.DataValueField = "id";
                ddlGruposDesativados.DataBind();
            }
            else
            {
                ddlGruposDesativados.Items.Insert(0, new ListItem("Nenhum Grupo Desativado", "0", true));
            }
        }

        private void CarregarCampeonato(int idGrupo)
        {
            Usuario user = (Usuario)HttpContext.Current.Session["Usuario"];

            var Campeonatos = (from c in dk.Kart_Campeonatos
                               where c.idGrupo == idGrupo
                               orderby c.idGrupo descending
                               select new
                               {
                                   idCampeonato = c.idCampeonato,
                                   NomeCampeonato = c.NomeCampeonato,
                                   dtInicio = c.dtInicio,
                                   dtFim = c.dtFim,
                                   Ativo = c.Ativo.Value ? "Sim" : "Não",
                                   idGrupo = c.idGrupo
                               });

            gvCampeonatos.DataSource = Campeonatos;
            gvCampeonatos.DataBind();
        }

        private void DisableEditGrupo(bool p)
        {
            txtNomeGrupo.ReadOnly = p;
            txtSigla.ReadOnly = p;
            txtUrlAcesso.ReadOnly = p;
            txtCidade.ReadOnly = p;
            ddlEstado.Enabled = !p;
            btnSalvar.Visible = !p;
        }

        private void popularTela(int idGrupo)
        {
            Kart_Grupo gr = (from g in dk.Kart_Grupos where g.idGrupo == idGrupo select g).FirstOrDefault();

            if (gr != null)
            {
                txtNomeGrupo.Text = gr.NomeGrupo;
                txtSigla.Text = gr.Sigla;
                txtUrlAcesso.Text = gr.UrlAcesso;
                txtCidade.Text = gr.Cidade;
                ddlEstado.Items.FindByValue(gr.Estado).Selected = true;
            }
            else
                Alert("Informações não encontrada para esse grupo!", "index.aspx?IdGrupo=" + Request.QueryString["IdGrupo"]);
        }

        private bool VerificarPermissaoUsuarioGrupo(int idGrupo)
        {
            Usuario user = (Usuario)Session["Usuario"];

            var grupoAdmin = (from gu in dk.Kart_Usuario_Grupos
                              where gu.idUsuario == user.idUsuario
                              && gu.idGrupo == idGrupo
                              select new { gu.Admin }).FirstOrDefault();

            if (grupoAdmin != null && grupoAdmin.Admin.HasValue)
                return grupoAdmin.Admin.Value;
            else
                return false;
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario user = (Usuario)Session["Usuario"];
                Kart_Grupo kg = null;
                int idGrupo = Convert.ToInt16(HiddenIdGrupo.Value);

                ValidarCampos();

                if (idGrupo <= 0)
                {
                    int count = (from g in dk.Kart_Grupos
                                 where g.Sigla.Equals(txtSigla.Text)
                                 || g.NomeGrupo.Equals(txtNomeGrupo.Text)
                                 || g.UrlAcesso.Equals(txtUrlAcesso.Text)
                                 select g).Count();

                    if (count > 0)
                        throw new Exception("Já existe um grupo cadastro com essas informações!");

                    kg = new Kart_Grupo();

                    kg.Id_Usuario_Lider = user.idUsuario;
                    kg.NomeGrupo = txtNomeGrupo.Text;
                    kg.permitirInsricoes = Convert.ToBoolean(ddlPermitirInscricoes.SelectedValue);
                    kg.Sigla = txtSigla.Text;
                    kg.UrlAcesso = txtUrlAcesso.Text;
                    kg.Ativo = true;
                    kg.Cidade = txtCidade.Text;
                    kg.dtCriacao = DateTime.Now;
                    kg.Estado = ddlEstado.SelectedValue;

                    dk.GetTable<Kart_Grupo>().InsertOnSubmit(kg);

                    dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

                    int NovoIdGrupo = kg.idGrupo;

                    Kart_Usuario_Grupo ug = new Kart_Usuario_Grupo();
                    ug.idGrupo = NovoIdGrupo;
                    ug.idUsuario = user.idUsuario;
                    ug.Admin = true;
                    ug.Aprovado = true;
                    ug.dtCriacao = DateTime.Now;

                    dk.GetTable<Kart_Usuario_Grupo>().InsertOnSubmit(ug);

                    dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

                    EMail.EnviarEmailStatusGrupo(user.idUsuario, kg.idGrupo);

                    Alert("Cadastro do Grupo efetuado com sucesso!", "PainelControle.aspx?IdGrupo=" + NovoIdGrupo);
                }
                else
                {
                    kg = (from g in dk.Kart_Grupos
                          where g.idGrupo == idGrupo
                          select g).FirstOrDefault();

                    if (kg.NomeGrupo != txtNomeGrupo.Text)
                    {
                        int count = (from g in dk.Kart_Grupos
                                     where g.NomeGrupo.Equals(txtNomeGrupo.Text)
                                     select g).Count();

                        if (count > 0)
                            throw new Exception("Já existe um grupo cadastro com esse Nome!");
                    }

                    if (kg.Sigla != txtSigla.Text)
                    {
                        int count = (from g in dk.Kart_Grupos
                                     where g.Sigla.Equals(txtSigla.Text)
                                     select g).Count();

                        if (count > 0)
                            throw new Exception("Já existe um grupo cadastro com essa Sigla!");
                    }

                    if (kg.UrlAcesso != txtUrlAcesso.Text)
                    {
                        int count = (from g in dk.Kart_Grupos
                                     where g.UrlAcesso.Equals(txtUrlAcesso.Text)
                                     select g).Count();

                        if (count > 0)
                            throw new Exception("Já existe um grupo cadastro com essa Url!");
                    }

                    kg.Id_Usuario_Lider = user.idUsuario;
                    kg.NomeGrupo = txtNomeGrupo.Text;
                    kg.permitirInsricoes = Convert.ToBoolean(ddlPermitirInscricoes.SelectedValue);
                    kg.Sigla = txtSigla.Text;
                    kg.UrlAcesso = txtUrlAcesso.Text;
                    kg.Ativo = true;
                    kg.Cidade = txtCidade.Text;
                    kg.dtCriacao = DateTime.Now;
                    kg.Estado = ddlEstado.SelectedValue;

                    dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

                    EMail.EnviarEmailStatusGrupo(user.idUsuario, kg.idGrupo);

                    Alert("Alteração do grupo efetuado com sucesso!", "PainelControle.aspx?IdGrupo=" + Request.QueryString["IdGrupo"]);
                }

            }
            catch (Exception ex)
            {
                Alert(ex);
            }

        }

        private void ValidarCampos()
        {
            if (String.IsNullOrEmpty(txtNomeGrupo.Text))
                throw new Exception("Nome do grupo obrigatório.");
            if (String.IsNullOrEmpty(txtSigla.Text))
                throw new Exception("Sigla do grupo obrigatório.");
            if (String.IsNullOrEmpty(txtUrlAcesso.Text))
                throw new Exception("Url do grupo obrigatório.");
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (VerificarPermissaoUsuarioGrupo(IdGrupo))
                DisableEditGrupo(false);
            else 
                Alert("Você não é o administrador deste grupo.");
        }

        protected void gvCampeonatos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            IdCampeonato = Convert.ToInt16(e.CommandArgument);

            if (e.CommandName == "EditCampeonato")
            {
                Response.Redirect("AdminCampeonato.aspx?IdGrupo=" + IdGrupo.ToString() + "&IdCampeonato=" + IdCampeonato.ToString());
            }
            else if(e.CommandName == "EditClassif")
            {
                Response.Redirect("AdminCampeonato.aspx?IdGrupo=" + IdGrupo.ToString() + "&IdCampeonato=" + IdCampeonato.ToString());
            }
        }

        protected void ddlGruposDesativados_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(ddlGruposDesativados.SelectedValue);
            popularTela(id);
            DisableEditGrupo(false);
            CarregarCampeonato(id);
        }
    }
}
