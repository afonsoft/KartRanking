using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;

namespace KartRanking.Grupo
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)    *
    * DATA: 26-03-2014                                      *
    * E-MAIL: afonsoft@outlook.com.br                       *
    * *******************************************************
    * ALTERAÇÕES:                                           *
    * Issues: 1759 - Criação da Tela de informações da Regras
    *********************************************************/
    public partial class informacoes : PageBaseGrupo
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopularRegras();
                SetTitle = NomeGrupo + " - " + NomeCampeonato + " - Informações";
            }
        }

        private void PopularRegras()
        {
            ExibirRegras.InnerHtml = "";
            string regra = "";

            using (DataKartDataContext dk = new DataKartDataContext())
            {
                regra = (from r in dk.Kart_Regras_Grupos
                                where r.idGrupo == IdGrupo
                                && r.Ativo == true
                                select r.Regra).FirstOrDefault();

            }
            ExibirRegras.InnerHtml = regra;
        }
    }
}
