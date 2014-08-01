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
    public partial class ClassificacaoCampeonato : PageBaseSecurity
    {
       
        private void popularCampeonatos(int idGrupo, int idCampeonato)
        {
            
                var kg = (from g in dk.Kart_Campeonatos
                          where g.idGrupo == idGrupo
                          && (g.Ativo == true || g.idCampeonato == idCampeonato)
                          select new { Text = g.NomeCampeonato, Value = g.idCampeonato, g.Ativo, g.idCampeonato });

                ddlCampeonatos1.Items.Clear();
                ddlCampeonatos1.DataSource = kg;
                ddlCampeonatos1.DataTextField = "Text";
                ddlCampeonatos1.DataValueField = "Value";
                ddlCampeonatos1.DataBind();

                ddlCampeonatos2.Items.Clear();
                ddlCampeonatos2.DataSource = kg;
                ddlCampeonatos2.DataTextField = "Text";
                ddlCampeonatos2.DataValueField = "Value";
                ddlCampeonatos2.DataBind();
           
            if (ddlCampeonatos1.Items.Count <= 0)
                ddlCampeonatos1.Items.Add(new ListItem("Nenhum campeonato neste grupo", "0"));
            if (ddlCampeonatos2.Items.Count <= 0)
                ddlCampeonatos2.Items.Add(new ListItem("Nenhum campeonato neste grupo", "0"));
            if (idCampeonato > 0)
            {
                ControlUtil.SelectByValue(ref ddlCampeonatos1, idCampeonato.ToString());
                ControlUtil.SelectByValue(ref ddlCampeonatos2, idCampeonato.ToString());
                bool? kgAtivo = (from k in kg where k.idCampeonato == idCampeonato select k.Ativo).FirstOrDefault();
                ViewState["kgAtivo"] = kgAtivo.HasValue ? kgAtivo.Value : false;
            }

            if (ddlCampeonatos1.SelectedIndex >= 0)
                IdCampeonato = Convert.ToInt16(ddlCampeonatos1.SelectedValue);
        }

        protected void ddlCampeonatos_SelectedIndexChanged(object sender, EventArgs e)
        {
            IdCampeonato = Convert.ToInt16(((DropDownList)sender).SelectedValue);
            
            string op = Request.QueryString["op"];
            if (string.IsNullOrEmpty(op))
                op = "1";

            switch (op)
            {
                case "1":
                    PopularPilotos();
                    break;
                case "2":
                    PopularEquipes();
                    break;
                default:
                    PopularPilotos();
                    break;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PanelPilotos.Visible = false;
                PanelEquipes.Visible = false;

                popularCampeonatos(IdGrupo, IdCampeonato);

                string op = Request.QueryString["op"];
                if (string.IsNullOrEmpty(op))
                    op = "1";

                switch (op)
                {
                    case "1":
                        PopularPilotos();
                        break;
                    case "2":
                        PopularEquipes();
                        break;
                    default:
                        PopularPilotos();
                        break;
                }
            }
        }

        private void PopularEquipes()
        {
            PanelPilotos.Visible = false;
            PanelEquipes.Visible = true;

            //View para popular o grid (Ranking das equipe)
            var RankingE = from ve in dk.View_Kart_Equipe_Pontos_Campeonatos
                           where ve.idCampeonato == IdCampeonato
                           && ve.idGrupo == IdGrupo
                           orderby ve.Pontos descending
                           select ve;

            gvRankigEquipe.DataSource = RankingE;
            gvRankigEquipe.DataBind();
        }

        private void PopularPilotos()
        {
            PanelPilotos.Visible = true;
            PanelEquipes.Visible = false;

            //View para popular o grid (Ranking do Campeonato)
            var RankingC = from vp in dk.View_Kart_Usuario_Pontos_Campeonatos
                           where vp.idCampeonato == IdCampeonato
                           && vp.idGrupo == IdGrupo
                           orderby vp.Pontos descending
                           select vp;

            gvRankigCampeonato.DataSource = RankingC;
            gvRankigCampeonato.DataBind();
        }

    }
}
