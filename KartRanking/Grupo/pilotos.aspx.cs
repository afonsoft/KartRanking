﻿using System;
using System.Linq;
using KartRanking.BaseDados;
using KartRanking.Page;

namespace KartRanking.Grupo
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
    public partial class pilotos : PageBaseGrupo
    {
        public int Id { set; get; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string op = Request.QueryString["op"];
                string sidUsuario = Request.QueryString["idUsuario"];
                string sidEquipe = Request.QueryString["IdEquipe"];

                if (op == "pilotos" || string.IsNullOrEmpty(op))
                {
                    PopularGrid(1);
                    PanelPiloto.Visible = true;
                    PanelEquipes.Visible = false;
                    PanelInfo.Visible = false;
                    PanelInfoEquipe.Visible = false;
                }
                else if (op == "equipes" && string.IsNullOrEmpty(sidEquipe))
                {
                    PopularGrid(2);
                    PanelPiloto.Visible = false;
                    PanelEquipes.Visible = true;
                    PanelInfo.Visible = false;
                    PanelInfoEquipe.Visible = false;
                }
                else if (op == "equipes" && !string.IsNullOrEmpty(sidEquipe))
                {
                    PanelPiloto.Visible = false;
                    PanelEquipes.Visible = false;
                    PanelInfo.Visible = false;
                    PanelInfoEquipe.Visible = true;
                    PopularEquipe(Convert.ToInt32(sidEquipe));
                }

                else if (op == "info" && !string.IsNullOrEmpty(sidUsuario))
                {
                    PanelPiloto.Visible = false;
                    PanelEquipes.Visible = false;
                    PanelInfo.Visible = true;
                    PanelInfoEquipe.Visible = false;
                    PopularInfo(Convert.ToInt32(sidUsuario));
                }
            }
        }

        private void PopularEquipe(int idEquipe)
        {

        }

        private void PopularInfo(int idUsuario)
        {
            DataKartDataContext dk = new DataKartDataContext();
            var user = (from p in dk.Usuarios
                                      where p.idUsuario == idUsuario
                                      select p).FirstOrDefault();

            if (user != null)
            {
                IdUsuario.Value = user.idUsuario.ToString();
                txtNome.Text = user.Nome;
                txtDtNascimento.Text = user.DtNascimento.HasValue ? user.DtNascimento.Value.ToString("dd/MM/yyyy") : "";
                txtApelido.Text = user.Apelido;
                txtPeso.Text = user.Peso.ToString();
                txtAltura.Text = user.Altura.ToString();
                txtCidade.Text = user.Cidade;
                if (!String.IsNullOrEmpty(user.Estado))
                    ddlEstado.Items.FindByValue(user.Estado).Selected = true;
                if (user.Sexo.HasValue)
                    ddlSexo.Items.FindByValue(user.Sexo.Value.ToString()).Selected = true;

                txtPerfilFacebook.Text = user.Perfil_Facebook;
                txtPerfilTwitter.Text = user.Perfil_Twitter;
                txtPerfilPlus.Text = user.Perfil_Plus;
                txtObs.Text = user.Obs;
                Id = user.idUsuario;
                //ImgPerfil.ImageUrl = "~/Administrador/ImageHandler.ashx?id=" + user.idUsuario;
            }
        }

        private void PopularGrid(int op)
        {
            gvRankigCampeonato.DataSource = null;
            gvRankigCampeonato.DataBind();

            gvRankigEquipe.DataSource = null;
            gvRankigEquipe.DataBind();

            if (IdGrupo > 0 && IdCampeonato > 0)
            {
                DataKartDataContext dk = new DataKartDataContext();
                if (op == 1)
                {
                    //View para popular o grid (Ranking do Campeonato)
                    var rankingC = (from vp in dk.View_Kart_Usuario_Pontos_Campeonatos
                                    where vp.idCampeonato == IdCampeonato
                                    && vp.idGrupo == IdGrupo
                                    orderby vp.Pontos descending
                                    select vp);

                    gvRankigCampeonato.DataSource = rankingC;
                    gvRankigCampeonato.DataBind();
                }
                else if (op == 2)
                {
                    //View para popular o grid (Ranking das equipe)
                    var rankingE = (from ve in dk.View_Kart_Equipe_Pontos_Campeonatos
                                    where ve.idCampeonato == IdCampeonato
                                    && ve.idGrupo == IdGrupo
                                    orderby ve.Pontos descending
                                    select ve);

                    gvRankigEquipe.DataSource = rankingE;
                    gvRankigEquipe.DataBind();
                }
            }
        }
    }
}
