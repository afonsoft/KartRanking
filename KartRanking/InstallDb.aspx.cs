using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;

namespace KartRanking
{
    public partial class InstallDb : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Instalar o Banco de dados
            if (!dk.DatabaseExists())
            {
                dk.CreateDatabase();
                Response.Redirect("~/Administrador/index.aspx");
            }
            else
            {
                Response.Redirect("~/Administrador/index.aspx");
            }
        }
    }
}
