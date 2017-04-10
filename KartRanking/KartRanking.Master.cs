using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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

        public Usuario UsuarioLogado
        {
            get
            {
                return (Usuario) Session["Usuario"];
            }
        }

        protected void Page_Load( object sender, EventArgs e )
        {
            
        }
    }
}
