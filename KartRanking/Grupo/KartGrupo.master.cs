using System;
using System.Linq;
using KartRanking.BaseDados;

namespace KartRanking.Grupo
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)    *
    * DATA: 26-03-2014                                      *
    * E-MAIL: afonsoft@outlook.com.br                       *
    * *******************************************************
    * ALTERAÇÕES:                                           *
    * 04/04/2014: Incluido o Google Plus button             *
    ********************************************************/
    public partial class KartGrupo : System.Web.UI.MasterPage
    {
        public string TituloGrupo 
        {
            set { ltNomeGrupo.Text = value; }
            get { return ltNomeGrupo.Text; }
        }

        public int IdGrupo
        {
            set { Session["idGrupoGrupos"] = value.ToString(); }
            get { return Session["idGrupoGrupos"] != null ? Convert.ToInt16(Session["idGrupoGrupos"]) : 0; }
        }

        public string UrlGrupo
        {
            get
            {

                if (Session["UrlGrupo"] == null)
                {
                    using (DataKartDataContext db = new DataKartDataContext())
                    {
                        db.ObjectTrackingEnabled = false;
                        Session["UrlGrupo"] = (from g in db.Kart_Grupos
                                               where g.idGrupo == IdGrupo
                                               select g.UrlAcesso).FirstOrDefault();
                    }
                }
                return (string)Session["UrlGrupo"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["idGrupo"] != null)
            {
                IdGrupo = Convert.ToInt16(Request.QueryString["idGrupo"]);
            }

            if (Request.QueryString["id"] != null)
            {
                IdGrupo = Convert.ToInt16(Request.QueryString["id"]);
            }
        }
    }
}
