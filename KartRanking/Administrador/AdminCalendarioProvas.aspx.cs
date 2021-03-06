﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using KartRanking.Tools;

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
    public partial class AdminCalendarioProvas : PageBaseSecurity
    {
        private int IdCalendario
        {
            get
            {
                if (ViewState["IdCalendario"] != null)
                    return Convert.ToInt16(ViewState["IdCalendario"]);
                else
                    return 0;
            }
            set
            {
                ViewState["IdCalendario"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["kgAtivo"] = true;
                if (Request.QueryString["idCalendario"] != null)
                    IdCalendario = Convert.ToInt16(Request.QueryString["idCalendario"]);
                if (Request.QueryString["IdCampeonato"] != null)
                    IdCampeonato = Convert.ToInt16(Request.QueryString["IdCampeonato"]);

                popularCampeonatos(IdGrupo, IdCampeonato);
                popularEtapas(IdCampeonato);

                if (IdCalendario > 0)
                    popularTelaEdit(IdCampeonato, IdCalendario);

                if (Request.QueryString["op"] != null)
                {
                    string op = Request.QueryString["op"];
                    if (op == "novo")
                        btnNovoCalendario_Click(sender, e);
                }
            }
        }

        private void popularCampeonatos(int idGrupo, int idCampeonato)
        {
            DataKartDataContext dk = new DataKartDataContext();
            var kg = (from g in dk.Kart_Campeonatos
                      where g.idGrupo == idGrupo
                      && (g.Ativo == true || g.idCampeonato == idCampeonato)
                      orderby g.Ativo descending
                      select new { Text = g.NomeCampeonato, Value = g.idCampeonato, Ativo = g.Ativo, g.idCampeonato });

            ddlCampeonatos.Items.Clear();
            ddlCampeonatos.DataSource = kg;
            ddlCampeonatos.DataTextField = "Text";
            ddlCampeonatos.DataValueField = "Value";
            ddlCampeonatos.DataBind();

            if (ddlCampeonatos.Items.Count <= 0)
                ddlCampeonatos.Items.Add(new ListItem("Nenhum campeonato neste grupo", "0"));
            else if (idCampeonato > 0)
            {
                ControlUtil.SelectByValue(ref ddlCampeonatos, idCampeonato.ToString());
                bool? kgAtivo = (from k in kg where k.idCampeonato == idCampeonato select k.Ativo).FirstOrDefault();
                ViewState["kgAtivo"] = kgAtivo.HasValue ? kgAtivo.Value : false;
            }
        }

        private void popularEtapas(int idCampeonato)
        {
            DataKartDataContext dk = new DataKartDataContext();
            bool? kgAtivo = (from g in dk.Kart_Campeonatos
                        where g.idGrupo == IdGrupo
                        && g.idCampeonato == idCampeonato
                        select g.Ativo).FirstOrDefault();
            ViewState["kgAtivo"] = kgAtivo.HasValue? kgAtivo.Value : false;

            //Listar as Etapas do Campeonato
            var Calendario_Campeonato = (from cc in dk.Kart_Calendario_Campeonatos
                                         where cc.idCampeonato == idCampeonato
                                         orderby cc.Data ascending
                                         select cc);

            gvEtapas.DataSource = Calendario_Campeonato;
            gvEtapas.DataBind();
        }

        protected void ddlCampeonatos_SelectedIndexChanged(object sender, EventArgs e)
        {
            popularEtapas(Convert.ToInt16(ddlCampeonatos.SelectedValue));
        }

        private void popularTelaEdit(int idCampeonato, int idCalendario)
        {
            DataKartDataContext dk = new DataKartDataContext();
            Kart_Calendario_Campeonato cc = (from c in dk.Kart_Calendario_Campeonatos
                                             where c.idCalendario == idCalendario
                                             && c.idCampeonato == IdCampeonato
                                             select c).FirstOrDefault();
            if (cc != null)
            {
                ltData.Text = cc.Data.ToString("dd/MM/yyyy");
                ltHora.Text = cc.Horario;
                ltKartodromo.Text = cc.Kartodromo;
                ltEtapa.Text = cc.Nome;
                PanelEditar.Visible = true;
                PanelSelecionar.Visible = false;
            }
            else
            {
                Alert("Calendário não localizado na base! IdGrupo: " + IdGrupo + " idCampeonato: " + idCampeonato + " idCalendario: " + idCalendario);
            }
        }

        protected void gvEtapas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (IsAdmin)
            {
                bool b = (bool)ViewState["kgAtivo"];
                IdCalendario = Convert.ToInt16(e.CommandArgument);
                if (e.CommandName == "EditCalendario" && b)
                    popularTelaEdit(IdCampeonato, IdCalendario);
                else if (e.CommandName == "ExcluirCalendario" && b)
                    excluirCalendario(IdCampeonato, IdCalendario);
            }
            else
            {
                Alert("Você não possue permissão.");
            }
        }

        private void excluirCalendario(int IdCampeonato, int idCalendario)
        {
            if (IsAdmin)
            {
                try
                {
                    DataKartDataContext dk = new DataKartDataContext();
                    Kart_Calendario_Campeonato cc = (from c in dk.Kart_Calendario_Campeonatos
                                                     where c.idCalendario == idCalendario
                                                     && c.idCampeonato == IdCampeonato
                                                     select c).FirstOrDefault();

                    dk.Kart_Calendario_Campeonatos.DeleteOnSubmit(cc);
                    dk.SubmitChanges();

                    popularEtapas(IdCampeonato);

                    Alert("Etapa excluida com sucesso.");

                }
                catch (Exception)
                {
                    Alert("Não é possivel excluir essa etapa!");
                }
            }
            else
            {
                Alert("Você não possue permissão.");
            }
        }
        protected void btnVoltarCampeonato_Click(object sender, EventArgs e)
        {
            if (IdCampeonato > 0)
                Response.Redirect("CalendarioProvas.aspx?IdGrupo=" + IdGrupo.ToString() + "&IdCampeonato=" + IdCampeonato.ToString());
            else
                Response.Redirect("AdminCampeonato.aspx?IdGrupo=" + IdGrupo.ToString());
        }
        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            PanelEditar.Visible = false;
            PanelSelecionar.Visible = true;
        }
        protected void btnNovoCalendario_Click(object sender, EventArgs e)
        {
            IdCalendario = 0;
            ltData.Text = DateTime.Now.ToString("dd/MM/yyyy");
            ltHora.Text = "";
            ltKartodromo.Text = "";
            ltEtapa.Text = "";
            PanelEditar.Visible = true;
            PanelSelecionar.Visible = false;
        }
        protected void btnAlterar_Click(object sender, EventArgs e)
        {
            try
            {

                if (ValidarCampos())
                {
                    DataKartDataContext dk = new DataKartDataContext();
                    Kart_Calendario_Campeonato cc = null;

                    if (IdCalendario <= 0)
                        cc = new Kart_Calendario_Campeonato();
                    else
                        cc = (from c in dk.Kart_Calendario_Campeonatos
                              where c.idCalendario == IdCalendario
                              && c.idCampeonato == IdCampeonato
                              select c).FirstOrDefault();

                    cc.Data = Convert.ToDateTime(ltData.Text);
                    cc.Horario = ltHora.Text;
                    cc.idCampeonato = IdCampeonato;
                    cc.Kartodromo = ltKartodromo.Text;
                    cc.Nome = ltEtapa.Text;

                    if (IdCalendario <= 0)
                        dk.GetTable<Kart_Calendario_Campeonato>().InsertOnSubmit(cc);

                    dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);
                    
                    btnVoltar_Click(sender, e);
                    popularEtapas(IdCampeonato);
                    Alert("Etapa salvo com sucesso!");
                }
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }
        private bool ValidarCampos()
        {
            string msgErro = "";
            try
            {
                Convert.ToDateTime(ltData.Text);
            }
            catch (Exception)
            {
                msgErro += "Data informada é inválida!\n";
            }

            if(string.IsNullOrEmpty(ltHora.Text))
                msgErro += "Horário é inválida ou não informado!\n";

            if (string.IsNullOrEmpty(ltKartodromo.Text))
                msgErro += "Kartodromo não informado!\n";

            if (string.IsNullOrEmpty(ltEtapa.Text))
                msgErro += "Etapa não informado!\n";


            if (string.IsNullOrEmpty(msgErro))
                return true;
            else
            {
                Alert(msgErro);
                return false;
            }
        }
    }
}