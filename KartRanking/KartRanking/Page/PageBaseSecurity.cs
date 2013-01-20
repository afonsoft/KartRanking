using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KartRanking.BaseDados;

namespace KartRanking.Page
{
    public class PageBaseSecurity : PageBase
    {

        public int IdGrupo
        {
            get { return Session["IdGrupo"] != null ? Convert.ToInt16(Session["IdGrupo"]) : 0; }
            set { Session["IdGrupo"] = value.ToString(); }
        }

        public int IdCampeonato {
            get { return Session["IdCampeonato"] != null ? Convert.ToInt16(Session["IdCampeonato"]) : 0; }
            set { Session["IdCampeonato"] = value.ToString(); }
        }

        private bool ValidarSeAtivo()
        {
            Usuario user = (Usuario)Session["Usuario"];
            if (user.Ativo == false)
            {
                Response.Redirect("~/Administrador/perfil.aspx", true);
                return false;
            }
            return true;
        }

        public bool IsThisGroup
        {
            get
            {
                try
                {
                    int idGrupo = 0;

                    if (Request.QueryString["IdGrupo"] != null)
                        idGrupo = Convert.ToInt16(Request.QueryString["IdGrupo"]);

                    if (Session["IdGrupo"] != null)
                        idGrupo = Convert.ToInt16(Session["IdGrupo"]);

                    if (idGrupo > 0)
                    {
                        if (Session["Usuario"] != null)
                        {
                            Usuario user = (Usuario)Session["Usuario"];
                            var admin = (from t in new DataKartDataContext().Kart_Usuario_Grupos
                                         where t.idGrupo == idGrupo && t.idUsuario == user.idUsuario
                                         select t).FirstOrDefault();

                            if (admin != null)
                                return true;
                            else
                                return false;
                        }
                        return false;
                    }
                    else
                    {
                        //Caso não tenha nenhum grupo selecionado
                        return true;
                    }
                }
                catch
                {
                    return true;
                }
            }
        }

        public bool IsAdmin
        {
            get
            {
                try
                {
                    int idGrupo = 0;

                    if (Request.QueryString["IdGrupo"] != null)
                        idGrupo = Convert.ToInt16(Request.QueryString["IdGrupo"]);

                    if (Session["IdGrupo"] != null)
                        idGrupo = Convert.ToInt16(Session["IdGrupo"]);

                    if (idGrupo > 0)
                    {
                        if (Session["Usuario"] != null)
                        {
                            Usuario user = (Usuario)Session["Usuario"];
                            var admin = (from t in new DataKartDataContext().Kart_Usuario_Grupos
                                         where t.idGrupo == idGrupo && t.idUsuario == user.idUsuario
                                         select new { t.Admin }).FirstOrDefault();

                            if (admin != null && admin.Admin.HasValue)
                                return admin.Admin.Value;
                            else
                                return false;
                        }
                    }
                    return false;
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool IsAdminGrupo(int idGrupo)
        {
            if (Session["Usuario"] != null)
            {
                Usuario user = (Usuario)Session["Usuario"];
                var admin = (from t in new DataKartDataContext().Kart_Usuario_Grupos
                             where t.idGrupo == idGrupo && t.idUsuario == user.idUsuario
                             select new { t.Admin }).FirstOrDefault();

                if (admin != null && admin.Admin.HasValue)
                    return admin.Admin.Value;
                else
                    return false;
            }
            return false;
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (Session["Usuario"] == null && ViewState["Usuario"] == null)
                Response.Redirect("~/index.aspx");
            else if (ViewState["Usuario"] != null && Session["Usuario"] == null)
            {
                Session["Usuario"] = ViewState["Usuario"];
            }
            else if (Session["Usuario"].GetType() != typeof(BaseDados.Usuario))
            {
                Session["Usuario"] = null;
                Response.Redirect("~/index.aspx");
            }
            else
            {
                ViewState["Usuario"] = Session["Usuario"];
                //Verificar se o Usuario pertence ao grupo
                if (!IsThisGroup)
                {
                    Session["Msg"] = "Você não possue permissão para acessar este grupo.";
                    Response.Redirect("~/Admin/PainelControle.aspx");
                }
                else
                {
                    if (ValidarSeAtivo())
                    {
                        if (Request.QueryString["IdGrupo"] != null)
                        {
                            IdGrupo = Convert.ToInt16(Request.QueryString["IdGrupo"]);
                        }
                    }
                }

            }
        }
    }
}