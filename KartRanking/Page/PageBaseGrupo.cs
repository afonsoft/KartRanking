using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KartRanking.Page
{
    public class PageBaseGrupo : PageBase
    {
        public int IdGrupo
        {
            get
            {
                if (Session["idGrupoGrupos"] != null)
                    return Convert.ToInt32(Session["idGrupoGrupos"]);
                else
                    Session["idGrupoGrupos"] = 0;
                return 0;
            }
            set
            {
                Session["idGrupoGrupos"] = value.ToString();
            }
        }

        public int IdCampeonato
        {
            get
            {
                if (Session["IdCampeonatoGrupos"] != null)
                    return Convert.ToInt32(Session["IdCampeonatoGrupos"]);
                else
                    Session["IdCampeonatoGrupos"] = 0;
                return 0;
            }
            set
            {
                Session["IdCampeonatoGrupos"] = value.ToString();
            }
        }
        
        protected override void OnInit(EventArgs e)
        {
            IdGrupo = 0;

            if (Request.QueryString["IdGrupo"] != null)
                IdGrupo = Convert.ToInt16(Request.QueryString["IdGrupo"]);              

            if (IdGrupo <= 0)
                Response.Redirect("~/Administrador/index.aspx");

            base.OnInit(e);
        }
    }
}
