using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KartRanking.BaseDados;

namespace KartRanking.Page
{
    public class PageBase : System.Web.UI.Page
    {
        private DataKartDataContext _dk = null;

        public DataKartDataContext dk
        {
            get
            {
                if (_dk == null)
                    _dk = new DataKartDataContext();
                return _dk;
            }
        }

        public void Alert( string msg )
        {
            this.Alert( msg, null, null );
        }
        public void Alert( Exception ex )
        {
            this.Alert( null, ex );
        }
        public void Alert(string msg, Exception ex)
        {
            this.Alert(msg, ex, null);
        }
        public void Alert(string msg, string urlReturn)
        {
            this.Alert(msg, null, urlReturn);
        }
        public void Alert(string msg, Exception ex, string urlReturn)
        {
            string alert = "";

            alert = string.IsNullOrEmpty(msg) ? "" : msg.Replace("'", "`").Replace(Environment.NewLine, "\\n").Replace("\n", "\\n");
            alert += ex == null ? "" : ex.Message.Replace("'", "`").Replace(Environment.NewLine, "\\n").Replace("\n", "\\n");

            if (String.IsNullOrEmpty(urlReturn))
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('" + alert + "');", true);
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('" + alert + "');window.location.href='" + urlReturn + "';", true);

            if (ex != null && ex.InnerException != null)
                LogErro.Log.Logar(ex, HttpContext.Current);

        }

    }
}
