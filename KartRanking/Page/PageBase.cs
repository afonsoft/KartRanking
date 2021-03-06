﻿using System;
using System.Web;
using System.Globalization;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Text;
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
        //public DataKartDataContext dk = new DataKartDataContext();

        #region AddMetaTag

        protected virtual void AddMetaTag(string name, string value)
        {
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(value))
                return;

            HtmlMeta meta = new HtmlMeta
            {
                Name = name,
                Content = value
            };
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
            Header.Controls.AddAt(0, link);
            AddMetaTag("url", Request.Url.ToString());
            AddMetaTag("", "property", "og:url", Request.Url.ToString());
            base.OnLoad(e);
        }

        public string FixString(string value)
        {
            if (string.IsNullOrEmpty(value))
                return "";

            return RemoveIvalidCharacters(RemoveAccents(value.Trim()));
        }

        public string RemoveIvalidCharacters(string value)
        {
            value = Regex.Replace(value, "[«»\u201C\u201D\u201E\u201F\u2033\u2036]", "");
            value = Regex.Replace(value, "[èëêð]", "e");
            value = Regex.Replace(value, "[ÈËÊ]", "E");
            value = Regex.Replace(value, "[àâä]", "a");
            value = Regex.Replace(value, "[ÀÂÄÅ]", "A");
            value = Regex.Replace(value, "[ÙÛÜ]", "U");
            value = Regex.Replace(value, "[úûüµ]", "u");
            value = Regex.Replace(value, "[òöø]", "o");
            value = Regex.Replace(value, "[ÒÖØ]", "O");
            value = Regex.Replace(value, "[ìîï]", "i");
            value = Regex.Replace(value, "[ÌÎÏ]", "I");
            value = Regex.Replace(value, "[š]", "s");
            value = Regex.Replace(value, "[Š]", "S");
            value = Regex.Replace(value, "[ñ]", "n");
            value = Regex.Replace(value, "[Ñ]", "N");
            value = Regex.Replace(value, "[ÿ]", "y");
            value = Regex.Replace(value, "[Ÿ]", "Y");
            value = Regex.Replace(value, "[ž]", "z");
            value = Regex.Replace(value, "[Ž]", "Z");
            value = Regex.Replace(value, "[Ð]", "D");
            value = Regex.Replace(value, "[œ]", "oe");
            value = Regex.Replace(value, "[Œ]", "Oe");
            value = Regex.Replace(value, "[\"]", "");
            value = Regex.Replace(value, "[;]", "");
            value = Regex.Replace(value, "[\t]", "");
            value = Regex.Replace(value, "[\n]", "");
            value = Regex.Replace(value, "[\r]", "");
            value = Regex.Replace(value, "'", "");
            value = Regex.Replace(value, ";", "");
            value = Regex.Replace(value, "[\u2026]", "...");
            value = Regex.Replace(value, Environment.NewLine, "");
            return value;
        }

        private string RemoveAccents(string text)
        {
            if (string.IsNullOrWhiteSpace(text))
                return text;

            StringBuilder sbReturn = new StringBuilder();
            var arrayText = text.Normalize(NormalizationForm.FormD).ToCharArray();
            foreach (char letter in arrayText)
            {
                if (CharUnicodeInfo.GetUnicodeCategory(letter) != UnicodeCategory.NonSpacingMark)
                    sbReturn.Append(letter);
            }
            return sbReturn.ToString().Trim();
        }

        /// <summary>
        /// Alerta
        /// </summary>
        public void Alert(string msg)
        {
            Alert(msg, null, null);
        }
        /// <summary>
        /// Alerta
        /// </summary>
        public void Alert(Exception ex)
        {
            Alert(null, ex);
        }
        /// <summary>
        /// Alerta
        /// </summary>
        public void Alert(string msg, Exception ex)
        {
            Alert(msg, ex, null);
        }
        /// <summary>
        /// Alerta
        /// </summary>
        public void Alert(string msg, string urlReturn)
        {
            Alert(msg, null, urlReturn);
        }
        /// <summary>
        /// Alerta
        /// </summary>
        public void Alert(string msg, Exception ex, string urlReturn)
        {
            var alert = string.IsNullOrEmpty(msg) ? "" : msg.Replace("'", "`").Replace(Environment.NewLine, "\\n").Replace("\n", "\\n");
            alert += ex?.Message.Replace("'", "`").Replace(Environment.NewLine, "\\n").Replace("\n", "\\n") ?? "";

            if (String.IsNullOrEmpty(urlReturn))
                Page.ClientScript.RegisterStartupScript(GetType(), "Alert", "alert('" + alert + "');", true);
            else
                Page.ClientScript.RegisterStartupScript(GetType(), "Alert", "alert('" + alert + "');window.location.href='" + urlReturn + "';", true);

            if (ex?.InnerException != null)
                LogErro.Log.Logar(ex, HttpContext.Current);

        }
        /// <summary>
        /// Culture
        /// </summary>
        public CultureInfo culture => new CultureInfo("pt-BR");

        /// <summary>
        /// Metodo para o MD5 de uma string.
        /// </summary>
        public string EncryptMd5(string input)
        {
            MD5 md5 = MD5.Create();
            byte[] data = md5.ComputeHash(System.Text.Encoding.Default.GetBytes(input));
            System.Text.StringBuilder sbString = new System.Text.StringBuilder();
            foreach (byte t in data)
                sbString.Append(t.ToString("x2"));
            return sbString.ToString();
        }

        /// <summary>
        /// phpbb forum - crc32(strtolower($user_row['user_email'])) . strlen($user_row['user_email'])
        /// </summary>
        public uint EncryptCrc32(string input)
        {
            Crc32 crc32 = new Crc32();
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
        readonly uint[] _table;
        public uint ComputeChecksum(byte[] bytes)
        {
            uint crc = 0xffffffff;
            foreach (byte t in bytes)
            {
                byte index = (byte)(((crc) & 0xff) ^ t);
                crc = (crc >> 8) ^ _table[index];
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
            _table = new uint[256];
            for (uint i = 0; i < _table.Length; ++i)
            {
                var temp = i;
                for (int j = 8; j > 0; --j)
                {
                    if ((temp & 1) == 1)
                    {
                        temp = (temp >> 1) ^ poly;
                    }
                    else
                    {
                        temp >>= 1;
                    }
                }
                _table[i] = temp;
            }
        }
    }
}
