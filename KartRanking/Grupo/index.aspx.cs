using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;

namespace KartRanking.Grupo
{
    public partial class index : PageBaseGrupo
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            HiddenIdGrupo.Value = "0";
            HiddenIdGrupo.Value = IdGrupo.ToString();
            Session["idGrupoGrupos"] = IdGrupo;
            CarregarGrids(IdGrupo);
        }

        private void CarregarGrids(int idGrupo)
        {
            CarregarGridCampeonato(idGrupo);
        }

        private void CarregarGridCampeonato(int idGrupo)
        {
            string NomeGrupo = (from g in dk.Kart_Grupos
                                where g.idGrupo == idGrupo
                                select g.NomeGrupo).SingleOrDefault();

            ((KartGrupo)this.Master).TituloGrupo = NomeGrupo;

            int idCampeonato = (from c in dk.Kart_Campeonatos
                                where c.idGrupo == idGrupo
                                && c.Ativo == true
                                && c.dtFim >= DateTime.Now
                                orderby c.dtCriacao descending
                                select c.idCampeonato).SingleOrDefault();

            if (idCampeonato > 0)
            {
                var resultado = (from c in dk.View_Kart_Usuario_Pontos_Campeonatos
                                where c.idGrupo == idGrupo
                                  && c.idCampeonato == idCampeonato
                                orderby c.Pontos descending
                                select c).Take(10);

                ltNomeCampeonato.Text = (from c in dk.Kart_Campeonatos where c.idCampeonato == idCampeonato select c.NomeCampeonato).SingleOrDefault();

                gvCampeonatos.DataSource = resultado;
                gvCampeonatos.DataBind();

                CarregarGridCalendarioCampeonato(idCampeonato);
            }
            else
            {
                ltNomeCampeonato.Text = "Nenhum campeonato";
            }
        }

        private void CarregarGridCalendarioCampeonato(int IdCampeonato)
        {
            try
            {
                var resultados = (from i in dk.Kart_Calendario_Campeonatos
                                  where i.Ativo == true
                                  && i.idCampeonato == IdCampeonato
                                  && i.Data >= DateTime.Now.AddMonths(-1)
                                  orderby i.Data ascending
                                  select new { i.idCalendario, i.idCampeonato, i.Nome, i.Data, i.Horario }).Take(10).ToList();

                if (resultados != null && resultados.Count() > 0)
                {
                    //trata os campos
                    var result = (from i in resultados orderby i.Data ascending select new { i.idCalendario, i.idCampeonato, i.Nome, Data = Convert.ToString(i.Data.ToString("dd/MM/yyyy") + " " + i.Horario) });
                    gvEtapaCampeonatos.DataSource = result;
                    gvEtapaCampeonatos.DataBind();
                }
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }
    }
}
