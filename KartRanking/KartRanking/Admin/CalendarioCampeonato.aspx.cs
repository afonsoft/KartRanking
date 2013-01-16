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
    public partial class CalendarioCampeonato : PageBaseSecurity
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    HiddenIdCampeonato.Value = Request.QueryString["IdCampeonato"];
                    HiddenIdGrupo.Value = Request.QueryString["IdGrupo"];
                    PopularTela(Convert.ToInt16(HiddenIdGrupo.Value), Convert.ToInt16(HiddenIdCampeonato.Value));

                    ltNovaEtapa.Text = "";

                    if (IsAdmin)
                    {
                        ltNovaEtapa.Text = "<a href=\"CadastroCalendario.aspx?idGrupo=" + HiddenIdGrupo.Value + "&idCampeonato=" + HiddenIdCampeonato.Value + "\"><img width=\"16px\" height=\"16px\" title=\"Criar uma nova Etapa do campeonato\" alt=\"Criar uma nova Etapa do campeonato\" src=\"../images/Calender.png\" />Nova Etapa</a>";
                    }
                }
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

        private void PopularTela(int IdGrupo, int IdCampeonato)
        {
            Kart_Campeonato kg = (from g in dk.Kart_Campeonatos
                                  where g.idGrupo == IdGrupo && g.idCampeonato == IdCampeonato
                                  select g).FirstOrDefault();

            if (kg != null)
            {
                ltDtFim.Text = kg.dtFim.ToString("dd/MM/yyyy");
                ltDtInicio.Text = kg.dtInicio.ToString("dd/MM/yyyy");
                ltNomeCampeonato.Text = kg.NomeCampeonato;

                //Listar as Etapas do Campeonato
                var Calendario_Campeonato = (from cc in dk.Kart_Calendario_Campeonatos
                                             where cc.idCampeonato == IdCampeonato
                                             orderby cc.Data ascending
                                             select cc);


                gvEtapas.DataSource = Calendario_Campeonato;
                gvEtapas.DataBind();

                //View para popular o grid (Ranking do Campeonato)
                var RankingC = from vp in dk.View_Kart_Usuario_Pontos_Campeonatos
                               where vp.idCampeonato == IdCampeonato
                               && vp.idGrupo == IdGrupo
                               orderby vp.Pontos descending
                               select vp;

                gvRankigCampeonato.DataSource = RankingC;
                gvRankigCampeonato.DataBind();

                //View para popular o grid (Ranking das equipe)
                var RankingE = from ve in dk.View_Kart_Equipe_Pontos_Campeonatos
                               where ve.idCampeonato == IdCampeonato
                               && ve.idGrupo == IdGrupo
                               orderby ve.Pontos descending
                               select ve;

                gvRankigEquipe.DataSource = RankingE;
                gvRankigEquipe.DataBind();
            }
        }

        protected void gvEtapas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCalendario")
            {
                int idCalendario = Convert.ToInt16(e.CommandArgument);
                int IdCampeonato = Convert.ToInt16(HiddenIdCampeonato.Value);
                int IdGrupo = Convert.ToInt16(HiddenIdGrupo.Value);
                Response.Redirect("CadastroCalendario.aspx?idGrupo=" + IdGrupo + "&IdCampeonato=" + IdCampeonato + "&idCalendario=" + idCalendario);
            }
        }
    }
}