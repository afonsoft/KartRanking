using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using KartRanking.BaseDados;
using KartRanking.Tools;

namespace KartRanking
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            string originalPath = Request.Url.ToString().ToLower();
            string UrlAmigavel = originalPath.Substring(originalPath.LastIndexOf('/') + 1, originalPath.Length - originalPath.LastIndexOf('/') - 1);

            if ((UrlAmigavel.IndexOf(".aspx") >= 0 && UrlAmigavel.IndexOf("?") < 0)  || UrlAmigavel.IndexOf('.') < 0)
            {
                UrlAmigavel = UrlAmigavel.Replace(".aspx", "");

                List<Kart_Grupo> lstGrupos = new List<Kart_Grupo>();

                if (!CacheHelper.Exists("AllGrupo"))
                {
                    lstGrupos = (from g in new DataKartDataContext().Kart_Grupos where g.Ativo == true select g).ToList();
                    CacheHelper.Add(lstGrupos, "AllGrupo");
                }
                else
                    CacheHelper.Get("AllGrupo", out lstGrupos);

                int? idGrupo = (from g in lstGrupos
                                where g.UrlAcesso.ToLower() == UrlAmigavel.ToLower()
                                select (int?)g.idGrupo).SingleOrDefault();

                if (idGrupo.HasValue && idGrupo.Value > 0)
                {
                    //Context.RewritePath("~/Grupo/index.aspx?idGrupo=" + idGrupo);
                    Context.Response.Redirect("~/Grupo/index.aspx?idGrupo=" + idGrupo);
                }
            }
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            try
            {
                HttpContext ctx = HttpContext.Current;
                Exception exception = ctx.Server.GetLastError();

                if (exception != null && exception.Message.Contains("callback"))
                {
                    // This is a robot spam attack so we send it a 404 status to make it go away.
                    ctx.Response.StatusCode = 404;
                    ctx.Server.ClearError();
                }
                else if (exception != null && (exception.Message.Contains("Arquivo") || exception.Message.Contains("inexistente")))
                {
                    ctx.Server.ClearError();
                }
                else if (exception != null)
                {
                    Context.Items["Exception"] = exception;
                    Context.Items["StatusCode"] = ctx.Response.StatusCode;
                    Context.Items["AllKeys"] = Request.Form.AllKeys;

                    try
                    {
                        try
                        {
                            ctx.Server.Transfer("~/PageError.aspx", true);
                        }
                        catch
                        {
                            Response.Redirect("~/PageError.aspx", true);
                        }
                    }
                    catch (Exception) { }
                }
            }
            catch (Exception ex)
            {
                LogErro.Log.Logar(ex, HttpContext.Current);
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}