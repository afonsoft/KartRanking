using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.BaseDados;
using KartRanking.Page;

namespace KartRanking.Grupo
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
    public partial class pilotos : PageBaseGrupo
    {
        public int id { set; get; }
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
                    popularInfo(Convert.ToInt32(sidUsuario));
                }
            }
        }

        private void popularInfo(int idUsuario)
        {
            BaseDados.Usuario user = (from p in dk.Usuarios
                                      where p.idUsuario == idUsuario
                                      select p).FirstOrDefault();

            if (user != null)
            {
                IdUsuario.Value = user.idUsuario.ToString();
                txtNome.Text = user.Nome;
                txtDtNascimento.Text = user.DtNascimento.HasValue ? user.DtNascimento.Value.ToString("dd/MM/yyyy") : "";
                txtApelido.Text = user.Apelido;
                txtPeso.Text = user.Peso.ToString();
                txtAltura.Text = user.Altura.ToString();
                if (!String.IsNullOrEmpty(user.Estado))
                    ddlEstado.Items.FindByValue(user.Estado).Selected = true;
                if (user.Sexo.HasValue)
                    ddlSexo.Items.FindByValue(user.Sexo.Value.ToString()).Selected = true;

                lbSexo.Text = ddlSexo.SelectedValue;
                lbEstado.Text = ddlEstado.SelectedValue;
                id = user.idUsuario;

                List<ChartUsuario> chartsCampeonato = new List<ChartUsuario>();
                var UserHistorico = (from c in dk.View_Kart_Usuario_Historicos
                                     where c.idGrupo == IdGrupo
                                     && c.idCampeonato == IdCampeonato
                                     && c.idUsuario == idUsuario
                                     select c).FirstOrDefault();
                if (UserHistorico != null)
                {
                    chartsCampeonato.Add(new ChartUsuario() { text = "P1", value = UserHistorico.Pos_1 });
                    chartsCampeonato.Add(new ChartUsuario() { text = "P2", value = UserHistorico.Pos_2 });
                    chartsCampeonato.Add(new ChartUsuario() { text = "P3", value = UserHistorico.Pos_3 });
                    chartsCampeonato.Add(new ChartUsuario() { text = "P4", value = UserHistorico.Pos_4 });
                    chartsCampeonato.Add(new ChartUsuario() { text = "P5", value = UserHistorico.Pos_5 });
                    chartsCampeonato.Add(new ChartUsuario() { text = "P6", value = UserHistorico.Pos_6 });
                    chartsCampeonato.Add(new ChartUsuario() { text = "P7", value = UserHistorico.Pos_7 });
                    chartsCampeonato.Add(new ChartUsuario() { text = "P8", value = UserHistorico.Pos_8 });
                    chartsCampeonato.Add(new ChartUsuario() { text = "P9", value = UserHistorico.Pos_9 });
                    chartsCampeonato.Add(new ChartUsuario() { text = "P10", value = UserHistorico.Pos_10 });
                }
                ChartTotalCampeonato.Series[0].XValueMember = "text";
                ChartTotalCampeonato.Series[0].YValueMembers = "value";
                ChartTotalCampeonato.DataSource = chartsCampeonato;
                ChartTotalCampeonato.DataBind();

                List<ChartUsuario> chartsHistoricoGeral = new List<ChartUsuario>();
                var UserHistoricoGeral = (from c in dk.View_Kart_Usuario_Todo_Historicos
                                          where c.idUsuario == idUsuario
                                          select c).FirstOrDefault();
                if (UserHistoricoGeral != null)
                {
                    chartsHistoricoGeral.Add(new ChartUsuario() { text = "P1", value = UserHistoricoGeral.Pos_1 });
                    chartsHistoricoGeral.Add(new ChartUsuario() { text = "P2", value = UserHistoricoGeral.Pos_2 });
                    chartsHistoricoGeral.Add(new ChartUsuario() { text = "P3", value = UserHistoricoGeral.Pos_3 });
                    chartsHistoricoGeral.Add(new ChartUsuario() { text = "P4", value = UserHistoricoGeral.Pos_4 });
                    chartsHistoricoGeral.Add(new ChartUsuario() { text = "P5", value = UserHistoricoGeral.Pos_5 });
                    chartsHistoricoGeral.Add(new ChartUsuario() { text = "P6", value = UserHistoricoGeral.Pos_6 });
                    chartsHistoricoGeral.Add(new ChartUsuario() { text = "P7", value = UserHistoricoGeral.Pos_7 });
                    chartsHistoricoGeral.Add(new ChartUsuario() { text = "P8", value = UserHistoricoGeral.Pos_8 });
                    chartsHistoricoGeral.Add(new ChartUsuario() { text = "P9", value = UserHistoricoGeral.Pos_9 });
                    chartsHistoricoGeral.Add(new ChartUsuario() { text = "P10", value = UserHistoricoGeral.Pos_10 });
                }
                ChartTotalHistorico.Series[0].XValueMember = "text";
                ChartTotalHistorico.Series[0].YValueMembers = "value";
                ChartTotalHistorico.DataSource = chartsHistoricoGeral;
                ChartTotalHistorico.DataBind();

                ChartTotalPodioCampeonato.DataSource = getPodios(idUsuario, IdGrupo, IdCampeonato);
                ChartTotalPodioCampeonato.DataBind();

                //Estatistica fisica
                lbNprovas.Text = "";
                lbNvitorias.Text = "";
                lbNpodios.Text = "";
                lbNpontos.Text = "";

                var infoUserEst = (from u in dk.View_Kart_Usuario_Historicos
                                   where u.idUsuario == idUsuario
                                   && u.idGrupo == IdGrupo
                                   && u.idCampeonato == IdCampeonato
                                   select u).FirstOrDefault();
                if (infoUserEst != null)
                {
                    lbNprovas.Text = infoUserEst.Provas.HasValue ? infoUserEst.Provas.Value.ToString() : "0";
                    lbNvitorias.Text = infoUserEst.Pos_1.ToString();
                    lbNpodios.Text = (infoUserEst.Pos_1 + infoUserEst.Pos_2 + infoUserEst.Pos_3).ToString(); ;
                    lbNpontos.Text = infoUserEst.pontos.HasValue ? infoUserEst.pontos.Value.ToString() : "0";
                }

            }
        }

        private List<ChartUsuario> getPodios(int idUsuario, int idGrupo, int idCampeonato)
        {
            List<ChartUsuario> chartsCampeonato = new List<ChartUsuario>();
            if (idUsuario > 0 && idGrupo > 0 && idCampeonato > 0)
            {
                List<View_Kart_Usuario_Historico_Geral> Historico_Gerals = null;
                if (Session["Historico_Geral_" + idGrupo + "_" + idCampeonato] == null)
                {
                    Historico_Gerals = (from p in dk.View_Kart_Usuario_Historico_Gerals
                                        where p.idGrupo == idGrupo
                                        && p.idCampeonato == idCampeonato
                                        select p).ToList();
                }
                else
                {
                    Historico_Gerals = (List<View_Kart_Usuario_Historico_Geral>)Session["Historico_Geral_" + idGrupo + "_" + idCampeonato];
                }

                var podiosEtapas = (from p in Historico_Gerals
                                    where p.idUsuario == idUsuario
                                    orderby p.DataCalendario descending
                                    select p).Take(10);

                var itenspodiosEtapas = (from p in podiosEtapas orderby p.DataCalendario ascending select p);

                foreach (var item in itenspodiosEtapas)
                    chartsCampeonato.Add(new ChartUsuario() { text = item.DataCalendario.ToString("dd-MM"), value = item.Pos });
            }
            return chartsCampeonato;

        }
        private List<ChartUsuario> getPontos(View_Kart_Usuario_Historico vp)
        {
            List<ChartUsuario> chartsCampeonato = new List<ChartUsuario>();
            if (vp != null)
            {
                chartsCampeonato.Add(new ChartUsuario() { text = "P1", value = vp.Pos_1 });
                chartsCampeonato.Add(new ChartUsuario() { text = "P2", value = vp.Pos_2 });
                chartsCampeonato.Add(new ChartUsuario() { text = "P3", value = vp.Pos_3 });
                chartsCampeonato.Add(new ChartUsuario() { text = "P4", value = vp.Pos_4 });
                chartsCampeonato.Add(new ChartUsuario() { text = "P5", value = vp.Pos_5 });
                chartsCampeonato.Add(new ChartUsuario() { text = "P6", value = vp.Pos_6 });
                chartsCampeonato.Add(new ChartUsuario() { text = "P7", value = vp.Pos_7 });
                chartsCampeonato.Add(new ChartUsuario() { text = "P8", value = vp.Pos_8 });
                chartsCampeonato.Add(new ChartUsuario() { text = "P9", value = vp.Pos_9 });
                chartsCampeonato.Add(new ChartUsuario() { text = "P10", value = vp.Pos_10 });
            }
            return chartsCampeonato;
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
                    var _RankingC = (from vp in dk.View_Kart_Usuario_Historicos
                                    where vp.idCampeonato == IdCampeonato
                                    && vp.idGrupo == IdGrupo
                                    orderby vp.pontos descending, vp.Pos_1 descending, vp.Pos_2 descending, vp.Pos_3 descending, vp.Pos_4 descending
                                    select new 
                                    {
                                        vp.pontos,
                                        vp.Nome,
                                        vp.idUsuario,
                                        vp.idGrupo, 
                                        vp.idCampeonato,
                                        vp.Pos_1,
                                        vp.Pos_2,
                                        vp.Pos_3,
                                        vp.voltas,
                                        lstPontos = getPontos(vp)
                                    }).ToList();

                    var RankingC = (from vp in _RankingC
                                    select new
                                    {
                                        vp.pontos,
                                        vp.Nome,
                                        vp.idUsuario,
                                        vp.Pos_1,
                                        vp.Pos_2,
                                        vp.Pos_3,
                                        vp.voltas,
                                        vp.lstPontos,
                                        lstPodios = getPodios(vp.idUsuario, vp.idGrupo, vp.idCampeonato)
                                    }).ToList();

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

    public class ChartUsuario
    {
        public string text { get; set; }
        public int value { get; set; }
    }
}
