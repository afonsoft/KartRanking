using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KartRanking.Grupo
{
    public partial class KartGrupo : System.Web.UI.MasterPage
    {
        public string TituloGrupo 
        {
            set { ltNomeGrupo.Text = value; }
            get { return ltNomeGrupo.Text; }
        }

        public int idGrupo
        {
            set { Session["idGrupoMaster"] = value.ToString(); }
            get { return Session["idGrupoMaster"] != null ? Convert.ToInt16(Session["idGrupoMaster"]) : 0; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["idGrupo"] != null)
            {
                idGrupo = Convert.ToInt16(Request.QueryString["idGrupo"]);
            }
        }
    }
}
