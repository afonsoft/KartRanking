using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using KartRanking.email;

namespace KartRanking.Administrador
{
    public partial class PermissaoGrupo : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopularGrids();
            }
        }
        private void PopularGrids()
        {
            var NAdmin = from u in dk.Usuarios
                         join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                         orderby u.Nome
                         where ug.idGrupo == IdGrupo
                         && ug.Aprovado == true
                         && ug.Admin == false
                         select u;

            var Admin = from u in dk.Usuarios
                        join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                        orderby u.Nome
                        where ug.idGrupo == IdGrupo
                        && ug.Aprovado == true
                        && ug.Admin == true
                        select u;

            gvUsuariosAdmin.DataSource = Admin;
            gvUsuariosNAdmin.DataSource = NAdmin;
            gvUsuariosNAdmin.DataBind();
            gvUsuariosAdmin.DataBind();
        }
        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (IsAdmin)
                {

                    int idUsuario = Convert.ToInt16(e.CommandArgument);
                    int IdUsuarioLider = (from u in dk.Kart_Grupos where u.idGrupo == IdGrupo select u.Id_Usuario_Lider).FirstOrDefault();

                    if (idUsuario == IdUsuarioLider)
                        throw new Exception("Não é possivel alterar o usuário lider do grupo.");

                    Kart_Usuario_Grupo ug = (from u in dk.Kart_Usuario_Grupos
                                             where u.idUsuario == idUsuario
                                             && u.idGrupo == IdGrupo
                                             && u.Aprovado == true
                                             select u).FirstOrDefault();

                    if (e.CommandName == "Incluir")
                        ug.Admin = true;
                    else if (e.CommandName == "Excluir")
                        ug.Admin = false;

                    dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);
                    EMail.EnviarEmailStatusPermissao(idUsuario, IdGrupo, ug.Admin.Value);
                }
                else
                {
                    Alert("Você não é o administrador do grupo para efetuar essa operação!");
                }
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
            finally
            {
                PopularGrids();
            }

        }
    }
}
