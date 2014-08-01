using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using System.Data.Linq;

namespace KartRanking.Administrador
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
    public partial class ListarGrupos : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopularGrupos();
            }
        }

        private void PopularGrupos()
        {
            List<Grupos> GruposAssociados = null;

            using (DataKartDataContext dk = new DataKartDataContext())
            {
                GruposAssociados = (from g in dk.Kart_Grupos
                                    join gu in dk.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                                    join u in dk.Usuarios on g.Id_Usuario_Lider equals u.idUsuario
                                    where gu.idUsuario == UsuarioLogado.idUsuario
                                    orderby g.NomeGrupo ascending
                                    select new Grupos
                                    {
                                        idGrupo = g.idGrupo,
                                        NomeGrupo = g.NomeGrupo,
                                        Sigla = g.Sigla,
                                        permitirInsricoes = g.permitirInsricoes,
                                        UrlAcesso = g.UrlAcesso,
                                        Cidade = g.Cidade,
                                        Estado = g.Estado,
                                        Ativo = g.Ativo.Value,
                                        dtCriacao = g.dtCriacao.Value,
                                        Nome = u.Nome,
                                        Aprovado = gu.Aprovado.Value
                                    }).Distinct().ToList();
            }

            gvGruposAssociados.DataSource = GruposAssociados;
            gvGruposAssociados.PageIndex = 0;
            gvGruposAssociados.DataBind();

            gvGruposDisponiveis.DataSource = PopularGrupoDisponivel(null);
            gvGruposDisponiveis.PageIndex = 0;
            gvGruposDisponiveis.DataBind();
        }

        private List<Grupos> PopularGrupoDisponivel(string filtro)
        {
            List<Grupos> lst = null;
            if (string.IsNullOrEmpty(filtro))
            {
                using (DataKartDataContext dk = new DataKartDataContext())
                {
                    lst = (from g in dk.Kart_Grupos
                           join u in dk.Usuarios on g.Id_Usuario_Lider equals u.idUsuario
                           where !(from gu in dk.Kart_Usuario_Grupos
                                   where gu.idUsuario == UsuarioLogado.idUsuario
                                   select gu.idGrupo).Contains(g.idGrupo)
                           orderby g.NomeGrupo ascending
                           select new Grupos
                           {
                               idGrupo = g.idGrupo,
                               NomeGrupo = g.NomeGrupo,
                               Sigla = g.Sigla,
                               permitirInsricoes = g.permitirInsricoes,
                               UrlAcesso = g.UrlAcesso,
                               Cidade = g.Cidade,
                               Estado = g.Estado,
                               Ativo = g.Ativo.Value,
                               dtCriacao = g.dtCriacao.Value,
                               Nome = u.Nome,
                               Aprovado = false
                           }).Distinct().ToList();
                }
            }
            else
            {
                using (DataKartDataContext dk = new DataKartDataContext())
                {
                    lst = (from g in dk.Kart_Grupos
                           join u in dk.Usuarios on g.Id_Usuario_Lider equals u.idUsuario
                           where !(from gu in dk.Kart_Usuario_Grupos
                                   where gu.idUsuario == UsuarioLogado.idUsuario
                                   select gu.idGrupo).Contains(g.idGrupo)
                           && g.NomeGrupo.Contains(filtro)
                           orderby g.NomeGrupo ascending
                           select new Grupos
                           {
                               idGrupo = g.idGrupo,
                               NomeGrupo = g.NomeGrupo,
                               Sigla = g.Sigla,
                               permitirInsricoes = g.permitirInsricoes,
                               UrlAcesso = g.UrlAcesso,
                               Cidade = g.Cidade,
                               Estado = g.Estado,
                               Ativo = g.Ativo.Value,
                               dtCriacao = g.dtCriacao.Value,
                               Nome = u.Nome,
                               Aprovado = false
                           }).Distinct().ToList();
                }
            }
            return lst;
        }

        protected void gvGrupos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idGrupo = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "Sair")
                {
                    using (DataKartDataContext dk = new DataKartDataContext())
                    {
                        Kart_Usuario_Grupo kug = (from ug in dk.Kart_Usuario_Grupos
                                                  where ug.idGrupo == idGrupo
                                                  && ug.idUsuario == UsuarioLogado.idUsuario
                                                  select ug).FirstOrDefault();
                        if (kug != null)
                        {
                            dk.Kart_Usuario_Grupos.DeleteOnSubmit(kug);
                            dk.SubmitChanges();
                            Alert("Usuário excluido com suceso!");
                        }
                    }

                }
                else if (e.CommandName == "Associar")
                {
                    using (DataKartDataContext dk = new DataKartDataContext())
                    {
                        Kart_Usuario_Grupo kug = new Kart_Usuario_Grupo();
                        kug.Admin = false;
                        kug.Aprovado = false;
                        kug.idGrupo = idGrupo;
                        kug.idUsuario = UsuarioLogado.idUsuario;
                        kug.dtCriacao = DateTime.Now;

                        dk.GetTable<Kart_Usuario_Grupo>().InsertOnSubmit(kug);
                        dk.SubmitChanges(ConflictMode.FailOnFirstConflict);
                    }
                    Alert("Usuário incluido com suceso!");
                }
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }
        protected void gvGruposDisponiveis_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvGruposDisponiveis.DataSource = PopularGrupoDisponivel(txtFiltrar.Text);
            gvGruposDisponiveis.PageIndex = e.NewPageIndex;
            gvGruposDisponiveis.DataBind();
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            gvGruposDisponiveis.DataSource = PopularGrupoDisponivel(txtFiltrar.Text);
            gvGruposDisponiveis.PageIndex = 0;
            gvGruposDisponiveis.DataBind();
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            txtFiltrar.Text = string.Empty;
            gvGruposDisponiveis.DataSource = PopularGrupoDisponivel(null);
            gvGruposDisponiveis.PageIndex = 0;
            gvGruposDisponiveis.DataBind();
        }
    }

    public class Grupos
    {
        public int idGrupo { get; set; }
        public string NomeGrupo { get; set; }
        public string Sigla { get; set; }
        public bool permitirInsricoes { get; set; }
        public string UrlAcesso { get; set; }
        public string Cidade { get; set; }
        public string Estado { get; set; }
        public bool Ativo { get; set; }
        public bool Aprovado { get; set; }
        public DateTime dtCriacao { get; set; }
        public string Nome { get; set; }
    }
}