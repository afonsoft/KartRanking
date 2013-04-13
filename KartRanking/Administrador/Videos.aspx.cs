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
            }
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
                int pag = (Convert.ToInt16(arg) - 1) <= 0 ? 1 : Convert.ToInt16(arg) - 1;
                RepeaterVideos.DataSource = getVideos(pag, out totalCount, out numberOfPages);
                ViewState["InfoPage"] = new string[] { pag + " de " + numberOfPages, pag.ToString(), totalCount.ToString(), numberOfPages.ToString() };
                RepeaterVideos.DataBind();
            }
            else if (cmd == "PagP")
            {
                int pag = Convert.ToInt16(arg) + 1;
                if (Convert.ToInt32(((string[])ViewState["InfoPage"])[3]) >= pag)
                {
                    RepeaterVideos.DataSource = getVideos(pag, out totalCount, out numberOfPages);
                    ViewState["InfoPage"] = new string[] { pag + " de " + numberOfPages, pag.ToString(), totalCount.ToString(), numberOfPages.ToString() };
                    RepeaterVideos.DataBind();
                }
            }
            else if (cmd == "Remover")
            {
                var video = (from v in dk.Kart_Videos_Grupos
                             where v.idVideo == Convert.ToInt32(arg)
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

                Kart_Videos_Grupo video = new Kart_Videos_Grupo();

                video.dtCriacao = DateTime.Now;
                video.idGrupo = IdGrupo;
                video.idUsuario = UsuarioLogado.idUsuario;
                video.UrlVideo = txtUrlVideo.Text;
                if (!string.IsNullOrEmpty(txtDtEvento.Text))
                    video.dtEvento = Convert.ToDateTime(txtDtEvento.Text);
                else
                    video.dtEvento = DateTime.Now;

                dk.Kart_Videos_Grupos.InsertOnSubmit(video);
                dk.SubmitChanges();
                CarregarVideos();
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