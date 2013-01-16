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
    public partial class PilotosGrupo : PageBaseSecurity
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HiddenidGrupo.Value = "0";
                HiddenidCampeonato.Value = "0";
                HiddenIdEquipeCampeonato.Value = "0";

                if (Session["idGrupo"] != null) HiddenidGrupo.Value = Session["idGrupo"].ToString();

                CarregarGruposUsuario();
                if ( ddlGrupos.SelectedIndex >= 0 )
                {
                    HiddenidGrupo.Value = ddlGrupos.SelectedValue;
                    CarregarCampeonatoUsuario( Convert.ToInt16( ddlGrupos.SelectedValue ) );
                    if (ddlCampeonato.SelectedIndex >= 0)
                    {
                        HiddenidCampeonato.Value = ddlCampeonato.SelectedValue;
                        if (Session["idCampeonato"] != null) HiddenidCampeonato.Value = Session["idCampeonato"].ToString();

                        CarregarGrids(Convert.ToInt16(ddlGrupos.SelectedValue), Convert.ToInt16(ddlCampeonato.SelectedValue));
                    }
                    else
                        CarregarGrids(0, 0);
                }
                else
                    CarregarGrids( 0, 0 );
            }
        }

        private void CarregarCampeonatoUsuario( int idGrupo )
        {
            List<Kart_Campeonato> camp = (from c in dk.Kart_Campeonatos
                                          where c.idGrupo == idGrupo && c.Ativo == true
                                          select c).ToList();

            if ( camp != null && camp.Count() > 0 )
            {
                ddlCampeonato.DataSource = camp;
                ddlCampeonato.DataTextField = "NomeCampeonato";
                ddlCampeonato.DataValueField = "idCampeonato";
                ddlCampeonato.DataBind();

                HiddenidCampeonato.Value = camp[0].idCampeonato.ToString();

                int idCampeonatoSelecionado = Convert.ToInt16( HiddenidCampeonato.Value );
                if ( idCampeonatoSelecionado > 0 )
                {
                    ddlCampeonato.Items.FindByValue( idCampeonatoSelecionado.ToString() ).Selected = true;
                }
            }
            else
            {
                ddlCampeonato.Items.Clear();
                ddlCampeonato.Items.Insert( 0, new ListItem( "Nenhum Campeonato associado", "0", true ) );
            }

        }

        protected void ddlGrupos_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenidGrupo.Value = ddlGrupos.SelectedValue;
            HiddenidCampeonato.Value = "0";
            Session["IdGrupo"] = ddlGrupos.SelectedValue;
            Session["idCampeonato"] = null;
            CarregarCampeonatoUsuario( Convert.ToInt16( ddlGrupos.SelectedValue ) );
            ddlCampeonato_SelectedIndexChanged(sender, e);
        }

        protected void ddlCampeonato_SelectedIndexChanged( object sender, EventArgs e )
        {
            HiddenidCampeonato.Value = ddlCampeonato.SelectedValue;
            CarregarGrids( Convert.ToInt16( ddlGrupos.SelectedValue ), Convert.ToInt16( ddlCampeonato.SelectedValue ) );
        }
        
        private void CarregarGruposUsuario()
        {
            Usuario user = (Usuario)Session["Usuario"];

            var Grupos = (from gu in dk.Kart_Usuario_Grupos
                          join g in dk.Kart_Grupos
                          on gu.idGrupo equals g.idGrupo
                          orderby g.dtCriacao descending
                          where gu.idUsuario == user.idUsuario
                          select new { id = g.idGrupo, Nome = g.NomeGrupo }).ToList();

            if (Grupos != null && Grupos.Count() > 0)
            {
                ddlGrupos.DataSource = Grupos;
                ddlGrupos.DataTextField = "Nome";
                ddlGrupos.DataValueField = "id";
                ddlGrupos.DataBind();

                int idGrupoSelecionado = Convert.ToInt16(HiddenidGrupo.Value);
                if (idGrupoSelecionado > 0)
                {
                    ddlGrupos.Items.FindByValue(idGrupoSelecionado.ToString()).Selected = true;
                }
            }
            else
            {
                ddlGrupos.Items.Insert(0, new ListItem("Nenhum Grupo associado", "0", true));
            }
        }

        private object getUserGrid( int idGrupo, int idCampeonato )
        {
            return from t0 in dk.Usuarios
                   join t1 in dk.Kart_Usuario_Grupos on t0.idUsuario equals t1.idUsuario
                   join t2 in dk.Kart_Campeonatos on t1.idGrupo equals t2.idGrupo
                   join t3 in dk.View_Equipe_Usuarios on new { t0.idUsuario, t2.idCampeonato } equals new { t3.idUsuario, t3.idCampeonato } into t3_join
                   from t3 in t3_join.DefaultIfEmpty()
                   where
                     t1.idGrupo == idGrupo &&
                     t1.Aprovado == true &&
                     t2.idCampeonato == idCampeonato
                   select new
                   {
                       idUsuario = t0.idUsuario,
                       t0.Nome,
                       NomeEquipe = t3.NomeEquipe,
                       Sigla = t3.Sigla,
                       idGrupo = t1.idGrupo,
                       idCampeonato = t2.idCampeonato
                   };
        }

        private void CarregarGrids(int idGrupo, int idCampeonato)
        {
            var User = getUserGrid( idGrupo, idCampeonato );

            gvPilotos.DataSource = User;
            gvPilotos.DataBind();

            var equipes = from eq in dk.Kart_Equipe_Campeonatos
                          join eg in dk.Kart_Campeonatos on eq.idCampeonato equals eg.idCampeonato 
                          where eg.idGrupo == idGrupo
                          && eg.idCampeonato == idCampeonato
                          select eq;

            gvEquipes.DataSource = equipes;
            gvEquipes.DataBind();
        }

        protected void gvEquipes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (IsAdmin)
                {
                    HiddenIdEquipeCampeonato.Value = e.CommandArgument.ToString();
                    int IdEquipeCampeonato = Convert.ToInt16(HiddenIdEquipeCampeonato.Value);

                    if (e.CommandName == "EditCalendario")
                    {
                        Kart_Equipe_Campeonato equipe = (from e1 in dk.Kart_Equipe_Campeonatos where e1.idEquipeCampeonato == IdEquipeCampeonato select e1).FirstOrDefault();

                        if (equipe != null)
                        {
                            txtNomeEquipe.Text = equipe.NomeEquipe;
                            txtSigla.Text = equipe.Sigla;

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Edit", "OpenCadastro(); $(document).ready(function() {  $('#accordion').tabs( 'select' , 1); });", true);
                        }
                        else
                            Alert("Erro para recuperar as informações da equipe!");
                    }
                    else if (e.CommandName == "Exluir")
                    {
                        Kart_Equipe_Campeonato equipe = (from e1 in dk.Kart_Equipe_Campeonatos where e1.idEquipeCampeonato == IdEquipeCampeonato select e1).FirstOrDefault();
                        dk.GetTable<Kart_Equipe_Campeonato>().DeleteOnSubmit(equipe);
                        dk.SubmitChanges();

                        Alert("Equipe excluida com sucesso!");
                    }
                }
                else
                    Alert("Você não é o administrador do grupo para efetuar essa operação!");
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

        protected void gvPilotos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string idUsuario = e.CommandArgument.ToString();
            if (e.CommandName == "ViewPilotoInfo")
            {
                Response.Redirect(String.Format("~/Admin/MeusDados.aspx?idUsuario={0}&Edit={1}&idGrupo={2}", idUsuario, IsAdmin, ddlGrupos.SelectedValue));
            }
        }

        protected void gvPilotos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int index = e.NewEditIndex;

            if (IsAdmin)
            {
                (sender as GridView).EditIndex = index;
                ( sender as GridView ).DataSource = getUserGrid( Convert.ToInt16( ddlGrupos.SelectedValue ), Convert.ToInt16( ddlCampeonato.SelectedValue ) );
                (sender as GridView).DataBind();
            }
            else
            {
                e.Cancel = true;
                (sender as GridView).EditIndex = -1;
                ( sender as GridView ).DataSource = getUserGrid( Convert.ToInt16( ddlGrupos.SelectedValue ), Convert.ToInt16( ddlCampeonato.SelectedValue ) );
                (sender as GridView).DataBind();
                Alert("Você não é o administrador do grupo para efetuar essa operação!");
            }
        }

        protected void gvPilotos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (!e.Cancel)
            {
                if (IsAdmin)
                {
                    int index = e.RowIndex;
                    GridViewRow row = (sender as GridView).Rows[e.RowIndex];

                    string iequipe = ((DropDownList)row.Cells[3].FindControl("ddlEquipes")).SelectedValue;
                    string iusuario = (sender as GridView).DataKeys[e.RowIndex].Value.ToString();
                    int idGrupo = Convert.ToInt16(ddlGrupos.SelectedValue);

                    int idUsuario = String.IsNullOrEmpty(iusuario) ? 0 : Convert.ToInt16(iusuario);
                    int idEquipe = String.IsNullOrEmpty(iequipe) ? 0 : Convert.ToInt16(iequipe);

                    if (idEquipe > 0 && idUsuario >0)
                    {
                        var UserEquipe = ( from eq in dk.Kart_Usuario_Equipe_Campeonatos
                                           join a in dk.Kart_Equipe_Campeonatos on eq.idEquipeCampeonato equals a.idEquipeCampeonato
                                           join eg in dk.Kart_Campeonatos on a.idCampeonato equals eg.idCampeonato
                                          where eq.idUsuario == idUsuario
                                          && eg.idGrupo == idGrupo
                                          select eq).FirstOrDefault();

                        if (UserEquipe != null)
                        {
                            UserEquipe.idEquipeCampeonato = idEquipe;
                        }
                        else
                        {
                            UserEquipe = new Kart_Usuario_Equipe_Campeonato();
                            UserEquipe.idEquipeCampeonato = idEquipe;
                            UserEquipe.idUsuario = idUsuario;
                            UserEquipe.dtCriacao = DateTime.Now;
                            dk.GetTable<Kart_Usuario_Equipe_Campeonato>().InsertOnSubmit( UserEquipe );
                        }
                        dk.SubmitChanges();
                    }

                    (sender as GridView).EditIndex = -1;
                    ( sender as GridView ).DataSource = getUserGrid( Convert.ToInt16( ddlGrupos.SelectedValue ), Convert.ToInt16( ddlCampeonato.SelectedValue ) );
                    (sender as GridView).DataBind();
                }
                else
                    Alert("Você não é o administrador do grupo para efetuar essa operação!");
            }
        }

        protected void gvPilotos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            (sender as GridView).EditIndex = -1;
            ( sender as GridView ).DataSource = getUserGrid( Convert.ToInt16( ddlGrupos.SelectedValue ), Convert.ToInt16( ddlCampeonato.SelectedValue ) );
            (sender as GridView).DataBind();
        }

        protected void btnSalvarEquipeGrupo_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsAdmin)
                {
                    if (String.IsNullOrEmpty(HiddenIdEquipeCampeonato.Value))
                        HiddenIdEquipeCampeonato.Value = "0";

                    int IdEquipeCampeonato = Convert.ToInt16(HiddenIdEquipeCampeonato.Value);

                    if (String.IsNullOrEmpty(txtNomeEquipe.Text) || String.IsNullOrEmpty(txtSigla.Text))
                        throw new Exception("Campos obrigatório não preenchido!");

                    int count = (from g in dk.Kart_Campeonatos
                                 join e1 in dk.Kart_Equipe_Campeonatos on g.idCampeonato equals e1.idCampeonato
                                 where (g.idGrupo == Convert.ToInt16(ddlGrupos.SelectedValue) && e1.idEquipeCampeonato > IdEquipeCampeonato)
                                && (e1.NomeEquipe.Contains(txtNomeEquipe.Text) || e1.Sigla.Contains(txtSigla.Text))
                                && e1.idCampeonato == Convert.ToInt16(ddlCampeonato.SelectedValue)
                                 select g).Count();

                    if (count > 0)
                        throw new Exception("Já existe um grupo com o mesmo nome ou sigla!");

                    Kart_Equipe_Campeonato equipe = null;

                    if (IdEquipeCampeonato == 0)
                    {
                        equipe = new Kart_Equipe_Campeonato();
                        equipe.dtCriacao = DateTime.Now;
                    }
                    else
                        equipe = (from e1 in dk.Kart_Equipe_Campeonatos where e1.idEquipeCampeonato == IdEquipeCampeonato select e1).FirstOrDefault();

                    if (equipe != null)
                    {
                        equipe.idCampeonato = Convert.ToInt16(ddlCampeonato.SelectedValue);
                        equipe.NomeEquipe = txtNomeEquipe.Text;
                        equipe.Sigla = txtSigla.Text;

                        if (IdEquipeCampeonato == 0)
                            dk.GetTable<Kart_Equipe_Campeonato>().InsertOnSubmit(equipe);

                        dk.SubmitChanges();

                        CarregarGrids(Convert.ToInt16(ddlGrupos.SelectedValue), Convert.ToInt16(ddlCampeonato.SelectedValue));

                        if (IdEquipeCampeonato == 0)
                            Alert("Equipe cadastrado com sucesso!");
                        else
                            Alert("Equipe alterada com sucesso!");
                    }
                    else
                        Alert("Erro para alterar a equipe!");


                    HiddenIdEquipeCampeonato.Value = "0";
                }
                else
                    Alert("Você não é o administrador do grupo para efetuar essa operação!");
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

      
    }
}
