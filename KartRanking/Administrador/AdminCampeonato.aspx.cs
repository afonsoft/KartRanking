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
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
    public partial class AdminCampeonato : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ViewState["kgAtivo"] = true;
                    if (IdCampeonato > 0)
                    {
                        PopularTela(IdCampeonato, IdGrupo);
                        ltTitulo.Text = "Alteração do Campeonato";
                        ltDescricao.Text = "Efetuar alteração do Campeonato";
                        DisableEditCampeonato(true);
                        popularCalendario(IdCampeonato);
                        btnEditar.Visible = false;
                        btnNovo.Visible = false;
                        if (IsAdmin)
                        {
                            btnNovo.Visible = true;
                            btnEditar.Visible = true;
                        }
                    }
                    else
                    {
                        IdCampeonato = 0;
                        if (IsAdmin)
                        {
                            ltTitulo.Text = "Cadastro de um Campeonato";
                            ltDescricao.Text = "Efetuar cadastro de um Campeonato para o grupo";
                            DisableEditCampeonato(false);
                            btnEditar.Visible = false;
                            popularCalendario(0);
                        }
                        else
                        {
                            Alert("Você não possue permissão para criar um campeonato.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

        private void popularCalendario(int IdCampeonato)
        {
            //Listar as Etapas do Campeonato
            var Calendario_Campeonato = (from cc in dk.Kart_Calendario_Campeonatos
                                         where cc.idCampeonato == IdCampeonato
                                         orderby cc.Data ascending, cc.Ativo descending
                                         select cc);

            gvEtapas.DataSource = Calendario_Campeonato;
            gvEtapas.DataBind();
        }

        private void DisableEditCampeonato(bool p)
        {
            txtDtFim.ReadOnly = p;
            txtDtInicio.ReadOnly = p;
            txtNomeCampeonato.ReadOnly = p;
            ddlAtivo.Enabled = !p;
            btnSalvar.Visible = !p;
        }

        private void PopularTela(int idCampeonato, int idGrupo)
        {
            Kart_Campeonato kc = (from k in dk.Kart_Campeonatos where k.idGrupo == idGrupo && k.idCampeonato == idCampeonato select k).FirstOrDefault();

            if (kc != null)
            {
                ViewState["kgAtivo"] = kc.Ativo.HasValue ? kc.Ativo.Value : false;
                txtDtFim.Text = kc.dtFim.ToString("dd/MM/yyyy");
                txtDtInicio.Text = kc.dtInicio.ToString("dd/MM/yyyy");
                txtNomeCampeonato.Text = kc.NomeCampeonato;
                ddlAtivo.ClearSelection();
                ddlAtivo.Items.FindByValue(kc.Ativo.HasValue ? kc.Ativo.Value.ToString().ToLower() : "false").Selected = true;
            }
            else
                Alert("Erro para recuperar as informações do Campeonato.");

        }

        private void ValidarDatas()
        {
            try
            {
                DateTime dt = Convert.ToDateTime(txtDtInicio.Text);
                dt = Convert.ToDateTime(txtDtFim.Text);
            }
            catch
            {
                throw new Exception("Data Inválida!");
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                Kart_Campeonato kc = null;

                if (IdCampeonato > 0)
                {
                    if (IsAdmin)
                    {
                        kc = (from k in dk.Kart_Campeonatos
                              where k.idCampeonato == IdCampeonato && k.idGrupo == IdGrupo
                              select k).FirstOrDefault();
                    }
                    else
                    {
                        Alert("Você não possue permissão para editar este campeonato.");
                        return;
                    }
                }
                else
                {
                    kc = new Kart_Campeonato();
                    kc.idGrupo = IdGrupo;
                }
                ValidarDatas();

                kc.Ativo = Convert.ToBoolean(ddlAtivo.SelectedValue);
                kc.dtInicio = Convert.ToDateTime(txtDtInicio.Text);
                kc.dtFim = Convert.ToDateTime(txtDtFim.Text);
                kc.dtCriacao = DateTime.Now;
                kc.NomeCampeonato = txtNomeCampeonato.Text;

                if (IdCampeonato <= 0)
                    dk.GetTable<Kart_Campeonato>().InsertOnSubmit(kc);

                dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

                btnEditar.Text = "Editar";
                ddlAtivo.ClearSelection();
                ltTitulo.Text = "Alteração do Campeonato";
                ltDescricao.Text = "Efetuar alteração do Campeonato";
                if (ViewState["OldIdCampeonato"] != null)
                {
                    IdCampeonato = Convert.ToInt16(ViewState["OldIdCampeonato"]);
                    ViewState["OldIdCampeonato"] = null;
                }
                PopularTela(IdCampeonato, IdGrupo);
                DisableEditCampeonato(true);

                if (IdCampeonato > 0)
                    Alert("Alteração do Campeonato efetuado com sucesso!");
                else
                    Alert("Criação do Campeonato efetuado com sucesso!");

            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (!btnSalvar.Visible)
            {
                if (IsAdmin)
                {
                    btnEditar.Text = "Cancelar";
                    DisableEditCampeonato(false);
                }
                else
                {
                    Alert("Você não possue permissão para editar este campeonato.");
                    return;
                }
            }
            else
            {
                btnEditar.Text = "Editar";
                ddlAtivo.ClearSelection();
                ltTitulo.Text = "Alteração do Campeonato";
                ltDescricao.Text = "Efetuar alteração do Campeonato";
                if (ViewState["OldIdCampeonato"] != null)
                {
                    IdCampeonato = Convert.ToInt16(ViewState["OldIdCampeonato"]);
                    ViewState["OldIdCampeonato"] = null;
                    PopularTela(IdCampeonato, IdGrupo);
                }
                DisableEditCampeonato(true);
            }
        }

        protected void btnNovo_Click(object sender, EventArgs e)
        {
            if (IsAdmin)
            {
                ViewState["OldIdCampeonato"] = IdCampeonato;
                IdCampeonato = 0;
                ltTitulo.Text = "Cadastro de um Campeonato";
                ltDescricao.Text = "Efetuar cadastro de um Campeonato para o grupo";
                DisableEditCampeonato(false);
                txtDtFim.Text = DateTime.Now.ToString("dd/MM/yyyy");
                txtDtInicio.Text = DateTime.Now.AddYears(1).ToString("dd/MM/yyyy");
                txtNomeCampeonato.Text = "";
                ddlAtivo.ClearSelection();
                btnEditar.Text = "Cancelar";

            }
            else
            {
                Alert("Você não possue permissão para editar este campeonato.");
            }
        }

        protected void gvEtapas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCalendario")
            {
                int idCalendario = Convert.ToInt16(e.CommandArgument);
                Response.Redirect("CalendarioProvas.aspx?idGrupo=" + IdGrupo + "&IdCampeonato=" + IdCampeonato + "&idCalendario=" + idCalendario);
            }
        }
    }
}