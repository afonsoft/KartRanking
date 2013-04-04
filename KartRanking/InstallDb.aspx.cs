using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.Tools;

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
                CreateSiteMap();
                Response.Redirect("~/Administrador/index.aspx");
                
            }
            else
            {
                CreateSiteMap();
                Response.Redirect("~/Administrador/index.aspx");
            }
        }

        private void CreateSiteMap()
        {
            SitemapUtil sitemap = new SitemapUtil();
            sitemap.createSiteMap();
        }
    }
}
