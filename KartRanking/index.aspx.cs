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
    public partial class index : PageBase
    {
        //Fontes: http://rankingkart.codeplex.com/

        protected void Page_Load( object sender, EventArgs e )
        {
            Response.Redirect("~/Administrador/index.aspx");
        }
    }
}
