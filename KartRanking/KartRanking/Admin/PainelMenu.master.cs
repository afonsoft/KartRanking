using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.BaseDados;
using KartRanking.Tools;

namespace KartRanking
{
    public partial class PainelMenu : System.Web.UI.MasterPage
    {
        protected void Page_Load( object sender, EventArgs e )
        {
            if(Session[ "Usuario" ] != null)
                ImgPerfil.ImageUrl="~/Admin/ImageHandler.ashx?id=" + ( ( Usuario )Session[ "Usuario" ] ).idUsuario;
        }

        protected void lnkSair_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }
    }
}
