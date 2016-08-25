using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KartRanking.BaseDados;

namespace KartRanking.Page
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)    *
    * DATA: 26-03-2014                                      *
    * E-MAIL: afonsoft@outlook.com.br                       *
    * *******************************************************
    * ALTERAÇÕES:                                           *
    * Popular o IdGrupo e IdCampeonato com o ultimo caso    *
    * Não tenha nenhum selecionado                          * 
    *********************************************************/
    public class PageBaseSecurity : PageBase
    {
        public string SetTitle
        {
            get
            {
                if (Session["Title"] == null)
                    Session["Title"] = "Gerenciamento de campeonatos de Kart com ranking";
                return Session["Title"].ToString();

            }
            set { Session["Title"] = value; }
        }

        public int IdGrupo
        {
            get
            {
                int idGrupo = 0;
                if (Request.QueryString["IdGrupo"] != null)
                {
                    int.TryParse(Request.QueryString["IdGrupo"], out idGrupo);
                    if (idGrupo > 0)
                        Session["IdGrupo"] = idGrupo;
                }
                if (Session["IdGrupo"] != null)
                {
                    int.TryParse(Session["IdGrupo"].ToString(), out idGrupo);
                }

                if (idGrupo <= 0 && UsuarioLogado != null && UsuarioLogado.idUsuario > 0)
                {
                    using (DataKartDataContext dk = new DataKartDataContext())
                    {
                        idGrupo = (from g in dk.Kart_Usuario_Grupos
                                   join g1 in dk.Kart_Grupos on g.idGrupo equals g1.idGrupo
                                   where g.idUsuario == UsuarioLogado.idUsuario
                                   && g1.Ativo == true
                                   orderby g1.dtCriacao descending
                                   select g.idGrupo).FirstOrDefault();
                    }
                }

                Session["IdGrupo"] = idGrupo;
                return idGrupo;
            }
            set
            {
                Session["IdGrupo"] = value.ToString();
            }
        }

        public int IdCampeonato
        {
            get
            {
                int idCampeonato = 0;
                if (Request.QueryString["IdCampeonato"] != null)
                {
                    int.TryParse(Request.QueryString["IdCampeonato"], out idCampeonato);
                    if (idCampeonato > 0)
                        Session["IdCampeonato"] = idCampeonato;
                }
                if (Session["IdCampeonato"] != null)
                {
                    int.TryParse(Session["IdCampeonato"].ToString(), out idCampeonato);
                }

                if (IdGrupo > 0 && idCampeonato <= 0)
                {
                    using (DataKartDataContext dk = new DataKartDataContext())
                    {
                        idCampeonato = (from c in dk.Kart_Campeonatos
                                        orderby c.dtFim descending, c.dtCriacao descending, c.NomeCampeonato ascending
                                        where c.idGrupo == IdGrupo
                                        && c.Ativo == true
                                        select c.idCampeonato).FirstOrDefault();
                    }
                }

                Session["IdCampeonato"] = idCampeonato;
                return idCampeonato;
            }
            set
            {
                Session["IdCampeonato"] = value.ToString();
            }
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

                    if (IdGrupo > 0)
                    {
                        if (Session["Usuario"] != null)
                        {
                            Usuario user = (Usuario)Session["Usuario"];
                            using (DataKartDataContext db = new DataKartDataContext())
                            {
                                var admin = (from t in db.Kart_Usuario_Grupos
                                             where t.idGrupo == IdGrupo && t.idUsuario == user.idUsuario
                                             select t).FirstOrDefault();

                                if (admin != null)
                                    return true;
                                else
                                    return false;
                            }
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
                    if (IdGrupo > 0)
                    {
                        if (Session["Usuario"] != null)
                        {
                            Usuario user = (Usuario)Session["Usuario"];
                            using (DataKartDataContext db = new DataKartDataContext())
                            {
                                var admin = (from t in db.Kart_Usuario_Grupos
                                             where t.idGrupo == IdGrupo && t.idUsuario == user.idUsuario
                                             select new { t.Admin }).FirstOrDefault();

                                if (admin != null && admin.Admin.HasValue)
                                    return admin.Admin.Value;
                                else
                                    return false;
                            }
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

            if (ViewState["Usuario"] != null && Session["Usuario"] == null)
                Session["Usuario"] = ViewState["Usuario"];

            if (Session["Usuario"] != null && Session["Usuario"].GetType() != typeof(BaseDados.Usuario))
                Session["Usuario"] = null;

            if (Session["Usuario"] == null)
                Response.Redirect("~/Administrador/index.aspx");

            ViewState["Usuario"] = Session["Usuario"];
            //Verificar se o Usuario pertence ao grupo
            if (!IsThisGroup)
            {
                Alert("Você não possue permissão para acessar este grupo.", null, "~/Administrador/index.aspx");
                return;
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

        public Usuario UsuarioLogado
        {
            get
            {
                return (Usuario)Session["Usuario"];
            }
        }
    }
}