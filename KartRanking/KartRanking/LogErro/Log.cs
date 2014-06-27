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
        public static void Logar(string msg, System.Web.HttpContext Current)
        {
            Logar(msg, null, Current);
        }

        public static void Logar(Exception ex, System.Web.HttpContext Current)
        {
            if (ex != null)
            {
                Logar(ex.Message, ex, Current);
            }
        }
       
        public static void Logar(string msg, Exception ex, System.Web.HttpContext Current)
        {
            try
            {
                Exception tmp = ex;
                string MsgEr = "";
                string StackTrace = "";
                string TargetSite = "";
                string Source = "";
                string path = PathUtil.GetFullPathRoot() + "\\log\\";
                string FileName = path + DateTime.Now.ToString("dd-MM-yyyy") + ".log";

                Usuario user = null;

                if (Current.Session != null && Current.Session["Usuario"] != null)
                    user = (Usuario)Current.Session["Usuario"];
                
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                if (!File.Exists(FileName))
                    File.Create(FileName);

                while (tmp != null)
                {
                    MsgEr += ex.Message + Environment.NewLine;
                    StackTrace += ex.StackTrace + Environment.NewLine;
                    TargetSite += ex.TargetSite + Environment.NewLine;
                    Source += ex.Source + Environment.NewLine;
                    tmp = tmp.InnerException;
                }

                LogDb(msg, MsgEr, StackTrace, TargetSite, Source, Current);

                using (System.IO.StreamWriter file = new System.IO.StreamWriter(FileName, true))
                {
                    file.WriteLine(string.Format("---------------{0}------------------", DateTime.Now.ToString("HH:mm:ss")));
                    file.WriteLine("");
                    file.WriteLine("Mensagem: " + msg);
                    file.WriteLine("");
                    file.WriteLine("Erro: " + MsgEr);
                    file.WriteLine("StackTrace: " + StackTrace);
                    file.WriteLine("TargetSite: " + TargetSite);
                    file.WriteLine("Source: " + Source);
                    file.WriteLine("");
                    if (Current.Request != null)
                    {
                        file.WriteLine("URL: " + Current.Request.Url.ToString());
                        file.WriteLine("RawUrl: " + Current.Request.RawUrl.ToString());
                        file.WriteLine("QueryString: " + Current.Request.QueryString.ToString());
                        file.WriteLine("User Agent: " + Current.Request.UserAgent.ToString());
                        file.WriteLine("User IP: " + Current.Request.ServerVariables["REMOTE_ADDR"].ToString());
                        file.WriteLine("Referrer: " + Current.Request.UrlReferrer != null ? Current.Request.UrlReferrer.ToString() : "");

                    }
                    string keys = "";
                    foreach (string s in Current.Request.Form.AllKeys)
                    {
                        if (s != "__VIEWSTATE")
                            keys += s + ":" + Current.Request.Form[s] + Environment.NewLine;
                    }
                    if (!string.IsNullOrEmpty(keys))
                        file.WriteLine("Keys: " + keys);

                    file.WriteLine("idUsuario: " + user != null ? user.idUsuario : 0);
                    file.WriteLine("");
                    file.WriteLine("-------------------");
                    file.WriteLine("");
                    file.Flush();
                }
            }
            catch
            {
                return;
            }
        }

        private static void LogDb(string msg, string MsgEr, string StackTrace, string TargetSite, string Source, System.Web.HttpContext Current)
        {
            try
            {
                string Keys = "";
                int idUsuario = 0;

                Kart_log_erro erro = new Kart_log_erro();
                erro.dtErro = DateTime.Now;

                Usuario user = null;

                if (Current.Session != null && Current.Session["Usuario"] != null)
                    user = (Usuario)Current.Session["Usuario"];

                if(user != null)
                    idUsuario = user.idUsuario;

                foreach (string s in Current.Request.Form.AllKeys)
                {
                    if (s != "__VIEWSTATE")
                        Keys += s + ":" + Current.Request.Form[s] + Environment.NewLine;
                }

                if (!string.IsNullOrEmpty(Keys))
                    erro.Keys = Keys;

                if (Current.Request != null)
                {
                    erro.URL = Current.Request.Url.ToString();
                    erro.RawUrl = Current.Request.RawUrl.ToString();
                    erro.QueryString = Current.Request.QueryString.ToString();
                    erro.UserAgent = Current.Request.UserAgent.ToString();
                    erro.UserIP = Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                    erro.Referrer = Current.Request.UrlReferrer != null ? Current.Request.UrlReferrer.ToString() : "";
                }

                erro.Erro = MsgEr;
                erro.idUsuario = idUsuario <= 0 ? null : (int?)idUsuario;
                erro.Mensagem = msg;
                erro.StackTrace = StackTrace;
                erro.TargetSite = TargetSite;
                erro.Source = Source;

                DataKartDataContext db = new DataKartDataContext();
                db.GetTable<Kart_log_erro>().InsertOnSubmit( erro );
                db.SubmitChanges();
            }
            catch
            {
                return;
            }
        }
    }
}