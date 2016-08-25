using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

        public string NomeGrupo
        {
            get
            {
                if (IdGrupo > 0)
                    return (from g in dk.Kart_Grupos where g.idGrupo == IdGrupo select g.NomeGrupo).FirstOrDefault();
                return "";
            }
        }

        public string NomeCampeonato
        {
            get
            {
                if (IdCampeonato > 0)
                    return (from c in dk.Kart_Campeonatos where c.idCampeonato == IdCampeonato select c.NomeCampeonato).FirstOrDefault();
                return "";
            }
        }

        protected override void OnInit(EventArgs e)
        {
            IdGrupo = 0;

            base.OnInit(e);

            if (Request.QueryString["IdGrupo"] != null)
                IdGrupo = Convert.ToInt32(Request.QueryString["IdGrupo"]);

            if (IdGrupo <= 0 && Request.QueryString["Id"] != null)
                IdGrupo = Convert.ToInt32(Request.QueryString["Id"]);

            if (IdGrupo <= 0)
            {
                Alert("Grupo inválido.", "/Administrador/index.aspx");
            }
            else
            {
                if (Request.QueryString["idCampeonato"] != null)
                    IdCampeonato = Convert.ToInt32(Request.QueryString["idCampeonato"]);
                else
                    CarregarCampeonatoPrincipal(IdGrupo);
            }

        }

        private void CarregarCampeonatoPrincipal(int idGrupo)
        {
            var campeonato = (from c in dk.Kart_Campeonatos
                              where c.idGrupo == idGrupo
                              && c.Ativo == true
                              orderby c.dtFim descending, c.dtCriacao descending, c.NomeCampeonato ascending
                              select c).FirstOrDefault();

            if (campeonato != null)
                IdCampeonato = campeonato.idCampeonato;
            else
                IdCampeonato = 0;
        }
    }
}
