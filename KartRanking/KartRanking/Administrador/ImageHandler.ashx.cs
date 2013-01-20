using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Drawing;
using System.Drawing.Imaging;
using KartRanking.Tools;
using KartRanking.BaseDados;

namespace KartRanking.Administrador
{
    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    [WebService( Namespace="http://kart.afonsoft.com.br/" )]
    [WebServiceBinding( ConformsTo=WsiProfiles.BasicProfile1_1 )]
    public class ImageHandler : IHttpHandler
    {

        public void ProcessRequest( HttpContext context )
        {
            try
            {
                context.Response.Clear();
                Image image = null;
                Usuario user = null;

                if ( context.Session != null && context.Session[ "Usuario" ] != null )
                    user = ( Usuario )context.Session[ "Usuario" ];

                if ( user == null )
                {
                    if ( !String.IsNullOrEmpty( context.Request.QueryString[ "id" ] ) )
                    {
                        int id = Int32.Parse( context.Request.QueryString[ "id" ] );
                        DataKartDataContext dk = new DataKartDataContext();
                        user = ( from u in dk.Usuarios
                                 where u.idUsuario == id
                                 select u ).FirstOrDefault();
                    }
                }

                if ( user.Foto != null && user.Foto.Length>0 )
                    image = ImageUtil.BinaryToImage( user.Foto );
                else
                    image = ImageUtil.FileToImage( PathUtil.GetFullPathRoot()+@"\piloto-sem-foto.jpg" );


                // Of course set this to whatever your format is of the image
                context.Response.ContentType = "image/jpeg";
                // Save the image to the OutputStream
                image.Save( context.Response.OutputStream, ImageFormat.Jpeg );
            }
            catch ( Exception ex )
            {
                LogErro.Log.Logar(ex, null);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}