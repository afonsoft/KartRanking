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
                    lbData.Text = user.DtNascimento.HasValue ? user.DtNascimento.Value.ToString("dd/MM/yyyy") : "";
                    lbNome.Text = user.Nome;
                    ImgPerfil.ImageUrl = "~/Administrador/ImageHandler.ashx?id=" + user.idUsuario;
                    lbEquipe.Text = "TESTE";
                    lbPontos.Text = "0";
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

    }
}
