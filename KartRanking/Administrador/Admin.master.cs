using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KartRanking.Administrador
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] != null)
                {
                    pnlMenu.Visible = true;
                    pnlLogin.Visible = false;
                }
                else
                {
                    pnlMenu.Visible = false;
                    pnlLogin.Visible = true;
                }
                
            }
        }

        protected void lnkSair_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }
    }
}
