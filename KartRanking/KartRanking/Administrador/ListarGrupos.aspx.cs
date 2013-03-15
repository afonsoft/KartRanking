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
    public partial class ListarGrupos : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        private void PopularGrupos()
        {
            var GruposAssociados = (from g in dk.Kart_Grupos
                                    join gu in dk.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                                    join u in dk.Usuarios on g.Id_Usuario_Lider equals u.idUsuario
                                    where gu.idUsuario == UsuarioLogado.idUsuario
                                    orderby g.NomeGrupo ascending
                                    select new
                                    {
                                        g.idGrupo,
                                        g.NomeGrupo,
                                        g.Sigla,
                                        g.permitirInsricoes,
                                        g.UrlAcesso,
                                        g.Cidade,
                                        g.Estado,
                                        g.Ativo,
                                        g.dtCriacao,
                                        u.Nome
                                    }).Distinct().ToList();

            gvGruposAssociados.DataSource = GruposAssociados;
            gvGruposAssociados.DataBind();

            var GruposDisponivel = (from g in dk.Kart_Grupos
                                    join u in dk.Usuarios on g.Id_Usuario_Lider equals u.idUsuario
                                    where !(from gu in dk.Kart_Usuario_Grupos
                                            where gu.idUsuario == UsuarioLogado.idUsuario
                                            select gu.idGrupo).Contains(g.idGrupo)
                                    orderby g.NomeGrupo ascending
                                    select new
                                    {
                                        g.idGrupo,
                                        g.NomeGrupo,
                                        g.Sigla,
                                        g.permitirInsricoes,
                                        g.UrlAcesso,
                                        g.Cidade,
                                        g.Estado,
                                        g.Ativo,
                                        g.dtCriacao,
                                        u.Nome
                                    }).Distinct().ToList();

            gvGruposDisponiveis.DataSource = GruposDisponivel;
            gvGruposDisponiveis.DataBind();
        }

        protected void gvGrupos_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    } 
}
