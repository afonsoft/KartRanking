using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.BaseDados;
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
     *                                                      *
     ********************************************************/
    public partial class index : PageBase
    {
        //Fontes: http://rankingkart.codeplex.com/
        //Issues: https://rankingkart.codeplex.com/workitem/list/basic

        protected void Page_Load( object sender, EventArgs e )
        {
            if (!IsPostBack)
            {
                if (Request.Url.AbsoluteUri.IndexOf(".aspx") > 0)
                {
                    using (DataKartDataContext dk = new DataKartDataContext())
                    {
                        if (dk.DatabaseExists())
                        {
                            Response.Redirect("~/Administrador/index.aspx");
                        }
                        else
                        {
                            Response.Redirect("~/InstallDb.aspx");
                        }
                    }
                }
            }
        }
    }
}
