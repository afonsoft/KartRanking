using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;

namespace KartRanking.Administrador
{
    public partial class home : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PilotoDestaque();
                PopularGrid();
                CarregarNoticias();
            }
        }

        protected void lnkMaisInfo_Click(object sender, EventArgs e)
        {
            if (ViewState["UsuarioSelecionado"] != null)
            {
                Int32 idUsuario = Convert.ToInt32(ViewState["UsuarioSelecionado"]);
                Response.Redirect("perfil.aspx?idUsuario=" + idUsuario + "&Edit=false&idGrupo=" + IdGrupo);
            }
        }

        private void PilotoDestaque()
        {
            if (IdGrupo > 0)
            {
                Random rnd = new Random();
                List<Usuario> users = (from u in dk.Usuarios
                                       join g in dk.Kart_Usuario_Grupos on u.idUsuario equals g.idUsuario
                                       where g.idGrupo == IdGrupo
                                       && u.Ativo == true
                                       select u).ToList();

                if (users != null)
                {

                    int UsuarioSelecionado = rnd.Next(users.Count());
                    Usuario user = users[UsuarioSelecionado];

                    string Equipe = (from e in dk.Kart_Equipe_Campeonatos
                                     join eu in dk.Kart_Usuario_Equipe_Campeonatos on e.idEquipeCampeonato equals eu.idEquipeCampeonato
                                     where e.idCampeonato == IdCampeonato
                                     && eu.idUsuario == user.idUsuario
                                     select e.NomeEquipe).FirstOrDefault();

                    int? Pontos = (from vp in dk.View_Kart_Usuario_Pontos_Campeonatos
                                  where vp.idCampeonato == IdCampeonato
                                  && vp.idGrupo == IdGrupo
                                  && vp.idUsuario == user.idUsuario
                                  select vp.Pontos).FirstOrDefault();

                    lbData.Text = user.DtNascimento.HasValue ? user.DtNascimento.Value.ToString("dd/MM/yyyy") : "";
                    lbNome.Text = user.Nome;
                    ImgPerfil.ImageUrl = "~/Administrador/ImageHandler.ashx?id=" + user.idUsuario;
                    lbEquipe.Text = Equipe;
                    lbPontos.Text = Pontos.HasValue ? Pontos.Value.ToString() : "0";
                    ViewState["UsuarioSelecionado"] = user.idUsuario;
                }

            }
        }

        private void PopularGrid()
        {
            if (IdGrupo > 0 && IdCampeonato > 0)
            {
                //View para popular o grid (Ranking do Campeonato)
                var RankingC = (from vp in dk.View_Kart_Usuario_Pontos_Campeonatos
                                where vp.idCampeonato == IdCampeonato
                                && vp.idGrupo == IdGrupo
                                orderby vp.Pontos descending
                                select vp).Take(10);

                gvRankigCampeonato.DataSource = RankingC;
                gvRankigCampeonato.DataBind();

                //View para popular o grid (Ranking das equipe)
                var RankingE = (from ve in dk.View_Kart_Equipe_Pontos_Campeonatos
                                where ve.idCampeonato == IdCampeonato
                                && ve.idGrupo == IdGrupo
                                orderby ve.Pontos descending
                                select ve).Take(10);

                gvRankigEquipe.DataSource = RankingE;
                gvRankigEquipe.DataBind();
            }
        }

        private void CarregarNoticias()
        {
            string strHtml = "";
            string strLista = "";

            var noticias = (from n in dk.Kart_Noticias_Grupos
                            where n.idGrupo == IdGrupo
                            && n.dtCriacao >= DateTime.Now.AddMonths(-1)
                            orderby n.dtCriacao descending
                            select n);

            strHtml += " <div id='slider'> ";
            strHtml += " <ul>  ";

            int iFormatar = 0;
            foreach (var n in noticias)
            {
                if (iFormatar == 0)
                {
                    strLista += "         <li>";
                    strLista += "             <div class='sliderTitulo' style='padding: 1px 1px 1px 1px;'> ";
                    strLista += n.Titulo;
                    strLista += "             </div> ";
                    strLista += "             <div class='sliderSinopise' style='padding: 0px 0px 1px 0px;'>";
                    strLista += Sinopse(n.Noticia, n.idNoticias, n.dtCriacao.Value.ToString("dd/MM/yyyy"));
                    strLista += "             </div> ";
                }
                else
                {
                    strLista += "             <div class='sliderTitulo' style='padding: 1px 1px 1px 1px;'> ";
                    strLista += n.Titulo;
                    strLista += "             </div> ";
                    strLista += "             <div class='sliderSinopise' style='padding: 0px 0px 1px 0px;'>";
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
                strLista += "         </li> ";
                strHtml += strLista;
                strLista = "";
            }
           
            strHtml += "     </ul> ";
            strHtml += " </div>       ";

            ltNoticias.Text = strHtml;
        }

        private string Sinopse(string texto, int id, string data)
        {
            string r = "";
            if (texto.Length >= 97)
                r = texto.Substring(0, 97) + "...";
            else
                r = texto;

            return StripTagsCharArray(r) + "<br/>" + data + " - <a href='Noticias.aspx?id=" + id + "'\">Continuar lendo...</a>";
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
                char let = source[i];
                if (let == '<')
                {
                    inside = true;
                    continue;
                }
                if (let == '>')
                {
                    inside = false;
                    continue;
                }
                if (!inside)
                {
                    array[arrayIndex] = let;
                    arrayIndex++;
                }
            }
            return new string(array, 0, arrayIndex);
        }

    }
}
