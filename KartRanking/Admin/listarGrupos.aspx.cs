using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using KartRanking.Tools;
using System.IO;
using KartRanking.email;

namespace KartRanking.Admin
{
    public partial class listarGrupos : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario user = (Usuario)Session["Usuario"];
                PopularGruposDisponiveis(user.idUsuario);
            }
        }

        private void PopularGruposDisponiveis(int idUsuario)
        {
            var GruposUsuario = from g in dk.Kart_Grupos
                                join gu in dk.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                                where gu.idUsuario == idUsuario
                                select g;

            var GruposDisponivel = from g in dk.Kart_Grupos
                                   join u in dk.Usuarios on g.Id_Usuario_Lider equals u.idUsuario
                                   where !(from gu in GruposUsuario where gu.idGrupo == g.idGrupo select new { gu.idGrupo }).Contains(new { g.idGrupo })
                                   select new 
                                    { 
                                        g.idGrupo, 
                                        g.Id_Usuario_Lider, 
                                        g.Estado, 
                                        g.dtCriacao, 
                                        g.Ativo, 
                                        g.Cidade, 
                                        g.NomeGrupo, 
                                        g.permitirInsricoes, 
                                        g.Sigla, 
                                        g.UrlAcesso,
                                        Responsavel = u.Nome
                                    };

            gvGrupos.DataSource = GruposDisponivel;
            gvGrupos.DataBind();

        }

        protected void gvGrupos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Entrar")
            {
                Usuario user = (Usuario)Session["Usuario"];
                int IdGrupo = Convert.ToInt16(e.CommandArgument);

                int count = (from g in dk.Kart_Grupos
                             join gu in dk.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                             where gu.idUsuario == user.idUsuario
                             && gu.idGrupo == IdGrupo
                             select g).Count();

                if (count <= 0)
                {
                    dk.GetTable<Kart_Usuario_Grupo>().InsertOnSubmit(new Kart_Usuario_Grupo() { idGrupo = IdGrupo, dtCriacao = DateTime.Now, Admin = false, Aprovado = false, idUsuario = user.idUsuario });
                    dk.SubmitChanges();
                    Alert("Usuario associado ao grupo com sucesso!");
                    EMail.EnviarEmailAssociado(user.Email, IdGrupo);
                    EMail.EnviarEmailGrupoAdmin(IdGrupo, user);
                    PopularGruposDisponiveis(user.idUsuario);



                }
                else
                    Alert("Usuario já associado ao grupo!");
            }
        }
    }
}
