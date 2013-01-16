using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.BaseDados;
using KartRanking.Page;

namespace KartRanking
{
    public partial class index : PageBase
    {
        protected void Page_Load( object sender, EventArgs e )
        {

        }

        protected void btnLogar_Click( object sender, EventArgs e )
        {
            try
            {
                if ( string.IsNullOrEmpty( txtSenha.Text ) || string.IsNullOrEmpty( txtUsuario.Text ) )
                    throw new Exception( "Informe um usuário e senha." );

                BaseDados.DataKartDataContext dk = new BaseDados.DataKartDataContext();

                Usuario user = ( from p in dk.Usuarios
                              where p.Email.Equals( txtUsuario.Text.ToLower().Trim() ) && p.Senha.Equals( txtSenha.Text.ToLower().Trim() )
                              select p ).FirstOrDefault();

                if ( user == null )
                    throw new Exception("Usuário ou Senha inválidos!");

                Session[ "Usuario" ] = user;
                Response.Redirect( "~/Admin/PainelControle.aspx?idUsuario=" + user.idUsuario );
                
            }
            catch ( Exception ex )
            {
                Alert( ex );
            }
        }
    }
}
