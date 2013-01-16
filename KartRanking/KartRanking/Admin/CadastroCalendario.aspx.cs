using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;

namespace KartRanking
{
    public partial class CadastroCalendario : PageBaseSecurity
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HiddenIdGrupo.Value = Request.QueryString["IdGrupo"];
                HiddenIdCampeonato.Value = Request.QueryString["IdCampeonato"];
                HiddenIdCalendario.Value = "0";

                if (Request.QueryString["IdCalendario"] != null)
                {
                    //Visualizar ou Alterar se for Admin
                    HiddenIdCalendario.Value = Request.QueryString["IdCalendario"];
                    pnlAdminEtapa1.Visible = true;

                    PopularTela(Convert.ToInt16(HiddenIdGrupo.Value), Convert.ToInt16(HiddenIdCampeonato.Value), Convert.ToInt16(HiddenIdCalendario.Value));

                    ltCircuito.ReadOnly = true;
                    ltData.ReadOnly = true;
                    ltHora.ReadOnly = true;
                    ltEtapa.ReadOnly = true;
                    ltKartodromo.ReadOnly = true;

                    pnlAdminEtapa.Visible = false;

                    ltGrid.Text = "";
                    ltResultados.Text = "";

                    if (IsAdmin)
                    {
                        pnlAdminEtapa.Visible = true;

                        ltCircuito.ReadOnly = false;
                        ltData.ReadOnly = false;
                        ltHora.ReadOnly = false;
                        ltEtapa.ReadOnly = false;
                        ltKartodromo.ReadOnly = false;

                        string urlResultado = "<a href=\"EtapaCampeonato.aspx?idGrupo=" + HiddenIdGrupo.Value + "&IdCampeonato=" + HiddenIdCampeonato.Value + "&IdCalendario=" + HiddenIdCalendario.Value + "\">";
                        urlResultado += "<img width=\"16px\" height=\"16px\" title=\"Alterar/incluir o Resultado\" alt=\"Alterar/incluir o Resultado\" src=\"/images/checkered_flag32.png\" />";
                        urlResultado += "Alterar/incluir o Resultado</a>";

                        string urlGrid = "<a href=\"GridCampeonato.aspx?idGrupo=" + HiddenIdGrupo.Value + "&IdCampeonato=" + HiddenIdCampeonato.Value + "&IdCalendario=" + HiddenIdCalendario.Value + "\">";
                        urlGrid += "<img width=\"16px\" height=\"16px\" title=\"Alterar/incluir no Grid\" alt=\"Alterar/incluir no Grid\" src=\"/images/Positioning.png\" />";
                        urlGrid += "Alterar/incluir no Grid</a>";

                        ltGrid.Text = urlGrid;
                        ltResultados.Text = urlResultado;
                    }
                    else
                    {
                        ltGrid.Text = "Resuldado do Grid";
                        ltResultados.Text = "Resuldado da Corrida";
                    }
                }
                else
                {
                    //Nova etapa
                    PopularTela(Convert.ToInt16(HiddenIdGrupo.Value), Convert.ToInt16(HiddenIdCampeonato.Value), 0);
                    ltCircuito.ReadOnly = false;
                    ltData.ReadOnly = false;
                    ltHora.ReadOnly = false;
                    ltEtapa.ReadOnly = false;
                    ltKartodromo.ReadOnly = false;
                    PanelAdminCadastro.Visible = true;
                }

            }
        }

        #region PopularTela
        private void PopularTela(int IdGrupo, int IdCampeonato, int IdCalendario)
        {
            var Grupo = (from g in dk.Kart_Grupos
                         join c in dk.Kart_Campeonatos on g.idGrupo equals c.idGrupo
                         where g.idGrupo == IdGrupo && c.idCampeonato == IdCampeonato
                         select new { g.NomeGrupo, c.NomeCampeonato }).FirstOrDefault();

            if (Grupo != null)
            {
                ltNomeGrupo.Text = Grupo.NomeGrupo;
                ltNomeCampeonato.Text = Grupo.NomeCampeonato;
            }

            //Visualizar o grid e os Resultados
            if (IdCalendario > 0)
            {

                Kart_Calendario_Campeonato cc = (from c in dk.Kart_Calendario_Campeonatos where c.idCalendario == IdCalendario && c.idCampeonato == IdCampeonato select c).FirstOrDefault();

                if (cc != null)
                {
                    ltData.Text = cc.Data.ToString("dd/MM/yyyy");
                    ltHora.Text = cc.Horario;
                    ltKartodromo.Text = cc.Kartodromo;
                    ltEtapa.Text = cc.Nome;
                }

                var grid = (from g in dk.Kart_Grid_Calendarios
                            join u in dk.Usuarios on g.idUsuario equals u.idUsuario
                            join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                            join ue in dk.Kart_Usuario_Equipe_Campeonatos on u.idUsuario equals ue.idUsuario
                            join e in dk.Kart_Equipe_Campeonatos on ue.idEquipeCampeonato equals e.idEquipeCampeonato
                            join eg in dk.Kart_Campeonatos on e.idCampeonato equals eg.idCampeonato
                            where g.idCalendario == IdCalendario
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
                                 where g.idCalendario == IdCalendario
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

            }
        }
        #endregion

        #region Eventos Admin

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CalendarioCampeonato.aspx?IdGrupo=" + Request.QueryString["IdGrupo"] + "&IdCampeonato=" + Request.QueryString["IdCampeonato"]);
        }

        protected void btnAlterar_Click(object sender, EventArgs e)
        {
            Kart_Calendario_Campeonato cc = (from c in dk.Kart_Calendario_Campeonatos 
                                             where c.idCalendario == Convert.ToInt16(HiddenIdCalendario.Value) 
                                             && c.idCampeonato == Convert.ToInt16(HiddenIdCampeonato.Value) 
                                             select c).FirstOrDefault();

            cc.Data = Convert.ToDateTime(ltData.Text);
            cc.Horario = ltHora.Text;
            cc.idCampeonato = Convert.ToInt16(HiddenIdCampeonato.Value);
            cc.Kartodromo = ltKartodromo.Text;
            cc.Nome = ltEtapa.Text;

            dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

            Alert("Etapa alterada com sucesso!");
        }

        protected void BtnExcluir_Click(object sender, EventArgs e)
        {
            int idGrupo = Convert.ToInt16(HiddenIdGrupo.Value);
            int idCampeonato = Convert.ToInt16(HiddenIdCampeonato.Value);
            int idCalendario = Convert.ToInt16(HiddenIdCalendario.Value);
            


        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (IsAdmin)
            {
                Kart_Calendario_Campeonato cc = new Kart_Calendario_Campeonato();

                cc.Ativo = true;
                cc.dtCriacao = DateTime.Now;
                cc.Data = Convert.ToDateTime(ltData.Text);
                cc.Horario = ltHora.Text;
                cc.idCampeonato = Convert.ToInt16(HiddenIdCampeonato.Value);
                cc.Kartodromo = ltKartodromo.Text;
                cc.Nome = ltEtapa.Text;

                dk.GetTable<Kart_Calendario_Campeonato>().InsertOnSubmit(cc);

                dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

                Alert("Etapa incluida com sucesso!", "CalendarioCampeonato.aspx?idGrupo=" + Request.QueryString["IdGrupo"] + "&IdCampeonato=" + Request.QueryString["IdCampeonato"]);
            }
        }

        #endregion

        #region gvEvent
        protected void gvGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvResultados_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
        #endregion
    }
}