using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace KartRanking
{
    public partial class PageError : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    Exception ex1 = null;

                    if (Context.Items["Exception"] != null)
                        ex1 = (Exception)(Context.Items["Exception"]);
                    else if (Session["Exception"] != null)
                        ex1 = (Exception)(Session["Exception"]);
                    else if (ex1 == null)
                        ex1 = Server.GetLastError();

                    int StatusCode = 0;
                    string _StatusCode = "";
                    if (Context.Items["StatusCode"] != null)
                    {
                        _StatusCode = Context.Items["StatusCode"].ToString();
                        int.TryParse(_StatusCode, out StatusCode);
                    }
                    else if (Session["StatusCode"] != null)
                    {
                        _StatusCode = Session["StatusCode"].ToString();
                        int.TryParse(_StatusCode, out StatusCode);
                    }
                    else
                        StatusCode = HttpContext.Current.Response.StatusCode;

                    string[] Keys = null;
                    if (Context.Items["AllKeys"] != null)
                        Keys = (string[])Context.Items["AllKeys"];
                    else if (Session["AllKeys"] != null)
                        Keys = (string[])Context.Items["AllKeys"];
                    else
                        Keys = Request.Form.AllKeys;

                    LogErro.Log.Logar(ex1, HttpContext.Current);

                    PrintError(ex1, StatusCode, Keys);
                }
                catch (Exception ex)
                {
                    LogErro.Log.Logar(ex, HttpContext.Current);
                    PrintError(ex, 500, Request.Form.AllKeys);
                }
            }
        }
        private void PrintError(Exception ex, int StatusCode, string[] Keys)
        {
            if (ex == null) ex = new Exception("Erro desconhecido.");
            Exception tmpex = ex;

            string strBody = String.Empty;
            string msgError = Request.QueryString["msg"] ?? "";


            lblErrorCode.Text = string.Format("Erro Code: {0} - Mensagem: {1}", StatusCode.ToString(), ex.Message.Replace("\n", "<br/>").Replace("   at ", "&nbsp;&nbsp;at "));

            while (tmpex != null)
            {
                msgError += tmpex.Message.Replace("\n", "<br/>").Replace("   at ", "&nbsp;&nbsp;at ");
                tmpex = tmpex.InnerException;
            }

            strBody += "<p><b>URL: </b>" + HttpContext.Current.Request.Url.ToString();
            strBody += "</p><p><b>RawUrl: </b>" + HttpContext.Current.Request.RawUrl.ToString();
            strBody += "</p><p><b>QueryString: </b>" + HttpContext.Current.Request.QueryString.ToString();
            strBody += "</p><p><b>User IP: </b>" + HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] + " &nbsp;";
            strBody += "</p><p><b>Date/Time: </b>" + DateTime.Now.ToLongDateString() + " " + DateTime.Now.ToShortTimeString();
            strBody += "</p><p><b>User Agent: </b>" + HttpContext.Current.Request.UserAgent;
            if (HttpContext.Current.Request.UrlReferrer != null)
                strBody += "</p><p><b>Referrer: </b>" + HttpContext.Current.Request.UrlReferrer.ToString();

            strBody += "<br/></p><p><font color=red><b>Erro: </b>" + msgError + "</font>";

            string str = "";
            foreach (string s in Keys)
            {
                if (s != "__VIEWSTATE")
                    str += s + ":" + Request.Form[s] + "<br>";
            }
            strBody += "<p><b>Valores do Form: </b>" + str;
            if (ex.StackTrace != null)
                strBody += "</p><br><p><b>StackTrace: </b>" + ex.StackTrace.Replace("\n", "<br>").Replace("   at ", "&nbsp;&nbsp;&nbsp;at ");
            if (ex.Source != null)
                strBody += "</p><p><b>Source: </b>" + ex.Source.Replace("\n", "<br>").Replace("   at ", "&nbsp;&nbsp;&nbsp;at ");
            strBody += "</p><br/><br/>";

            strBody += "<p><b>Valores do ServerVariables</b></p>";
            foreach (string thing in Request.ServerVariables)
            {
                if(!string.IsNullOrEmpty(Request.ServerVariables[thing]))
                    //strBody += "<b>" + thing + ": </b>" + Request.ServerVariables[thing].Replace("\n", "<br>").Replace("   at ", "&nbsp;&nbsp;&nbsp;at ") + "<br/>";
                    strBody += "<p><b>" + thing + ": </b>" + Request.ServerVariables[thing] + "<br/></p>";
            }

            strBody += "<p><b>Environment Variables</b></p>";
            strBody += "<p><b>CurrentDirectory: </b>" + Environment.CurrentDirectory + "<br/></p>";
            strBody += "<p><b>Is64BitOperatingSystem: </b>" + Environment.Is64BitOperatingSystem + "<br/></p>";
            strBody += "<p><b>Is64BitProcess: </b>" + Environment.Is64BitProcess + "<br/></p>";
            strBody += "<p><b>MachineName: </b>" + Environment.MachineName + "<br/></p>";
            strBody += "<p><b>OSVersion: </b>" + Environment.OSVersion + "<br/></p>";
            strBody += "<p><b>ProcessorCount: </b>" + Environment.ProcessorCount + "<br/></p>";
            strBody += "<p><b>SystemDirectory: </b>" + Environment.SystemDirectory + "<br/></p>";
            strBody += "<p><b>SystemPageSize: </b>" + Environment.SystemPageSize + "<br/></p>";
            strBody += "<p><b>UserDomainName: </b>" + Environment.UserDomainName + "<br/></p>";
            strBody += "<p><b>UserInteractive: </b>" + Environment.UserInteractive + "<br/></p>";
            strBody += "<p><b>UserName: </b>" + Environment.UserName + "<br/></p>";
            strBody += "<p><b>Version: </b>" + Environment.Version + "<br/></p>";
            strBody += "<p><b>WorkingSet: </b>" + Environment.WorkingSet + "<br/></p>";
            strBody += "<p><b>ExitCode: </b>" + Environment.ExitCode + "<br/></p>";
            
            dvError.InnerHtml = strBody;
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            email.EMail.EnviaEmail("afonsoft@afonsoft.com.br", dvError.InnerHtml, "Erro no Sistema Kart", ConfigurationManager.AppSettings["SMTP_CCO"]);
            Response.Redirect("~/Administrador/index.aspx");
        }
    }
}
