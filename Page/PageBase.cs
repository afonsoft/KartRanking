using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KartRanking.BaseDados;
using System.Globalization;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.IO;
using System.Web.UI;
using System.Text.RegularExpressions;

namespace KartRanking.Page
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)    *
    * DATA: 26-03-2014                                      *
    * E-MAIL: afonsoft@outlook.com.br                       *
    * *******************************************************
    * ALTERAÇÕES:                                           *
    * 04-04-2014 - MD5                                      *
    * 27-06-2014 - Removendo o  DataKartDataContext         *
    ********************************************************/
    public class PageBase : System.Web.UI.Page
    {
        //TODO: Remover o DataContext no futuro para performace
        public DataKartDataContext dk = new DataKartDataContext();

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
            string url = Request.Url.AbsoluteUri.ToString();
            try
            {
                url = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery.ToString(), "") + Request.RawUrl.ToString(); 
            }
            catch
            {
                url = Request.Url.AbsoluteUri.ToString();
            }

            HtmlLink link = new HtmlLink();
            link.Attributes.Add("rel", "canonical");
            link.Attributes.Add("href", url);
            this.Header.Controls.AddAt(0, link);
            AddMetaTag("url", url);
            AddMetaTag("", "property", "og:url", url);
            base.OnLoad(e);
        }

        #region Otimiza o HTML gerado, removendo os espaços desnecessários

        /// <summary>
        /// Remove os espaço entre as Tags Html, deixando a pagina mais rapida e leve,
        /// não funciona com o UpdatePanel do AjaxToolKit. Padrão: true
        /// </summary>
        public bool RemoveSpaceHTML
        {
            get
            {
                if (ViewState["RemoveSpaceHTML"] == null)
                    ViewState["RemoveSpaceHTML"] = true;
                return Convert.ToBoolean(ViewState["RemoveSpaceHTML"]);
            }
            set
            {
                ViewState["RemoveSpaceHTML"] = value;
            }
        }

        // Otimiza o HTML gerado, removendo os espaços desnecessários   
        /// <summary>
        /// Metodo para Modificar as tag
        /// </summary>
        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            try
            {
                if (RemoveSpaceHTML)
                {
                    if (!IsAjax)
                    {
                        //html minifier 
                        using (TextWriter tw = new StringWriter())
                        {
                            using (HtmlTextWriter htmlwriter = new HtmlTextWriter(tw))
                            {
                                base.Render(htmlwriter);
                            }

                            string htmlMin = tw.ToString();
                            htmlMin = Regex.Replace(htmlMin, @"(?<=[^])\t{2,}|(?<=[>])\s{2,3}(?=[<])|(?<=[>])\s{2,3}(?=[<])|(?=[\n])\s{2,3}", String.Empty);
                            htmlMin = Regex.Replace(htmlMin, @"[\f\r\t\v]?([\n\xFE\xFF/{}[\];,<>*%&|^!~?:=])[\f\r\t\v]?", "$1");
                            htmlMin = Regex.Replace(htmlMin, @"\t", " ");
                            htmlMin = Regex.Replace(htmlMin, @">\s+<", "><").Trim();
                            htmlMin = htmlMin.Replace(";\n", ";");
                            writer.Write(htmlMin);
                        }
                    }
                    else
                    {
                        RemoveSpaceHTML = false;
                        base.Render(writer);
                    }

                }
                else
                {
                    base.Render(writer);
                }
            }
            catch (Exception) { RemoveSpaceHTML = false; Response.Redirect(Request.Url.ToString()); }

        }
        #endregion

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            RemoveSpaceHTML = false;
            RemoveGZipEncodePage = true;
        }

        /// <summary>
        /// Page use Ajax
        /// </summary>
        public bool IsAjax
        {
            get
            {
                if (Request != null)
                {
                    if (Request.Headers["HTTP_X_MICROSOFTAJAX"] != null)
                        return true;
                    if (Request.Headers["X-MicrosoftAjax"] == "Delta=true")
                        return true;
                    return false;
                }
                else
                {
                    return false;
                }

            }
        }

        private void GZipEncodePage()
        {
            try
            {
                HttpResponse Response = HttpContext.Current.Response;

                if (IsGZipSupported())
                {
                    string AcceptEncoding = Convert.ToString(HttpContext.Current.Request.Headers["Accept-Encoding"]).ToLower();

                    string filter = Response.Filter.ToString().ToLower();
                    if (filter.Contains("gzip") | filter.Contains("deflate"))
                        return;

                    if (AcceptEncoding.Contains("gzip"))
                    {
                        Response.Filter = new System.IO.Compression.GZipStream(Response.Filter, System.IO.Compression.CompressionMode.Compress);
                        try { Response.Headers.Remove("Content-Encoding"); }
                        catch { }
                        Response.AppendHeader("Content-Encoding", "gzip");
                    }
                    else if (AcceptEncoding.Contains("deflate") || AcceptEncoding == "*")
                    {
                        Response.Filter = new System.IO.Compression.DeflateStream(Response.Filter, System.IO.Compression.CompressionMode.Compress);
                        try { Response.Headers.Remove("Content-Encoding"); }
                        catch { }
                        Response.AppendHeader("Content-Encoding", "deflate");
                    }
                    Response.Cache.SetOmitVaryStar(true);
                    Response.Cache.VaryByHeaders["Accept-encoding"] = true;
                    Response.Cache.VaryByHeaders["Content-Encoding"] = true;
                    Response.Cache.SetVaryByCustom("Accept-Encoding");
                }
            }
            catch { }
        }

        /// <summary>
        /// Disable GZip Encode Page
        /// </summary>
        public bool RemoveGZipEncodePage
        {
            get
            {
                if (ViewState["RemoveGZipEncodePage"] == null)
                    ViewState["RemoveGZipEncodePage"] = false;
                return Convert.ToBoolean(ViewState["RemoveGZipEncodePage"]);
            }
            set
            {
                ViewState["RemoveGZipEncodePage"] = value;
            }
        }

        /// <summary>
        /// Determines if GZip is supported
        /// </summary>
        /// <returns></returns>
        public bool IsGZipSupported()
        {
            string AcceptEncoding = HttpContext.Current.Request.Headers["Accept-Encoding"];
            if (!string.IsNullOrEmpty(AcceptEncoding) && (AcceptEncoding.Contains("gzip") || AcceptEncoding.Contains("deflate")))
                if (RemoveGZipEncodePage == false)
                    return true;

            return false;
        }

        /// <summary>
        /// Alerta
        /// </summary>
        public void Alert(string msg)
        {
            this.Alert(msg, null, null);
        }
        /// <summary>
        /// Alerta
        /// </summary>
        public void Alert(Exception ex)
        {
            this.Alert(null, ex);
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

        /// <summary>
        /// Metodo para o MD5 de uma string.
        /// </summary>
        public string EncryptMd5(string input)
        {
            MD5 md5 = MD5.Create();
            byte[] data = md5.ComputeHash(System.Text.Encoding.Default.GetBytes(input));
            System.Text.StringBuilder sbString = new System.Text.StringBuilder();
            for (int i = 0; i < data.Length; i++)
                sbString.Append(data[i].ToString("x2"));
            return sbString.ToString();
        }

        /// <summary>
        /// phpbb forum - crc32(strtolower($user_row['user_email'])) . strlen($user_row['user_email'])
        /// </summary>
        public uint EncryptCRC32(string input)
        {
            Crc32 crc32 = new Crc32();
            String hash = String.Empty;
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(input);
            return crc32.ComputeChecksum(bytes);
        }
    }

    /// <summary>
    /// http://stackoverflow.com/questions/21175917/how-can-i-calculate-a-crc32-as-a-signed-integer-in-c
    /// Classe CRC32 para validação
    /// </summary>
    public sealed class Crc32 
    {
        //https://github.com/damieng/DamienGKit/blob/master/CSharp/DamienG.Library/Security/Cryptography/Crc32.cs
        uint[] table;
        public uint ComputeChecksum(byte[] bytes)
        {
            uint crc = 0xffffffff;
            for (int i = 0; i < bytes.Length; ++i)
            {
                byte index = (byte)(((crc) & 0xff) ^ bytes[i]);
                crc = (uint)((crc >> 8) ^ table[index]);
            }
            return ~crc;
        }

        public byte[] ComputeChecksumBytes(byte[] bytes)
        {
            return BitConverter.GetBytes(ComputeChecksum(bytes));
        }

        public Crc32()
        {
            uint poly = 0xedb88320;
            table = new uint[256];
            uint temp = 0;
            for (uint i = 0; i < table.Length; ++i)
            {
                temp = i;
                for (int j = 8; j > 0; --j)
                {
                    if ((temp & 1) == 1)
                    {
                        temp = (uint)((temp >> 1) ^ poly);
                    }
                    else
                    {
                        temp >>= 1;
                    }
                }
                table[i] = temp;
            }
        }
    }
}
