﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;

namespace KartRanking.Administrador
{
    public partial class CalendarioProvas : PageBaseSecurity
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
                popularCampeonatos(IdGrupo, IdCampeonato);
                popularEtapas(IdCampeonato);

                PanelSelecionar.Visible = true;
                PanelGridEtapa.Visible = false;

                btnNovoCalendario.Visible = false;
                imgAdd1.Visible = false;
                imgAdd2.Visible = false;

                if (IsAdmin)
                {
                    btnNovoCalendario.Visible = true;
                    imgAdd1.Visible = true;
                    imgAdd2.Visible = true;
                }
            }
        }

        private void popularCampeonatos(int idGrupo, int idCampeonato)
        {
            var kg = (from g in dk.Kart_Campeonatos
                      where g.idGrupo == idGrupo
                      && g.Ativo == true
                      select new { Text = g.NomeCampeonato, Value = g.idCampeonato });

            ddlCampeonatos.Items.Clear();
            ddlCampeonatos.DataSource = kg;
            ddlCampeonatos.DataTextField = "Text";
            ddlCampeonatos.DataValueField = "Value";
            ddlCampeonatos.DataBind();

            if (ddlCampeonatos.Items.Count <= 0)
                ddlCampeonatos.Items.Add(new ListItem("Nenhum campeonato neste grupo", "0"));
            else if (idCampeonato > 0)
                ddlCampeonatos.Items.FindByValue(idCampeonato.ToString()).Selected = true;

            if(ddlCampeonatos.SelectedIndex >= 0 )
                IdCampeonato = Convert.ToInt16(ddlCampeonatos.SelectedValue);
        }

        private void popularEtapas(int idCampeonato)
        {
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
        protected void btnNovoCalendario_Click(object sender, EventArgs e)
        {
            IdCalendario = 0;
            Response.Redirect("AdminCalendarioProvas.aspx?op=novo&IdCampeonato=" + IdCampeonato);
        }

        protected void gvEtapas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idCalendario = Convert.ToInt16(e.CommandArgument);
            if (e.CommandName == "EditCalendario")
            {
                IdCalendario = idCalendario;
                popularTelaEtapa(idCalendario);
            }
        }

        private void popularTelaEtapa(int idCalendario)
        {
            var grid = (from g in dk.Kart_Grid_Calendarios
                        join u in dk.Usuarios on g.idUsuario equals u.idUsuario
                        join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                        join ue in dk.Kart_Usuario_Equipe_Campeonatos on u.idUsuario equals ue.idUsuario
                        join e in dk.Kart_Equipe_Campeonatos on ue.idEquipeCampeonato equals e.idEquipeCampeonato
                        join eg in dk.Kart_Campeonatos on e.idCampeonato equals eg.idCampeonato
                        where g.idCalendario == idCalendario
                        && ue.idUsuario == g.idUsuario
                        && ue.idEquipeCampeonato == g.idEquipe
                        && eg.idGrupo == ug.idGrupo
                        && ug.idGrupo == IdGrupo
                        && eg.idCampeonato == IdCampeonato
                        && ug.Aprovado == true
                        orderby g.Pos ascending
                        select new
                        {
                            g.idGrid,
                            g.idCalendario,
                            g.idEquipe,
                            g.Pos,
                            tempo = g.tempoMinutos.ToString().PadLeft(2, '0') + ":" + g.tempoSegundos.ToString().PadLeft(2, '0') + ":" + g.tempoMilisegundos.ToString().PadLeft(3, '0'),
                            u.Nome,
                            e.NomeEquipe
                        });

            gvGrid.DataSource = grid;
            gvGrid.DataBind();

            var Resultado = (from g in dk.Kart_Resultado_Calendarios
                             join u in dk.Usuarios on g.idUsuario equals u.idUsuario
                             join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                             join ue in dk.Kart_Usuario_Equipe_Campeonatos on u.idUsuario equals ue.idUsuario
                             join e in dk.Kart_Equipe_Campeonatos on ue.idEquipeCampeonato equals e.idEquipeCampeonato
                             join eg in dk.Kart_Campeonatos on e.idCampeonato equals eg.idCampeonato
                             where g.idCalendario == idCalendario
                             && ue.idUsuario == g.idUsuario
                             && ue.idEquipeCampeonato == g.idEquipe
                             && eg.idGrupo == ug.idGrupo
                             && ug.idGrupo == IdGrupo
                             && eg.idCampeonato == IdCampeonato
                             && ug.Aprovado == true
                             orderby g.Pos ascending
                             select new
                             {
                                 g.idResultado,
                                 g.Ponto,
                                 g.idCalendario,
                                 g.idEquipe,
                                 g.Pos,
                                 tempo = g.tempoMinutos.ToString().PadLeft(2, '0') + ":" + g.tempoSegundos.ToString().PadLeft(2, '0') + ":" + g.tempoMilisegundos.ToString().PadLeft(3, '0'),
                                 u.Nome,
                                 e.NomeEquipe
                             });

            gvResultados.DataSource = Resultado;
            gvResultados.DataBind();
            PanelSelecionar.Visible = false;
            PanelGridEtapa.Visible = true;

            if (!IsAdmin)
            {
                if (gvGrid.Rows.Count > 0)
                {
                    gvGrid.HeaderRow.Cells[4].Visible = false;
                    gvGrid.FooterRow.Cells[4].Visible = false;
                    foreach (GridViewRow r in gvGrid.Rows)
                        r.Cells[4].Visible = false;
                }
                if (gvEtapas.Rows.Count > 0)
                {
                    gvEtapas.HeaderRow.Cells[5].Visible = false;
                    gvEtapas.FooterRow.Cells[5].Visible = false;
                    foreach (GridViewRow r in gvEtapas.Rows)
                        r.Cells[5].Visible = false;
                }
            }

        }

        protected void BtnVoltarSelecionar_Click(object sender, EventArgs e)
        {
            PanelSelecionar.Visible = true;
            PanelGridEtapa.Visible = false;
        }

        protected void gvGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvResultados_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void imgAdd_Click(object sender, ImageClickEventArgs e)
        {
            string op = ((ImageButton)sender).CommandArgument;
            if (op == "1")
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirGrid", "OpenGrid(0,1);", true);
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirEtapa", "OpenEtapa(0,2);", true);
            
        }

        protected void lnkAtualizaGridEtapa_Click(object sender, EventArgs e)
        {

        }
    }
}