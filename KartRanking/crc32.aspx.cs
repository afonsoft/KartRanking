using System;
using System.Net;
using KartRanking.Page;

namespace KartRanking
{
    public partial class crc32 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string p = Request.QueryString["p"];
                string s2;
                uint s1 = EncryptCrc32(p + p.Length);

                using (WebClient client = new WebClient())
                {
                    s2 = client.DownloadString("http://kart.afonsoft.com.br/crc32.php?p=" + p + p.Length.ToString()).Replace(Environment.NewLine, "");
                }

                Response.Write("ASP: " + s1 + Environment.NewLine + "<br/>");
                Response.Write("PHP: " + s2 + Environment.NewLine + "<br/>");
            }
        }
    }
}