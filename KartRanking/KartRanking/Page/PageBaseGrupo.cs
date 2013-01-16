using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KartRanking.Page
{
    public class PageBaseGrupo : PageBase
    {
        public int idGrupo { get; set; }
        
        protected override void OnInit(EventArgs e)
        {
            idGrupo = 0;

            if (Request.QueryString["IdGrupo"] != null && idGrupo == 0)
                idGrupo = Convert.ToInt16(Request.QueryString["IdGrupo"]);
            if (Session["idGrupoGrupos"] != null && idGrupo == 0)
                idGrupo = Convert.ToInt16(Session["idGrupoGrupos"]);          

            if(idGrupo <= 0)
                Response.Redirect("~/index.aspx");
            else
                Session["idGrupoGrupos"] = idGrupo;

            base.OnInit(e);
        }
    }
}
