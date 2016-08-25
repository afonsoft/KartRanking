using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KartRanking
{
    public partial class KartRanking : System.Web.UI.MasterPage
    {
        protected void Page_Load( object sender, EventArgs e )
        {
            if (!IsPostBack)
            {
                if (Session["Title"] == null)
                    Session["Title"] = "Gerenciamento de campeonatos de Kart com ranking";
            }
        }
    }
}
