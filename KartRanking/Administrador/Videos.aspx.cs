using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using KartRanking.email;

namespace KartRanking.Administrador
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    * Issues: 1758 - Criação da tela de videos             *
    ********************************************************/
    public partial class Videos : PageBaseSecurity
    {
        int totalCount = 0;
        int numberOfPages = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["InfoPage"] = new string[] { "0 de " + numberOfPages, "0", totalCount.ToString(), numberOfPages.ToString() };
                CarregarVideos();
                PopularEtapas();
            }
        }

        private void PopularEtapas()
        {
            ddlEtapas.Items.Clear();
            using (DataKartDataContext dk = new DataKartDataContext())
            {
                var LinqEtapas = (from e in dk.Kart_Calendario_Campeonatos
                                  orderby e.Data ascending
                                  where (e.Ativo == true || e.Ativo == null)
                                  && e.idCampeonato == IdCampeonato
                                  select new { e.Nome, e.Data, e.idCalendario }).ToList();

                var etapas = (from l in LinqEtapas
                              orderby l.Data ascending
                              select new { Nome = l.Nome + " - " + l.Data.ToString("dd/MM/yyyy"), l.idCalendario });

                ddlEtapas.DataSource = etapas;
                ddlEtapas.DataTextField = "Nome";
                ddlEtapas.DataValueField = "idCalendario";
                ddlEtapas.DataBind();
            }

            ddlEtapas.Items.Insert(0, new ListItem("Nenhum", "0"));

        }

        private void CarregarVideos()
        {
           
            RepeaterVideos.DataSource = getVideos(1, out totalCount, out numberOfPages);
            ViewState["InfoPage"] = new string[] { "1 de " + numberOfPages, "1", totalCount.ToString(), numberOfPages.ToString() };
            RepeaterVideos.DataBind();
        }

        #region getVideos RepeaterVideos_ItemCommand
        private Kart_Videos_Grupo[] getVideos(int pageIndex, out int totalCount, out int numberOfPages)
        {
            DataKartDataContext dk = new DataKartDataContext();
            totalCount = (from v in dk.Kart_Videos_Grupos
                          where v.idGrupo == IdGrupo
                          select v).Count();

            if (pageIndex <= 0)
                pageIndex = 1;

            string numberOfPagesTemp = ((double)totalCount / 10).ToString("N2");
            int Dec = Convert.ToInt16(numberOfPagesTemp.Split(',')[1]);
            numberOfPages = Convert.ToInt16(numberOfPagesTemp.Split(',')[0].Replace(".",""));
            
            if (Dec > 0)
                numberOfPages++;

            if (numberOfPages <= 0)
                numberOfPages = 1;
                        
            return (from v in dk.Kart_Videos_Grupos
                    where v.idGrupo == IdGrupo
                    orderby v.dtEvento descending
                    select v).Skip((pageIndex -1) * 10).Take(10).ToArray();
        }

        protected void RepeaterVideos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string cmd = e.CommandName;
            string arg = e.CommandArgument.ToString();

            if (cmd == "PagA")
            {
                int pag = (Convert.ToInt16(arg, culture) - 1) <= 0 ? 1 : Convert.ToInt16(arg, culture) - 1;
                RepeaterVideos.DataSource = getVideos(pag, out totalCount, out numberOfPages);
                ViewState["InfoPage"] = new string[] { pag + " de " + numberOfPages, pag.ToString(culture), totalCount.ToString(culture), numberOfPages.ToString(culture) };
                RepeaterVideos.DataBind();
            }
            else if (cmd == "PagP")
            {
                int pag = Convert.ToInt16(arg) + 1;
                if (Convert.ToInt32(((string[])ViewState["InfoPage"])[3]) >= pag)
                {
                    RepeaterVideos.DataSource = getVideos(pag, out totalCount, out numberOfPages);
                    ViewState["InfoPage"] = new string[] { pag + " de " + numberOfPages, pag.ToString(culture), totalCount.ToString(culture), numberOfPages.ToString(culture) };
                    RepeaterVideos.DataBind();
                }
            }
            else if (cmd == "Remover")
            {
                DataKartDataContext dk = new DataKartDataContext();
                var video = (from v in dk.Kart_Videos_Grupos
                             where v.idVideo == Convert.ToInt32(arg, culture)
                             select v).FirstOrDefault();
                if (video != null)
                {
                    dk.Kart_Videos_Grupos.DeleteOnSubmit(video);
                    dk.SubmitChanges();
                    CarregarVideos();
                }
            }
        }

        #endregion

        protected void lnkConfirmar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!ValidaURLYoutube(txtUrlVideo.Text))
                {
                    Alert("Informe a url do youtube");
                    return;
                }

                if (string.IsNullOrEmpty(txtTituloVideo.Text))
                {
                    Alert("Informe o titulo do video");
                    return;
                }

                Kart_Videos_Grupo video = new Kart_Videos_Grupo();

                video.dtCriacao = DateTime.Now;
                video.idGrupo = IdGrupo;
                video.idUsuario = UsuarioLogado.idUsuario;
                video.UrlVideo = txtUrlVideo.Text;
                video.txtTitulo = txtTituloVideo.Text;

                if (!string.IsNullOrEmpty(txtDtEvento.Text))
                    video.dtEvento = Convert.ToDateTime(txtDtEvento.Text, culture);
                else
                    video.dtEvento = DateTime.Now;

                if (ddlEtapas.SelectedIndex > 0 && Convert.ToInt32(ddlEtapas.SelectedValue, culture) > 0)
                    video.idCalendario = Convert.ToInt32(ddlEtapas.SelectedValue, culture);

                DataKartDataContext dk = new DataKartDataContext();
                dk.Kart_Videos_Grupos.InsertOnSubmit(video);
                dk.SubmitChanges();
                CarregarVideos();

                if (video.idVideo > 0)
                    EMail.EnviarEmailVideos(IdGrupo, video.idVideo);

                Alert("Video gravado com sucesso!");
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

        private bool ValidaURLYoutube(string url)
        {
            if (string.IsNullOrEmpty(url))
                return false;

            if (url.IndexOf("youtube") < 0)
                return false;

            return true;
        }
    }
}