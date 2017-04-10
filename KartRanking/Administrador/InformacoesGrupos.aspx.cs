using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.BaseDados;
using KartRanking.Page;

namespace KartRanking.Administrador
{
    /********************************************************
   * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
   * DATA: 10-04-2017                                     *
   * E-MAIL: afonsoft@outlook.com.br                      *
   * ******************************************************
   * ALTERAÇÕES:                                          *
   *                                                      *
   ********************************************************/
    public partial class InformacoesGrupos : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ((Admin)Page.Master).ConteudoVisible = true;
                GetGroups(); 
            }
        }

        private void GetGroups()
        {
            try
            {
                DataKartDataContext dk = new DataKartDataContext();
                var grupos = (from g in dk.Kart_Grupos
                        orderby g.dtCriacao descending
                        where g.Ativo == true
                        select new
                        {
                            id = g.idGrupo,
                            Nome = g.NomeGrupo,
                            g.Sigla,
                            URL = "http://kart.afonsoft.com.br/" + g.UrlAcesso,
                            g.dtCriacao
                        })
                    .OrderByDescending(x => x.dtCriacao)
                    .Take(100)
                    .ToList();

                rptGrupos.DataSource = grupos;
                rptGrupos.DataBind();
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }
    }
}