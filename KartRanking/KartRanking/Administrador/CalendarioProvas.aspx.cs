using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.Tools;

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
                ViewState["kgAtivo"] = true;
                popularCampeonatos(IdGrupo, IdCampeonato);
                popularEtapas(IdCampeonato);
                
                PanelSelecionar.Visible = true;
                PanelGridEtapa.Visible = false;

                btnNovoCalendario.Visible = false;
                imgAdd1.Visible = false;
                imgAdd2.Visible = false;

                if (IsAdmin && (bool)ViewState["kgAtivo"])
                {
                    btnNovoCalendario.Visible = true;
                    imgAdd1.Visible = true;
                    imgAdd2.Visible = true;
                }
                if (Request.QueryString["IdCalendario"] != null)
                {
                    IdCalendario = Convert.ToInt32(Request.QueryString["IdCalendario"]);
                    if (IdCalendario > 0)
                    {
                        popularTelaEtapa(IdCalendario);
                        PopularDDL(IdCalendario);
                    }
                }
            }
        }

        private void PopularDDL(int idCalendario)
        {

            //recuperar somente os usuarios que não está cadastro no resultados.
            var PilotosEtapa = from kart_usuario_grupos in dk.Kart_Usuario_Grupos
                               join usuarios in dk.Usuarios on kart_usuario_grupos.idUsuario equals usuarios.idUsuario
                               join kart_campeonatos in dk.Kart_Campeonatos on kart_usuario_grupos.idGrupo equals kart_campeonatos.idGrupo
                               join kart_calendario_campeonatos in dk.Kart_Calendario_Campeonatos on kart_campeonatos.idCampeonato equals kart_calendario_campeonatos.idCampeonato
                               where !(from a in dk.Kart_Resultado_Calendarios
                                        where a.idCalendario == kart_calendario_campeonatos.idCalendario
                                        select new { a.idUsuario}).Contains(new { usuarios.idUsuario }) 
                                    && kart_usuario_grupos.idGrupo == IdGrupo 
                                    && kart_calendario_campeonatos.idCalendario == idCalendario
                               select new
                               {
                                   idUsuario = (System.Int32?)kart_usuario_grupos.idUsuario,
                                   usuarios.Nome
                               };

            ddlEtapaPilotoDisponivel.DataSource = PilotosEtapa;
            ddlEtapaPilotoDisponivel.DataTextField = "Nome";
            ddlEtapaPilotoDisponivel.DataValueField = "idUsuario";
            ddlEtapaPilotoDisponivel.DataBind();

            var Pilotos = from kart_usuario_grupos in dk.Kart_Usuario_Grupos
                          join usuarios in dk.Usuarios on kart_usuario_grupos.idUsuario equals usuarios.idUsuario
                          join kart_campeonatos in dk.Kart_Campeonatos on kart_usuario_grupos.idGrupo equals kart_campeonatos.idGrupo
                          join kart_calendario_campeonatos in dk.Kart_Calendario_Campeonatos on kart_campeonatos.idCampeonato equals kart_calendario_campeonatos.idCampeonato
                          where
                            !
                              (from a in dk.Kart_Grid_Calendarios
                               where
                                 a.idCalendario == kart_calendario_campeonatos.idCalendario
                               select new
                               {
                                   a.idUsuario
                               }).Contains(new { usuarios.idUsuario }) &&
                                kart_usuario_grupos.idGrupo == IdGrupo &&
                                kart_calendario_campeonatos.idCalendario == idCalendario
                          select new
                          {
                              idUsuario = (System.Int32?)kart_usuario_grupos.idUsuario,
                              usuarios.Nome
                          };

            ddlGridPilotoDisponivel.DataSource = Pilotos;
            ddlGridPilotoDisponivel.DataTextField = "Nome";
            ddlGridPilotoDisponivel.DataValueField = "idUsuario";
            ddlGridPilotoDisponivel.DataBind();
        }

        private void popularCampeonatos(int idGrupo, int idCampeonato)
        {
            var kg = (from g in dk.Kart_Campeonatos
                      where g.idGrupo == idGrupo
                      && (g.Ativo == true || g.idCampeonato == idCampeonato)
                      select new { Text = g.NomeCampeonato, Value = g.idCampeonato, g.Ativo, g.idCampeonato });

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

            if(ddlCampeonatos.SelectedIndex >= 0 )
                IdCampeonato = Convert.ToInt16(ddlCampeonatos.SelectedValue);
        }

        private void popularEtapas(int idCampeonato)
        {
            bool? kgAtivo = (from g in dk.Kart_Campeonatos
                             where g.idGrupo == IdGrupo
                             && g.idCampeonato == idCampeonato
                             select g.Ativo).FirstOrDefault();

            ViewState["kgAtivo"] = kgAtivo.HasValue ? kgAtivo.Value : false;

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
            IdCalendario = Convert.ToInt16(e.CommandArgument);
            if (e.CommandName == "EditCalendario")
                popularTelaEtapa(IdCalendario);
        }

        private void popularTelaEtapa(int idCalendario)
        {

            lbCalendarioSelecionado.Text = (from cc in dk.Kart_Calendario_Campeonatos
                                            where cc.idCalendario == idCalendario
                                            select cc.Nome).FirstOrDefault();

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

            PopularDDL(idCalendario);
            PanelSelecionar.Visible = false;
            PanelGridEtapa.Visible = true;

            if (!IsAdmin || !(bool)ViewState["kgAtivo"])
            {
                if (gvGrid.Rows.Count > 0)
                {
                    gvGrid.HeaderRow.Cells[4].Visible = false;
                    gvGrid.FooterRow.Cells[4].Visible = false;
                    foreach (GridViewRow r in gvGrid.Rows)
                        r.Cells[4].Visible = false;
                }
                if (gvResultados.Rows.Count > 0)
                {
                    gvResultados.HeaderRow.Cells[5].Visible = false;
                    gvResultados.FooterRow.Cells[5].Visible = false;
                    foreach (GridViewRow r in gvResultados.Rows)
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
                ScriptManager.RegisterStartupScript(PanelGridEtapa, PanelGridEtapa.GetType(), "AbrirGrid", "OpenGrid(0,1);", true);
            else
                ScriptManager.RegisterStartupScript(PanelGridEtapa, PanelGridEtapa.GetType(), "AbrirEtapa", "OpenEtapa(0,2);", true);   
        }

        protected void lnkAtualizaGridEtapa_Click(object sender, EventArgs e)
        {

        }
    }
}
