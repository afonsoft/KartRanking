using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KartRanking.BaseDados;
using System.Globalization;
using System.Web.UI.HtmlControls;

namespace KartRanking.Page
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
    public class PageBase : System.Web.UI.Page
    {
        private DataKartDataContext _dk = null;

        #region AddMetaTag

        protected virtual void AddMetaTag(string name, string value)
        {
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(value))
                return;

            HtmlMeta meta = new HtmlMeta();
            meta.Name = name;
            meta.Content = value;
            Page.Header.Controls.AddAt(0, meta);
        }

        protected virtual void AddMetaTag(string name, string key, string value, string content)
        {
            if (string.IsNullOrEmpty(key) || string.IsNullOrEmpty(value))
                return;

            HtmlMeta meta = new HtmlMeta();
            if (!string.IsNullOrEmpty(name))
                meta.Name = name;
            meta.Content = content;
            meta.Attributes.Add(key, value);
            Page.Header.Controls.AddAt(0, meta);
        }

        protected virtual void AddMetaTag(string name, string key, string value)
        {
            if (string.IsNullOrEmpty(key) || string.IsNullOrEmpty(value))
                return;

            HtmlMeta meta = new HtmlMeta();
            if (!string.IsNullOrEmpty(name))
                meta.Name = name;
            meta.Attributes.Add(key, value);
            Page.Header.Controls.AddAt(0, meta);
        }

        #endregion

        protected override void OnLoad(EventArgs e)
        {
            HtmlLink link = new HtmlLink();
            link.Attributes.Add("rel", "canonical");
            link.Attributes.Add("href", Request.Url.ToString());
            this.Header.Controls.AddAt(0, link);
            AddMetaTag("url", Request.Url.ToString());
            AddMetaTag("", "property", "og:url", Request.Url.ToString());
            base.OnLoad(e);
        }

        /// <summary>
        /// Base de dados
        /// </summary>
        public DataKartDataContext dk
        {
            get
            {
                if (_dk == null)
                    _dk = new DataKartDataContext();
                return _dk;
            }
        }

        /// <summary>
        /// Alerta
        /// </summary>
        public void Alert( string msg )
        {
            this.Alert( msg, null, null );
        }
        /// <summary>
        /// Alerta
        /// </summary>
        public void Alert( Exception ex )
        {
            this.Alert( null, ex );
        }
        /// <summary>
        /// Alerta
        /// </summary>
        public void Alert(string msg, Exception ex)
        {
            this.Alert(msg, ex, null);
        }
        /// <summary>
        /// Alerta
        /// </summary>
        public void Alert(string msg, string urlReturn)
        {
            this.Alert(msg, null, urlReturn);
        }
        /// <summary>
        /// Alerta
        /// </summary>
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
        /// <summary>
        /// Culture
        /// </summary>
        public CultureInfo culture
        {
            get { return new CultureInfo("pt-BR"); }
        }

    }
}
