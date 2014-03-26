using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
    public partial class videos : PageBaseGrupo
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                popularVideos();
            }
        }

        private void popularVideos()
        {
            var etp = (from cc in dk.Kart_Calendario_Campeonatos
                       join c in dk.Kart_Campeonatos on cc.idCampeonato equals c.idCampeonato
                       where c.idGrupo == IdGrupo
                       && (c.Ativo == true || c.Ativo == null)
                       && (cc.Ativo == true || cc.Ativo == null)
                       select new { cc.idCalendario, cc.Nome, cc.Data }).ToList();

            var vid = (from v in dk.Kart_Videos_Grupos
                       orderby v.idCalendario descending
                       where v.idGrupo == IdGrupo
                       select new
                       {
                           v.idVideo,
                           v.dtEvento,
                           v.idCalendario,
                           v.txtTitulo,
                           v.UrlVideo
                       }).ToList();

            //Pegar os videos associado a uma etapa.
            List<Etapas> etapas1 = (from e in etp
                                   select new Etapas
                                   {
                                       dtEvento = e.Data.ToString("dd/MM/yyyy"),
                                       idEtapa = e.idCalendario,
                                       NomeEtapa = e.Nome,
                                       lstVideos = (from v in vid
                                                    where v.idCalendario == e.idCalendario
                                                    select new Videos
                                                    {
                                                        idVideo = v.idVideo,
                                                        dtEvento = v.dtEvento.ToString("dd/MM/yyyy"),
                                                        txtTitulo = v.txtTitulo,
                                                        UrlVideo = v.UrlVideo
                                                    }).ToList()
                                   }).ToList();

            List<Videos> vds = (from v in vid
                                where (v.idCalendario == null || v.idCalendario <= 0)
                                select new Videos
                                {
                                    idVideo = v.idVideo,
                                    dtEvento = v.dtEvento.ToString("dd/MM/yyyy"),
                                    txtTitulo = v.txtTitulo,
                                    UrlVideo = v.UrlVideo
                                }).ToList();

            etapas1.Add(new Etapas()
            {
                dtEvento = "",
                idEtapa = 0,
                NomeEtapa = "Nenhuma etapa associado",
                lstVideos = vds
            });

            var etapas = (from e in etapas1
                          where e.lstVideos != null 
                          && e.lstVideos.Count > 0
                          select e);

            rptEtapas.DataSource = etapas;
            rptEtapas.DataBind();

        }
    }

    [Serializable]
    public class Videos
    {
        public int idVideo { get; set; }
        public string UrlVideo { get; set; }
        public string txtTitulo { get; set; }
        public string dtEvento { get; set; }
    }
    [Serializable]
    public class Etapas
    {
        public List<Videos> lstVideos { get; set; }
        public string NomeEtapa { get; set; }
        public string dtEvento { get; set; }
        public int idEtapa { get; set; }
    }
}
