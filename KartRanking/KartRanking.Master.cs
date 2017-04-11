using System;
using KartRanking.BaseDados;

namespace KartRanking
{
    public partial class KartRanking : System.Web.UI.MasterPage
    {
        public string UserId
        {
            get
            {
                if (UsuarioLogado == null)
                    return "anonymous@afonsoft.com.br";
                return UsuarioLogado.Email;
            }
        }

        public Usuario UsuarioLogado => (Usuario) Session["Usuario"];

        protected void Page_Load( object sender, EventArgs e )
        {
            
        }
    }
}
