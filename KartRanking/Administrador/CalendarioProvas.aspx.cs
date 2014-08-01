using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.Tools;
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
            var PilotosEtapa = (from kart_usuario_grupos in dk.Kart_Usuario_Grupos
                                join usuarios in dk.Usuarios on kart_usuario_grupos.idUsuario equals usuarios.idUsuario
                                join kart_campeonatos in dk.Kart_Campeonatos on kart_usuario_grupos.idGrupo equals kart_campeonatos.idGrupo
                                join kart_calendario_campeonatos in dk.Kart_Calendario_Campeonatos on kart_campeonatos.idCampeonato equals kart_calendario_campeonatos.idCampeonato
                                where !(from a in dk.Kart_Resultado_Calendarios
                                        where a.idCalendario == kart_calendario_campeonatos.idCalendario
                                        select new { a.idUsuario }).Contains(new { usuarios.idUsuario })
                                && kart_usuario_grupos.idGrupo == IdGrupo
                                && kart_calendario_campeonatos.idCalendario == idCalendario
                                orderby usuarios.Nome ascending
                                select new
                                {
                                    idUsuario = (System.Int32?)kart_usuario_grupos.idUsuario,
                                    usuarios.Nome
                                });

            ddlEtapaPilotoDisponivel.DataSource = PilotosEtapa;
            ddlEtapaPilotoDisponivel.DataTextField = "Nome";
            ddlEtapaPilotoDisponivel.DataValueField = "idUsuario";
            ddlEtapaPilotoDisponivel.DataBind();

            var Pilotos = (from kart_usuario_grupos in dk.Kart_Usuario_Grupos
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
                           orderby usuarios.Nome ascending
                           select new
                           {
                               idUsuario = (System.Int32?)kart_usuario_grupos.idUsuario,
                               usuarios.Nome
                           });

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
            if (IsAdmin)
            {
                IdCalendario = 0;
                Response.Redirect("AdminCalendarioProvas.aspx?IdCampeonato=" + IdCampeonato);
            }
            else
            {
                Alert("Você não possue permissão.");
            }
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
                                 g.Voltas,
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

        protected void gvGrids_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count > 1)
            {
                if (IsAdmin)
                    e.Row.Cells[4].Visible = true;
                else
                    e.Row.Cells[4].Visible = false;
            }
        }

        protected void gvGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string idGrid = e.CommandArgument.ToString();
            HiddenIdGrid.Value = idGrid;
            HiddenFieldOpEdit.Value = "1";

            if (IsAdmin)
            {
                if (e.CommandName == "Alterar")
                {
                    var kr = (from k in dk.Kart_Grid_Calendarios
                              where k.idGrid == Convert.ToInt16(idGrid)
                          && k.idCalendario == IdCalendario
                              select k).FirstOrDefault();

                    if (kr != null)
                    {
                        HiddenIdGrid.Value = Convert.ToString(idGrid);
                        var Usuario = (from u in dk.Usuarios where u.idUsuario == kr.idUsuario select new { u.idUsuario, u.Nome }).FirstOrDefault();
                        ddlGridPilotoDisponivel.Items.Clear();
                        ddlGridPilotoDisponivel.Items.Add(new ListItem(Usuario.Nome, Usuario.idUsuario.ToString(), true));
                        txtGridPos.Text = kr.Pos.ToString();
                        //txtVoltas.Text= kr.Volta.ToString();
                        txtGridTempo.Text = kr.tempoMinutos.ToString().PadLeft(2, '0') + ":" + kr.tempoSegundos.ToString().PadLeft(2, '0') + ":" + kr.tempoMilisegundos.ToString().PadLeft(3, '0');

                        ScriptManager.RegisterStartupScript(PanelGridEtapa, PanelGridEtapa.GetType(), "AbrirGrid", "OpenGrid(" + idGrid + ",1);", true);
                    }
                    else
                    {
                        Alert("Erro para localizar o dados na base!");
                    }
                }
                else if (e.CommandName == "Exluir")
                {
                    var kr = (from k in dk.Kart_Grid_Calendarios
                              where k.idGrid == Convert.ToInt16(idGrid)
                          && k.idCalendario == IdCalendario
                              select k).FirstOrDefault();
                    if (kr != null)
                    {
                        dk.GetTable<Kart_Grid_Calendario>().DeleteOnSubmit(kr);
                        dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);
                        popularTelaEtapa(IdCalendario);
                        Alert("Apontamento excluido com sucesso!");

                        txtGridPos.Text = string.Empty;
                        txtGridTempo.Text = string.Empty;
                        HiddenIdGrid.Value = "0";
                    }
                    else
                    {
                        Alert("Erro para localizar o dados na base!");
                    }
                }
            }
            else
            {
                Alert("Você não é o administrador deste grupo!");
            }
        }

        #region gvResultados
        protected void gvResultados_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count > 1)
            {
                if (IsAdmin)
                    e.Row.Cells[5].Visible = true;
                else
                    e.Row.Cells[5].Visible = false;
            }
        }

        protected void gvResultados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string idResultado = e.CommandArgument.ToString();
            HiddenIdEtapa.Value = idResultado;
            HiddenFieldOpEdit.Value = "2";
            if (IsAdmin)
            {
                if (e.CommandName == "Alterar")
                {
                    var kr = (from k in dk.Kart_Resultado_Calendarios
                              where k.idResultado == Convert.ToInt16(idResultado)
                              && k.idCalendario == IdCalendario
                              select k).FirstOrDefault();

                    if (kr != null)
                    {
                        HiddenIdEtapa.Value = Convert.ToString(idResultado);
                        var Usuario = (from u in dk.Usuarios where u.idUsuario == kr.idUsuario select new { u.idUsuario, u.Nome }).FirstOrDefault();
                        ddlEtapaPilotoDisponivel.Items.Clear();
                        ddlEtapaPilotoDisponivel.Items.Add(new ListItem(Usuario.Nome, Usuario.idUsuario.ToString(), true));
                        txtEtapaPontos.Text = kr.Ponto.ToString();
                        txtEtapaPos.Text = kr.Pos.ToString();
                        txtEtapaTempo.Text = kr.tempoMinutos.ToString().PadLeft(2, '0') + ":" + kr.tempoSegundos.ToString().PadLeft(2, '0') + ":" + kr.tempoMilisegundos.ToString().PadLeft(3, '0');
                        ScriptManager.RegisterStartupScript(PanelGridEtapa, PanelGridEtapa.GetType(), "AbrirEtapa", "OpenEtapa(" + idResultado + ",2);", true);
                    }
                    else
                    {
                        Alert("Erro para localizar o dados na base!");
                    }
                }
                else if (e.CommandName == "Exluir")
                {
                    var kr = (from k in dk.Kart_Resultado_Calendarios
                              where k.idResultado == Convert.ToInt16(idResultado)
                              && k.idCalendario == IdCalendario
                              select k).FirstOrDefault();
                    if (kr != null)
                    {
                        dk.GetTable<Kart_Resultado_Calendario>().DeleteOnSubmit(kr);
                        dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);
                        popularTelaEtapa(IdCalendario);
                        Alert("Apontamento excluido com sucesso!");

                        HiddenIdEtapa.Value = "0";
                        txtEtapaPos.Text = string.Empty;
                        txtEtapaTempo.Text = string.Empty;
                        txtEtapaPontos.Text = string.Empty;
                    }
                    else
                    {
                        Alert("Erro para localizar o dados na base!");
                    }
                }
            }
            else
            {
                Alert("Você não é o administrador deste grupo!");
            }
        }
        #endregion

        protected void imgAdd_Click(object sender, ImageClickEventArgs e)
        {
            HiddenIdGrid.Value = "0";
            HiddenIdEtapa.Value = "0";

            string op = ((ImageButton)sender).CommandArgument;
            if (op == "1")
                ScriptManager.RegisterStartupScript(PanelGridEtapa, PanelGridEtapa.GetType(), "AbrirGrid", "OpenGrid(0,1);", true);
            else
                ScriptManager.RegisterStartupScript(PanelGridEtapa, PanelGridEtapa.GetType(), "AbrirEtapa", "OpenEtapa(0,2);", true);   
        }

        protected void lnkAtualizaGridEtapa_Click(object sender, EventArgs e)
        {
            string op = HiddenFieldOpEdit.Value;
            Int16 idGrid = Convert.ToInt16(HiddenIdGrid.Value);
            Int16 idEtapa = Convert.ToInt16(HiddenIdEtapa.Value);
            Int16 idUsuario = 0;
            if (IsAdmin)
            {
                if (op == "1")
                {
                    idUsuario = Convert.ToInt16(ddlGridPilotoDisponivel.SelectedItem.Value);
                    GravarGrid(idGrid, idUsuario);
                }
                else if (op == "2")
                {
                    idUsuario = Convert.ToInt16(ddlEtapaPilotoDisponivel.SelectedItem.Value);
                    GravarEtapa(idEtapa, idUsuario);
                }
            }
            else
            {
                Alert("Você não é o administrador deste grupo.");
            }
        }

        private void GravarGrid(int IdGrid, int idUsuario)
        {
            Kart_Grid_Calendario kr = null;
            if (IdGrid <= 0)
                kr = new Kart_Grid_Calendario();
            else
                kr = (from k in dk.Kart_Grid_Calendarios where k.idGrid == IdGrid && k.idCalendario == IdCalendario select k).FirstOrDefault();

            if (kr != null)
            {
                var equipe_usuario = (from ek in dk.Kart_Usuario_Equipe_Campeonatos
                                      join en in dk.Kart_Equipe_Campeonatos on ek.idEquipeCampeonato equals en.idEquipeCampeonato
                                      join eg in dk.Kart_Campeonatos on en.idCampeonato equals eg.idCampeonato
                                      where eg.idGrupo == IdGrupo
                                      && ek.idUsuario == idUsuario
                                      && eg.idCampeonato == IdCampeonato
                                      select new { ek.idUsuario, ek.idEquipeCampeonato }).FirstOrDefault();

                if (equipe_usuario != null)
                {
                    kr.idCalendario = IdCalendario;
                    kr.idEquipe = equipe_usuario.idEquipeCampeonato;
                    kr.idUsuario = idUsuario;
                    kr.Pos = String.IsNullOrEmpty(txtGridPos.Text) ? 0 : Convert.ToInt16(txtGridPos.Text);
                    kr.Volta = 0;
                    //M00:S00:MS000
                    kr.tempoHoras = 0;
                    kr.tempoMinutos = String.IsNullOrEmpty(txtGridTempo.Text) ? 0 : Convert.ToInt16(txtGridTempo.Text.Split(':')[0]);
                    kr.tempoSegundos = String.IsNullOrEmpty(txtGridTempo.Text) ? 0 : Convert.ToInt16(txtGridTempo.Text.Split(':')[1]);
                    kr.tempoMilisegundos = String.IsNullOrEmpty(txtGridTempo.Text) ? 0 : Convert.ToInt16(txtGridTempo.Text.Split(':')[2]);

                    if (IdGrid <= 0)
                    {
                        kr.dtcriacao = DateTime.Now;
                        dk.GetTable<Kart_Grid_Calendario>().InsertOnSubmit(kr);
                    }

                    dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

                    popularTelaEtapa(IdCalendario);

                    HiddenIdGrid.Value = "0";

                    txtGridPos.Text = string.Empty;
                    txtGridTempo.Text = string.Empty;

                    Alert("Apontamento salvo com sucesso");
                }
                else
                {
                    Alert("Usuário sem equipe!\n Não é possivel efetuar apontamento sem equipe!");
                    return;
                }
            }
            else
            {
                Alert("Não foi possivel efetuar a atualização do usuário.");
                return;
            }
        }

        private void GravarEtapa(int IdResultado, int idUsuario)
        {
            Kart_Resultado_Calendario kr = null;

            if (IdResultado <= 0)
                kr = new Kart_Resultado_Calendario();
            else
                kr = (from k in dk.Kart_Resultado_Calendarios where k.idResultado == IdResultado && k.idCalendario == IdCalendario select k).FirstOrDefault();

            if (kr != null)
            {
                var equipe_usuario = (from ek in dk.Kart_Usuario_Equipe_Campeonatos
                                      join en in dk.Kart_Equipe_Campeonatos on ek.idEquipeCampeonato equals en.idEquipeCampeonato
                                      join eg in dk.Kart_Campeonatos on en.idCampeonato equals eg.idCampeonato
                                      where eg.idGrupo == IdGrupo
                                      && ek.idUsuario == idUsuario
                                      && eg.idCampeonato == IdCampeonato
                                      select new { ek.idUsuario, ek.idEquipeCampeonato }).FirstOrDefault();

                if (equipe_usuario != null)
                {
                    kr.idCalendario = IdCalendario;
                    kr.idEquipe = equipe_usuario.idEquipeCampeonato;
                    kr.idUsuario = idUsuario;
                    kr.Ponto = String.IsNullOrEmpty(txtEtapaPontos.Text) ? 0 : Convert.ToInt16(txtEtapaPontos.Text);
                    kr.Pos = String.IsNullOrEmpty(txtEtapaPos.Text) ? 0 : Convert.ToInt16(txtEtapaPos.Text);
                    kr.Voltas = String.IsNullOrEmpty(txtEtapaVoltas.Text) ? 0 : Convert.ToInt16(txtEtapaVoltas.Text);
                    //M00:S00:MS000
                    kr.tempoHoras = 0;
                    kr.tempoMinutos = String.IsNullOrEmpty(txtEtapaTempo.Text) ? 0 : Convert.ToInt16(txtEtapaTempo.Text.Split(':')[0]);
                    kr.tempoSegundos = String.IsNullOrEmpty(txtEtapaTempo.Text) ? 0 : Convert.ToInt16(txtEtapaTempo.Text.Split(':')[1]);
                    kr.tempoMilisegundos = String.IsNullOrEmpty(txtEtapaTempo.Text) ? 0 : Convert.ToInt16(txtEtapaTempo.Text.Split(':')[2]);

                    if (IdResultado <= 0)
                    {
                        kr.dtCriacao = DateTime.Now;
                        dk.GetTable<Kart_Resultado_Calendario>().InsertOnSubmit(kr);
                    }

                    dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

                    popularTelaEtapa(IdCalendario);

                    HiddenIdEtapa.Value = "0";

                    txtEtapaPontos.Text = string.Empty;
                    txtEtapaPos.Text = string.Empty;
                    txtEtapaTempo.Text = string.Empty;

                    Alert("Apontamento salvo com sucesso");
                }
                else
                {
                    Alert("Usuário sem equipe!\n Não é possivel efetuar apontamento sem equipe!");
                    return;
                }
            }
            else
            {
                Alert("Não foi possivel efetuar a atualização do usuário.");
                return;
            }

        }
    }
}
