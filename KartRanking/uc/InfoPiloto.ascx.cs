using System;
using System.Linq;
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
        public int IdUsuario
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


        private void Popular(int idUsuario)
        {
            DataKartDataContext db = new DataKartDataContext();
            Usuario u = (from us in db.Usuarios
                         where us.idUsuario == idUsuario
                         select us).FirstOrDefault();

            if (u != null)
            {
                ltDtNascimento.Text = u.DtNascimento?.ToString("dd/MM/yyyy", new CultureInfo("pt-BR")) ?? "";
                ltEmail.Text = u.Email;
                ltNome.Text = u.Nome + " (" + u.Apelido + ")";
                ltTelefone.Text = u.Telefone;
                lnkUsuario.NavigateUrl = "";
            }
        }
    }
}