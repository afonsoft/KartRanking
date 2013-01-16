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
            set { HiddenFieldIdGrupo.Value = value.ToString(); }
            get { return Convert.ToInt16(HiddenFieldIdGrupo.Value); }
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
