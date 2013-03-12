using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using System.IO;
using KartRanking.email;
using KartRanking.Tools;

namespace KartRanking
{
    public partial class PermissoesGrupo : PageBaseSecurity
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario user = (Usuario)Session["Usuario"];
                PopularDDL(user.idUsuario);
                PopularGrids(Convert.ToInt16(ddlGrupos.SelectedValue));
            }
        }

        protected void ddlGrupos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IdGrupo"] = ddlGrupos.SelectedValue;
            Session["idCampeonato"] = null;
            PopularGrids(Convert.ToInt16(ddlGrupos.SelectedValue));
        }

        private void PopularDDL(int idUsuario)
        {
            var grupo = from g in dk.Kart_Grupos
                        join ug in dk.Kart_Usuario_Grupos on g.idGrupo equals ug.idGrupo
                        where ug.idUsuario == idUsuario
                        && ug.Aprovado == true
                        select g;

            if (grupo != null && grupo.Count() > 0)
            {
                ddlGrupos.DataSource = grupo;
                ddlGrupos.DataTextField = "NomeGrupo";
                ddlGrupos.DataValueField = "idGrupo";
                ddlGrupos.DataBind();
            }
            else
                ddlGrupos.Items.Add(new ListItem("Nenhum grupo associado a esse usuario", "0", true));

            if (Session["idGrupo"] != null)
            {
                try
                {
                    ddlGrupos.Items.FindByValue(Session["idGrupo"].ToString()).Selected = true;
                }
                catch { }
            }

        }

        private void PopularGrids(int idGrupo)
        {
            var NAdmin = from u in dk.Usuarios
                         join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                         where ug.idGrupo == idGrupo
                         && ug.Aprovado == true
                         && ug.Admin == false
                         select u;

            var Admin = from u in dk.Usuarios
                        join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                        where ug.idGrupo == idGrupo
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
                    int idGrupo = Convert.ToInt16(ddlGrupos.SelectedValue);
                    int IdUsuarioLider = ((Usuario)Session["Usuario"]).idUsuario;

                    if (idUsuario == IdUsuarioLider)
                        throw new Exception("Não é possivel alterar o usuário lider do grupo.");

                    Kart_Usuario_Grupo ug = (from u in dk.Kart_Usuario_Grupos
                                             where u.idUsuario == idUsuario
                                             && u.Aprovado == true
                                             select u).FirstOrDefault();

                    if (e.CommandName == "Incluir")
                        ug.Admin = true;
                    else if (e.CommandName == "Excluir")
                        ug.Admin = false;

                    dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);
                    EMail.EnviarEmailStatusPermissao(idUsuario, idGrupo, ug.Admin.Value);
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
                PopularGrids(Convert.ToInt16(ddlGrupos.SelectedValue));
            }
        
        }

        
    }
}