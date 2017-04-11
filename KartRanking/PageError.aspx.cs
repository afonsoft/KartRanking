using System;
using System.Web;
using System.Configuration;

namespace KartRanking
{
    public partial class PageError : System.Web.UI.Page
    {
        public string ErrorMsg => Convert.ToString(ViewState["ErrorMsg"]);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    Exception ex1;

                    if (Context.Items["Exception"] != null)
                        ex1 = (Exception)(Context.Items["Exception"]);
                    else if (Session["Exception"] != null)
                        ex1 = (Exception)(Session["Exception"]);
                    else ex1 = Server.GetLastError();

                    int statusCode;
                    string sStatusCode;
                    if (Context.Items["StatusCode"] != null)
                    {
                        sStatusCode = Context.Items["StatusCode"].ToString();
                        int.TryParse(sStatusCode, out statusCode);
                    }
                    else if (Session["StatusCode"] != null)
                    {
                        sStatusCode = Session["StatusCode"].ToString();
                        int.TryParse(sStatusCode, out statusCode);
                    }
                    else
                        statusCode = HttpContext.Current.Response.StatusCode;

                    string[] keys;
                    if (Context.Items["AllKeys"] != null)
                        keys = (string[])Context.Items["AllKeys"];
                    else if (Session["AllKeys"] != null)
                        keys = (string[])Context.Items["AllKeys"];
                    else
                        keys = Request.Form.AllKeys;

                    PrintError(ex1, statusCode, keys);
                }
                catch (Exception ex)
                {
                    PrintError(ex, 500, Request.Form.AllKeys);
                }
            }
        }
        private void PrintError(Exception ex, int statusCode, string[] keys)
        {
            if (ex == null) ex = new Exception("Erro desconhecido.");
            Exception tmpex = ex;

            string strBody = String.Empty;
            string msgError = Request.QueryString["msg"] ?? "";


            lblErrorCode.Text = $"Erro Code: {statusCode} - Mensagem: {ex.Message.Replace("\n", "<br/>").Replace("   at ", "&nbsp;&nbsp;at ")}";
            ViewState["ErrorMsg"] = lblErrorCode.Text.Replace("<br/>", " ").Replace("&nbsp;", " ");

            while (tmpex != null)
            {
                msgError += tmpex.Message.Replace("\n", "<br/>").Replace("   at ", "&nbsp;&nbsp;at ");
                tmpex = tmpex.InnerException;
            }

            strBody += "<p><b>URL: </b>" + HttpContext.Current.Request.Url;
            strBody += "</p><p><b>RawUrl: </b>" + HttpContext.Current.Request.RawUrl;
            strBody += "</p><p><b>QueryString: </b>" + HttpContext.Current.Request.QueryString;
            strBody += "</p><p><b>User IP: </b>" + HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] + " &nbsp;";
            strBody += "</p><p><b>Date/Time: </b>" + DateTime.Now.ToLongDateString() + " " + DateTime.Now.ToShortTimeString();
            strBody += "</p><p><b>User Agent: </b>" + HttpContext.Current.Request.UserAgent;
            if (HttpContext.Current.Request.UrlReferrer != null)
                strBody += "</p><p><b>Referrer: </b>" + HttpContext.Current.Request.UrlReferrer;

            strBody += "<br/></p><p><font color=red><b>Erro: </b>" + msgError + "</font>";

            string str = "";
            foreach (string s in keys)
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

            strBody += "<br/><p><b>Valores do ServerVariables</b></p>";
            foreach (string thing in Request.ServerVariables)
            {
                if(!string.IsNullOrEmpty(Request.ServerVariables[thing]))
                    //strBody += "<b>" + thing + ": </b>" + Request.ServerVariables[thing].Replace("\n", "<br>").Replace("   at ", "&nbsp;&nbsp;&nbsp;at ") + "<br/>";
                    strBody += "<p><b>" + thing + ": </b>" + Request.ServerVariables[thing] + "<br/></p>";
            }

            strBody += "<br/><p><b>Environment Variables</b></p>";
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

            LogErro.Log.Logar(strBody, HttpContext.Current);
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            email.EMail.EnviaEmail("afonsoft@afonsoft.com.br;afonsoft@gmail.com", dvError.InnerHtml + "<br/><br/><b>Informações Adicionais<b><br/>" + txtInfo.Text, "KartRanking - Erro no Sistema Kart", ConfigurationManager.AppSettings["SMTP_CCO"]);
            Response.Redirect("~/Administrador/index.aspx");
        }
    }
}
