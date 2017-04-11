using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.Tools;
using KartRanking.BaseDados;

namespace KartRanking
{
    public partial class InstallDb : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (DataKartDataContext dk = new DataKartDataContext())
            {
                //Instalar o Banco de dados
                if (!dk.DatabaseExists())
                {
                    CreateSiteMap();
                    dk.CreateDatabase();
                    Response.Redirect("~/Administrador/index.aspx");

                }
                else
                {
                    CreateSiteMap();
                    Response.Redirect("~/Administrador/index.aspx");
                }
            }
        }

        private void CreateSiteMap()
        {
            SitemapUtil sitemap = new SitemapUtil();
            sitemap.CreateSiteMap();
        }
    }
}
