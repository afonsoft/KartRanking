using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KartRanking.BaseDados;
using System.Globalization;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.IO;

namespace KartRanking.Page
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)    *
    * DATA: 26-03-2014                                      *
    * E-MAIL: afonsoft@outlook.com.br                       *
    * *******************************************************
    * ALTERAÇÕES:                                           *
    * 04-04-2014 - MD5                                      *
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
