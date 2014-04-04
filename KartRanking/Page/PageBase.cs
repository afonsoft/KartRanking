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
        public double EncryptCRC32(string input)
        {
            Crc32 crc32 = new Crc32();
            String hash = String.Empty;
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(input);
            foreach (byte b in crc32.ComputeHash(bytes))
                hash += b.ToString("x2").ToLower();

            String AscIIHash = String.Empty;
            byte[] ASCIIValues = System.Text.Encoding.ASCII.GetBytes(hash);
            foreach (byte b in ASCIIValues)
                AscIIHash += b;

            return Convert.ToDouble(AscIIHash);
        }
    }

    public sealed class Crc32 : HashAlgorithm
    {
        public const UInt32 DefaultPolynomial = 0xedb88320u;
        public const UInt32 DefaultSeed = 0xffffffffu;

        private static UInt32[] defaultTable;

        private readonly UInt32 seed;
        private readonly UInt32[] table;
        private UInt32 hash;

        public Crc32()
            : this(DefaultPolynomial, DefaultSeed)
        {
        }

        public Crc32(UInt32 polynomial, UInt32 seed)
        {
            table = InitializeTable(polynomial);
            this.seed = hash = seed;
        }

        public override void Initialize()
        {
            hash = seed;
        }

        protected override void HashCore(byte[] buffer, int start, int length)
        {
            hash = CalculateHash(table, hash, buffer, start, length);
        }
        protected override byte[] HashFinal()
        {
            var hashBuffer = UInt32ToBigEndianBytes(~hash);
            HashValue = hashBuffer;
            return hashBuffer;
        }

        public override int HashSize { get { return 32; } }

        public static UInt32 Compute(byte[] buffer)
        {
            return Compute(DefaultSeed, buffer);
        }

        public static UInt32 Compute(UInt32 seed, byte[] buffer)
        {
            return Compute(DefaultPolynomial, seed, buffer);
        }

        public static UInt32 Compute(UInt32 polynomial, UInt32 seed, byte[] buffer)
        {
            return ~CalculateHash(InitializeTable(polynomial), seed, buffer, 0, buffer.Length);
        }

        private static UInt32[] InitializeTable(UInt32 polynomial)
        {
            if (polynomial == DefaultPolynomial && defaultTable != null)
                return defaultTable;

            var createTable = new UInt32[256];
            for (var i = 0; i < 256; i++)
            {
                var entry = (UInt32)i;
                for (var j = 0; j < 8; j++)
                    if ((entry & 1) == 1)
                        entry = (entry >> 1) ^ polynomial;
                    else
                        entry = entry >> 1;
                createTable[i] = entry;
            }

            if (polynomial == DefaultPolynomial)
                defaultTable = createTable;

            return createTable;
        }

        private static UInt32 CalculateHash(UInt32[] table, UInt32 seed, IList<byte> buffer, int start, int size)
        {
            var crc = seed;
            for (var i = start; i < size - start; i++)
                crc = (crc >> 8) ^ table[buffer[i] ^ crc & 0xff];
            return crc;
        }

        private static byte[] UInt32ToBigEndianBytes(UInt32 uint32)
        {
            var result = BitConverter.GetBytes(uint32);

            if (BitConverter.IsLittleEndian)
                Array.Reverse(result);

            return result;
        }
    }
}
