using System;
using System.Collections.Generic;
using System.Linq;
using KartRanking.Page;
using KartRanking.BaseDados;

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
                PopularVideos();
            }
        }

        private void PopularVideos()
        {
            List<Etapas> etapas1;
            List<Videos> vds;

            using (DataKartDataContext dk = new DataKartDataContext())
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
                etapas1 = (from e in etp
                           select new Etapas
                           {
                               DtEvento = e.Data.ToString("dd/MM/yyyy"),
                               IdEtapa = e.idCalendario,
                               NomeEtapa = e.Nome,
                               LstVideos = (from v in vid
                                            where v.idCalendario == e.idCalendario
                                            select new Videos
                                            {
                                                IdVideo = v.idVideo,
                                                DtEvento = v.dtEvento.ToString("dd/MM/yyyy"),
                                                TxtTitulo = v.txtTitulo,
                                                UrlVideo = v.UrlVideo
                                            }).ToList()
                           }).ToList();

                vds = (from v in vid
                       where (v.idCalendario == null || v.idCalendario <= 0)
                       select new Videos
                       {
                           IdVideo = v.idVideo,
                           DtEvento = v.dtEvento.ToString("dd/MM/yyyy"),
                           TxtTitulo = v.txtTitulo,
                           UrlVideo = v.UrlVideo
                       }).ToList();
            }

            etapas1.Add(new Etapas()
            {
                DtEvento = "",
                IdEtapa = 0,
                NomeEtapa = "Nenhuma etapa associado",
                LstVideos = vds
            });

            var etapas = (from e in etapas1
                          where e.LstVideos != null
                          && e.LstVideos.Count > 0
                          select e);

            rptEtapas.DataSource = etapas;
            rptEtapas.DataBind();

        }
    }

    [Serializable]
    public class Videos
    {
        public int IdVideo { get; set; }
        public string UrlVideo { get; set; }
        public string TxtTitulo { get; set; }
        public string DtEvento { get; set; }
    }
    [Serializable]
    public class Etapas
    {
        public List<Videos> LstVideos { get; set; }
        public string NomeEtapa { get; set; }
        public string DtEvento { get; set; }
        public int IdEtapa { get; set; }
    }
}
