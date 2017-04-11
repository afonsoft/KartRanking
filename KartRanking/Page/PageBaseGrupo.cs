using System;
using System.Linq;
using KartRanking.BaseDados;

namespace KartRanking.Page
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
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

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (Request.QueryString["IdGrupo"] != null)
                IdGrupo = Convert.ToInt32(Request.QueryString["IdGrupo"]);

            if (IdGrupo <= 0 && Request.QueryString["Id"] != null)
                IdGrupo = Convert.ToInt32(Request.QueryString["Id"]);

            if (IdGrupo <= 0)
            {
                Alert("Grupo inválido.", "/Administrador/index.aspx");
            }

        }
    }
}
