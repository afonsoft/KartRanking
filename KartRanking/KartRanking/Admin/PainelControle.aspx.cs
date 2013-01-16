using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;

namespace KartRanking
{
    public partial class PainelControle : PageBaseSecurity
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["idGrupo"] != null)
                    HiddenidGrupo.Value = Request.QueryString["idGrupo"];
                else
                    HiddenidGrupo.Value = "0";

                ValidarSeAtivo();
                CarregarGruposUsuario();

                if (ddlGrupos.SelectedIndex >= 0)
                    CarregarCampeonato(Convert.ToInt16(ddlGrupos.SelectedValue));
                else
                    CarregarCampeonato(0);
            }
        }

        private void ValidarSeAtivo()
        {
            Usuario user = (Usuario)Session["Usuario"];
            if (user.Ativo == false)
                Response.Redirect("~/Admin/MeusDados.aspx", true);
        }

        private void CarregarCampeonato( int idGrupo )
        {
            Usuario user = (Usuario)HttpContext.Current.Session["Usuario"];

            var Campeonatos = ( from c in dk.Kart_Campeonatos
                                where c.idGrupo == idGrupo
                                orderby c.idGrupo descending
                                select new
                                {
                                    idCampeonato = c.idCampeonato,
                                    NomeCampeonato = c.NomeCampeonato,
                                    dtInicio = c.dtInicio,
                                    dtFim = c.dtFim,
                                    Ativo = c.Ativo.Value ? "Sim" : "Não",
                                    idGrupo = c.idGrupo
                                } );

            gvCampeonatos.DataSource = Campeonatos;
            gvCampeonatos.DataBind();

            var Grupos = ( from gu in dk.Kart_Usuario_Grupos
                           join g in dk.Kart_Grupos
                           on gu.idGrupo equals g.idGrupo
                           where gu.idUsuario == user.idUsuario 
                           && gu.idGrupo == idGrupo
                           select new { id = g.idGrupo, Nome = g.NomeGrupo, Sigla = g.Sigla } ).FirstOrDefault();

            if ( Grupos != null )
            {
                string grupo = Grupos.Nome + "&nbsp;&nbsp;";

                if (IsAdminGrupo(Grupos.id))
                {
                    grupo += "<a href=\"CadastroGrupo.aspx?idGrupo=" + Grupos.id.ToString() + "\" title=\"Gerenciar o grupo\">";
                    grupo += "<img width=\"32px\" height=\"32px\" title=\"Gerenciar o grupo\" alt=\"Criar um Grupo\" src=\"/images/Grupo.png\" />";
                    grupo += "</a>";
                }
                ltNomeGrupo.Text = grupo;
                ltSiglaGrupo.Text = Grupos.Sigla;
                HiddenidGrupo.Value = Grupos.id.ToString();
                Session["idGrupo"] = Grupos.id;
            }
            else
            {
                ltNomeGrupo.Text = "Nenhum Grupo Selecionado";
                ltSiglaGrupo.Text = "Nenhum Grupo Selecionado";
                HiddenidGrupo.Value = "0";
            }
        }

        private void CarregarGruposUsuario()
        {
            Usuario user = ( Usuario )Session[ "Usuario" ];

            var Grupos = (from gu in dk.Kart_Usuario_Grupos
                          join g in dk.Kart_Grupos
                          on gu.idGrupo equals g.idGrupo
                          orderby g.dtCriacao descending
                          where gu.idUsuario == user.idUsuario
                          select new { id = g.idGrupo, Nome = g.NomeGrupo });

            if ( Grupos != null && Grupos.Count() > 0 )
            {
                ddlGrupos.DataSource = Grupos;
                ddlGrupos.DataTextField = "Nome";
                ddlGrupos.DataValueField = "id";
                ddlGrupos.DataBind();
                
                int idGrupoSelecionado = Convert.ToInt16( HiddenidGrupo.Value );
                if ( idGrupoSelecionado > 0 )
                {
                    ddlGrupos.Items.FindByValue( idGrupoSelecionado.ToString() ).Selected = true;
                }
            }
            else
            {
                ddlGrupos.Items.Insert( 0, new ListItem( "Nenhum Grupo associado", "0", true ) );
            }
          
        }

        protected void ddlGrupos_SelectedIndexChanged( object sender, EventArgs e )
        {
            Session["IdGrupo"] = ddlGrupos.SelectedValue;
            Session["idCampeonato"] = null;
            CarregarCampeonato( Convert.ToInt16( ddlGrupos.SelectedValue ) );
        }

        protected void gvCampeonatos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCampeonato")
            {
                int idGrupo = Convert.ToInt16(HiddenidGrupo.Value);
                int idCampeonato = Convert.ToInt16(e.CommandArgument);
                Session["idGrupo"] = idGrupo;
                Session["idCampeonato"] = idCampeonato;
                Response.Redirect("CalendarioCampeonato.aspx?IdGrupo=" + idGrupo.ToString() + "&IdCampeonato=" + idCampeonato.ToString());
            }
        }
    }
}
