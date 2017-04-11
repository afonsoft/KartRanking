using System;
using KartRanking.Page;

namespace KartRanking
{
    /********************************************************
     * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
     * DATA: 26-03-2014                                     *
     * E-MAIL: afonsoft@outlook.com.br                      *
     * ******************************************************
     * ALTERAÇÕES:                                          *
     * 26-03-2014: Incluido a url do issues                 *
     * 10-04-2017: Redirect                                 *
     ********************************************************/
    public partial class index : PageBase
    {
        //Fontes: http://rankingkart.codeplex.com/
        //Issues: https://rankingkart.codeplex.com/workitem/list/basic

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/index.aspx");
        }
    }
}
