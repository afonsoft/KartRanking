using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;

namespace KartRanking.Administrador
{
    public partial class index : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                if (Session["Msg"] != null)
                {
                    Alert((string)Session["Msg"]);
                    Session["Msg"] = null;
                }
            }
            if (Session["Usuario"] != null)
            {
                Response.Redirect("~/Administrador/home.aspx");
            }
        }
    }
}