using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;

namespace KartRanking.Grupo
{
    public partial class pilotos : PageBaseGrupo
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string op = Request.QueryString["op"];
                string sidUsuario = Request.QueryString["idUsuario"];

                if (op == "pilotos" || string.IsNullOrEmpty(op))
                {
                    PopularGrid(1);
                    PanelPiloto.Visible = true;
                    PanelEquipes.Visible = false;
                    PanelInfo.Visible = false;
                }
                else if (op == "equipes")
                {
                    PopularGrid(2);
                    PanelPiloto.Visible = false;
                    PanelEquipes.Visible = true;
                    PanelInfo.Visible = false;
                }
                else if (op == "info" && !string.IsNullOrEmpty(sidUsuario))
                {
                    PanelPiloto.Visible = false;
                    PanelEquipes.Visible = false;
                    PanelInfo.Visible = true;
                }
            }
        }

        private void PopularGrid(int op)
        {
            gvRankigCampeonato.DataSource = null;
            gvRankigCampeonato.DataBind();

            gvRankigEquipe.DataSource = null;
            gvRankigEquipe.DataBind();

            if (IdGrupo > 0 && IdCampeonato > 0)
            {

                if (op == 1)
                {
                    //View para popular o grid (Ranking do Campeonato)
                    var RankingC = (from vp in dk.View_Kart_Usuario_Pontos_Campeonatos
                                    where vp.idCampeonato == IdCampeonato
                                    && vp.idGrupo == IdGrupo
                                    orderby vp.Pontos descending
                                    select vp);

                    gvRankigCampeonato.DataSource = RankingC;
                    gvRankigCampeonato.DataBind();
                }
                else if (op == 2)
                {
                    //View para popular o grid (Ranking das equipe)
                    var RankingE = (from ve in dk.View_Kart_Equipe_Pontos_Campeonatos
                                    where ve.idCampeonato == IdCampeonato
                                    && ve.idGrupo == IdGrupo
                                    orderby ve.Pontos descending
                                    select ve);

                    gvRankigEquipe.DataSource = RankingE;
                    gvRankigEquipe.DataBind();
                }
            }
        }

        protected void lnkOpenInfoEquipe_Click(object sender, EventArgs e)
        {
            //Abrir um popup com as informações do pilotos da equipe selecionada;
            int idEquipe = 0;
            idEquipe = Convert.ToInt32(HiddenFieldidEquipeCampeonato.Value);
        }
    }
}
