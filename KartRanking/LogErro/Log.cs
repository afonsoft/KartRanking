using System;
using KartRanking.Tools;
using System.IO;
using KartRanking.BaseDados;

namespace KartRanking.LogErro
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
    public static class Log
    {
        public static void Logar(string msg, System.Web.HttpContext current)
        {
            Logar(msg, null, current);
        }

        public static void Logar(Exception ex, System.Web.HttpContext current)
        {
            if (ex != null)
            {
                Logar(ex.Message, ex, current);
            }
        }
       
        public static void Logar(string msg, Exception ex, System.Web.HttpContext current)
        {
            try
            {
                Exception tmp = ex;
                string msgEr = "";
                string stackTrace = "";
                string targetSite = "";
                string source = "";
                string path = PathUtil.GetFullPathRoot() + "\\log\\";
                string fileName = path + DateTime.Now.ToString("dd-MM-yyyy") + ".log";

                Usuario user = null;

                if (current.Session?["Usuario"] != null)
                    user = (Usuario)current.Session["Usuario"];
                
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                if (!File.Exists(fileName))
                    File.Create(fileName);

                while (tmp != null)
                {
                    msgEr += ex.Message + Environment.NewLine;
                    stackTrace += ex.StackTrace + Environment.NewLine;
                    targetSite += ex.TargetSite + Environment.NewLine;
                    source += ex.Source + Environment.NewLine;
                    tmp = tmp.InnerException;
                }

                LogDb(msg, msgEr, stackTrace, targetSite, source, current);

                using (var file = new StreamWriter(fileName, true))
                {
                    file.WriteLine($"---------------{DateTime.Now:HH:mm:ss}------------------");
                    file.WriteLine("");
                    file.WriteLine("Mensagem: " + msg);
                    file.WriteLine("");
                    file.WriteLine("Erro: " + msgEr);
                    file.WriteLine("StackTrace: " + stackTrace);
                    file.WriteLine("TargetSite: " + targetSite);
                    file.WriteLine("Source: " + source);
                    file.WriteLine("");
                    file.WriteLine("URL: " + current.Request.Url);
                    file.WriteLine("RawUrl: " + current.Request.RawUrl);
                    file.WriteLine("QueryString: " + current.Request.QueryString);
                    if (current.Request.UserAgent != null)
                        file.WriteLine("User Agent: " + current.Request.UserAgent);
                    file.WriteLine("User IP: " + current.Request.ServerVariables["REMOTE_ADDR"]);
                    if (current.Request.UrlReferrer != null) file.WriteLine(current.Request.UrlReferrer.ToString());
                    string keys = "";
                    foreach (string s in current.Request.Form.AllKeys)
                    {
                        if (s != "__VIEWSTATE")
                            keys += s + ":" + current.Request.Form[s] + Environment.NewLine;
                    }
                    if (!string.IsNullOrEmpty(keys))
                        file.WriteLine("Keys: " + keys);

                    if (user != null) file.WriteLine(user.idUsuario);
                    file.WriteLine("");
                    file.WriteLine("-------------------");
                    file.WriteLine("");
                    file.Flush();
                }
            }
            catch
            {
                // ignored
            }
        }

        private static void LogDb(string msg, string msgEr, string stackTrace, string targetSite, string source, System.Web.HttpContext current)
        {
            try
            {
                string keys = "";
                int idUsuario = 0;

                Kart_log_erro erro = new Kart_log_erro {dtErro = DateTime.Now};

                Usuario user = null;

                if (current.Session?["Usuario"] != null)
                    user = (Usuario)current.Session["Usuario"];

                if(user != null)
                    idUsuario = user.idUsuario;

                foreach (string s in current.Request.Form.AllKeys)
                {
                    if (s != "__VIEWSTATE")
                        keys += s + ":" + current.Request.Form[s] + Environment.NewLine;
                }

                if (!string.IsNullOrEmpty(keys))
                    erro.Keys = keys;

                erro.URL = current.Request.Url.ToString();
                erro.RawUrl = current.Request.RawUrl;
                erro.QueryString = current.Request.QueryString.ToString();
                erro.UserAgent = current.Request.UserAgent;
                erro.UserIP = current.Request.ServerVariables["REMOTE_ADDR"];
                erro.Referrer = current.Request.UrlReferrer != null ? current.Request.UrlReferrer.ToString() : "";

                erro.Erro = msgEr;
                erro.idUsuario = idUsuario <= 0 ? null : (int?)idUsuario;
                erro.Mensagem = msg;
                erro.StackTrace = stackTrace;
                erro.TargetSite = targetSite;
                erro.Source = source;

                DataKartDataContext db = new DataKartDataContext();
                db.GetTable<Kart_log_erro>().InsertOnSubmit( erro );
                db.SubmitChanges();
            }
            catch
            {
                // ignored
            }
        }
    }
}