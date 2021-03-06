﻿using System;
using System.Collections.Generic;
using System.Linq;
using KartRanking.Page;
using KartRanking.BaseDados;

namespace KartRanking.Grupo
{
    /*******************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    * Correção do login Fix #1                             *
    ********************************************************/
    public partial class index : PageBaseGrupo
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HiddenFieldStartTime.Value = "00:00:00:00";//dd:hh:mm:ss
            HiddenIdGrupo.Value = "0";
            HiddenIdGrupo.Value = IdGrupo.ToString();
            PopularProximaEtapa();
            PilotoDestaque();
            PopularGrid(); 
            CarregarNoticias();
            
        }
        private void PopularProximaEtapa()
        {
            using (DataKartDataContext dk = new DataKartDataContext())
            {
                var result = (from cal in dk.Kart_Calendario_Campeonatos
                              join camp in dk.Kart_Campeonatos on cal.idCampeonato equals camp.idCampeonato
                              orderby cal.Data ascending
                              where camp.idGrupo == IdGrupo
                              && camp.Ativo == true
                              && cal.Data >= DateTime.Now.AddDays(-1)
                              && camp.dtInicio <= DateTime.Now
                              && camp.dtFim >= DateTime.Now
                              select new { cal.Data, cal.Horario }).FirstOrDefault();

                if (result != null)
                {
                    DateTime date = result.Data;
                    LtProximaEtapa.Text = result.Data.ToString("dd/MM/yyyy") + " as " + result.Horario + ":00";
                    string[] hm = result.Horario.Split(':');

                    if (!string.IsNullOrEmpty(hm[0]))
                        date = date.AddHours(Convert.ToInt16(hm[0]));
                    if (hm.Length > 0 && !string.IsNullOrEmpty(hm[1]))
                        date = date.AddMinutes(Convert.ToInt16(hm[1]));

                    TimeSpan ts = date - DateTime.Now;

                    HiddenFieldStartTime.Value = ts.TotalSeconds >= 0 ? ts.TotalSeconds.ToString(culture) : "0";
                }
                else
                {
                    LtProximaEtapa.Text = "Nenhuma cadastrada";
                    HiddenFieldStartTime.Value = "0";
                }
            }
        }

        public string NomeGrupo
        {
            get
            {
                using (DataKartDataContext dk = new DataKartDataContext())
                {
                    return (from g in dk.Kart_Grupos where g.idGrupo == IdGrupo select g.NomeGrupo).FirstOrDefault();
                }
            }
        }

        public string NomeCampeonato
        {
            get
            {
                using (DataKartDataContext dk = new DataKartDataContext())
                {
                    return
                        (from c in dk.Kart_Campeonatos where c.idCampeonato == IdCampeonato select c.NomeCampeonato)
                            .FirstOrDefault();
                }
            }
        }


        public int IdUsuarioDestaque { get; set; }
        private void PilotoDestaque()
        {
            if (IdGrupo > 0)
            {
                DataKartDataContext dk = new DataKartDataContext();
                Random rnd = new Random();
                List<Usuario> users = (from u in dk.Usuarios
                                       join g in dk.Kart_Usuario_Grupos on u.idUsuario equals g.idUsuario
                                       where g.idGrupo == IdGrupo
                                       && u.Ativo == true
                                       select u).ToList();

                if (users.Count > 0)
                {

                    int usuarioSelecionado = rnd.Next(users.Count);
                    Usuario user = users[usuarioSelecionado];

                    string equipe = (from e in dk.Kart_Equipe_Campeonatos
                                     join eu in dk.Kart_Usuario_Equipe_Campeonatos on e.idEquipeCampeonato equals eu.idEquipeCampeonato
                                     where e.idCampeonato == IdCampeonato
                                     && eu.idUsuario == user.idUsuario
                                     select e.NomeEquipe).FirstOrDefault();

                    int? pontos = (from vp in dk.View_Kart_Usuario_Pontos_Campeonatos
                                   where vp.idCampeonato == IdCampeonato
                                   && vp.idGrupo == IdGrupo
                                   && vp.idUsuario == user.idUsuario
                                   select vp.Pontos).FirstOrDefault();

                    lbData.Text = user.DtNascimento?.ToString("dd/MM/yyyy") ?? "--/--/----";
                    lbNome.Text = user.Nome;
                    lbEquipe.Text = equipe;
                    lbPontos.Text = pontos?.ToString() ?? "0";
                    ltPerfilFace.Text = string.IsNullOrEmpty(user.Perfil_Facebook) ? "------------" : "<a href='" + user.Perfil_Facebook + "' target='_blank'>" + (user.Perfil_Facebook.Length > 30 ? user.Perfil_Facebook.Substring(0, 30) + "..." : user.Perfil_Facebook) + "</a>";
                    IdUsuarioDestaque = user.idUsuario;
                }
            }
            else
            {
                lbData.Text = "--/--/----";
                lbNome.Text = "Nenhum piloto";
                lbEquipe.Text = "---";
                lbPontos.Text = "0";
                ltPerfilFace.Text = "------------";
                IdUsuarioDestaque = 0;
            }
        }

        private void PopularGrid()
        {
            if (IdGrupo > 0 && IdCampeonato > 0)
            {
                DataKartDataContext dk = new DataKartDataContext();
                //View para popular o grid (Ranking do Campeonato)
                var rankingC = (from vp in dk.View_Kart_Usuario_Pontos_Campeonatos
                                where vp.idCampeonato == IdCampeonato
                                && vp.idGrupo == IdGrupo
                                orderby vp.Pontos descending
                                select vp).Take(10);

                gvRankigCampeonato.DataSource = rankingC;
                gvRankigCampeonato.DataBind();

                //View para popular o grid (Ranking das equipe)
                var rankingE = (from ve in dk.View_Kart_Equipe_Pontos_Campeonatos
                                where ve.idCampeonato == IdCampeonato
                                && ve.idGrupo == IdGrupo
                                orderby ve.Pontos descending
                                select ve).Take(10);

                gvRankigEquipe.DataSource = rankingE;
                gvRankigEquipe.DataBind();
            }
            else
            {
                gvRankigCampeonato.DataSource = null;
                gvRankigCampeonato.DataBind();

                gvRankigEquipe.DataSource = null;
                gvRankigEquipe.DataBind();
            }
        }

        private void CarregarNoticias()
        {
            string strHtml = "";
            string strLista = "";
            DataKartDataContext dk = new DataKartDataContext();
            var noticias = (from n in dk.Kart_Noticias_Grupos
                            where n.idGrupo == IdGrupo
                            && n.dtCriacao >= DateTime.Now.AddYears(-1)
                            orderby n.dtCriacao descending
                            select n).Take(20).ToArray();

            strHtml += " <div id='slider'> ";
            strHtml += " <ul>  ";
            int total = 0;
            int iFormatar = 0;
            foreach (var n in noticias)
            {
                total++;
                if (iFormatar == 0)
                {
                    strLista += "         <li>";
                    strLista += "             <div class='sliderTitulo' style='padding: 1px 1px 1px 1px;'> ";
                    strLista += n.Titulo;
                    strLista += "             </div> ";
                    strLista += "             <div class='sliderSinopise' style='padding: 0px 0px 1px 0px;'>";
                    if (n.dtCriacao != null)
                        strLista += Sinopse(n.Noticia, n.idNoticias, n.dtCriacao.Value.ToString("dd/MM/yyyy"));
                    strLista += "             </div> ";
                }
                else
                {
                    strLista += "             <div class='sliderTitulo' style='padding: 1px 1px 1px 1px;'> ";
                    strLista += n.Titulo;
                    strLista += "             </div> ";
                    strLista += "             <div class='sliderSinopise' style='padding: 0px 0px 1px 0px;'>";
                    if (n.dtCriacao != null)
                        strLista += Sinopse(n.Noticia, n.idNoticias, n.dtCriacao.Value.ToString("dd/MM/yyyy"));
                    strLista += "             </div> ";
                }
                if (iFormatar == 3)
                {
                    strLista += "         </li> ";
                    strHtml += strLista;
                    strLista = "";
                    iFormatar = 0;
                }
                else
                {
                    iFormatar++;
                }
            }

            if (iFormatar < 3)
            {
                if (total == 0)
                    strLista += "<div class='sliderTitulo' style='padding: 1px 1px 1px 1px;'> Nenhuma Noticias</div>";

                strLista += "         </li> ";
                strHtml += strLista;
            }

            strHtml += "     </ul> ";
            strHtml += " </div>       ";

            ltNoticias.Text = strHtml;
        }

        private string Sinopse(string texto, int id, string data)
        {
            string r;
            if (texto.Length >= 97)
                r = texto.Substring(0, 97) + "...";
            else
                r = texto;

            return StripTagsCharArray(r) + "<br/>" + data + " - <a href='/" + UrlGrupo + "/noticias/" + id + "'>Continuar lendo...</a>";
        }

        /// <summary>
        /// Remove HTML tags from string using char array.
        /// </summary>
        public static string StripTagsCharArray(string source)
        {
            char[] array = new char[source.Length];
            int arrayIndex = 0;
            bool inside = false;

            for (int i = 0; i < source.Length; i++)
            {
                if (source[i] == '<')
                {
                    inside = true;
                    continue;
                }
                if (source[i] == '>')
                {
                    inside = false;
                    continue;
                }
                if (!inside)
                {
                    array[arrayIndex] = source[i];
                    arrayIndex++;
                }
            }
            return new string(array, 0, arrayIndex);
        }
    }
}
