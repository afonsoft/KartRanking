using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using KartRanking.BaseDados;
using System.Globalization;

namespace KartRanking.uc
{
    public partial class InfoPiloto : System.Web.UI.UserControl
    {
        #region idUsuario
        /// <summary>
        /// idUsuario
        /// </summary>
        public int idUsuario
        {
            get
            {
                try { return Convert.ToInt16(HiddenIdUsuario.Value); }
                catch(Exception) { HiddenIdUsuario.Value = "0"; return 0; }
            }
            set
            {
                HiddenIdUsuario.Value = value.ToString();
                if (value > 0)
                    Popular(value);
            }
        }

        #endregion

        #region Getting Temporary Folder Name
        /// <summary>
        /// GetTempFolderName
        /// </summary>
        private string GetTempFolderName()
        {
            string strTempFolderName = Environment.GetFolderPath(Environment.SpecialFolder.InternetCache) + @"\";

            if (Directory.Exists(strTempFolderName))
            {
                return strTempFolderName;
            }
            else
            {
                Directory.CreateDirectory(strTempFolderName);
                return strTempFolderName;
            }
        }

        #endregion

        #region byteArrayToImage
        private void byteArrayToImage(byte[] byteArrayIn)
        {
            System.Drawing.Image newImage;

            string strFileName = GetTempFolderName() + "yourfilename.gif";
            if (byteArrayIn != null)
            {
                using (MemoryStream stream = new MemoryStream(byteArrayIn))
                {
                    newImage = System.Drawing.Image.FromStream(stream);
                    newImage.Save(strFileName);
                    imgUser.Attributes.Add("src", strFileName);
                }
            }
        }
        #endregion

        private void Popular(int idUsuario)
        {
            DataKartDataContext db = new DataKartDataContext();
            Usuario u = (from us in db.Usuarios
                         where us.idUsuario == idUsuario
                         select us).FirstOrDefault();

            if (u != null)
            {
                ltDtNascimento.Text = u.DtNascimento.HasValue ? u.DtNascimento.Value.ToString("dd/MM/yyyy", new CultureInfo("pt-BR")) : "";
                ltEmail.Text = u.Email;
                ltNome.Text = u.Nome + " (" + u.Apelido + ")";
                ltTelefone.Text = u.Telefone;
                lnkUsuario.NavigateUrl = "";
            }
        }
    }
}