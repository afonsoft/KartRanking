using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using KartRanking.Tools;

namespace KartRanking.Administrador
{
    public partial class PilotosEquipesGrupo : PageBaseSecurity
    {
        protected void ddlCampeonatos_SelectedIndexChanged(object sender, EventArgs e)
        {
            IdCampeonato = Convert.ToInt16(((DropDownList)sender).SelectedValue);

            string op = Request.QueryString["op"];
            if (string.IsNullOrEmpty(op))
                op = "1";

            switch (op)
            {
                case "1":
                    PopularPilotos();
                    break;
                case "2":
                    PopularEquipes();
                    break;
                default:
                    PopularPilotos();
                    break;
            }
        }

        private void popularCampeonatos()
        {
            var kg = (from g in dk.Kart_Campeonatos
                      where g.idGrupo == IdGrupo
                      && (g.Ativo == true || g.idCampeonato == IdCampeonato)
                      select new { Text = g.NomeCampeonato,  g.Ativo, idCampeonato = (int)g.idCampeonato });

            ddlCampeonatos1.Items.Clear();
            ddlCampeonatos1.DataSource = kg;
            ddlCampeonatos1.DataTextField = "Text";
            ddlCampeonatos1.DataValueField = "idCampeonato";
            ddlCampeonatos1.DataBind();

            ddlCampeonatos2.Items.Clear();
            ddlCampeonatos2.DataSource = kg;
            ddlCampeonatos2.DataTextField = "Text";
            ddlCampeonatos2.DataValueField = "idCampeonato";
            ddlCampeonatos2.DataBind();

            if (ddlCampeonatos1.Items.Count <= 0)
                ddlCampeonatos1.Items.Add(new ListItem("Nenhum campeonato neste grupo", "0"));
            if (ddlCampeonatos2.Items.Count <= 0)
                ddlCampeonatos2.Items.Add(new ListItem("Nenhum campeonato neste grupo", "0"));
            if (IdCampeonato > 0)
            {
                ControlUtil.SelectByValue(ref ddlCampeonatos1, IdCampeonato.ToString());
                ControlUtil.SelectByValue(ref ddlCampeonatos2, IdCampeonato.ToString());
                bool? kgAtivo = (from k in kg where k.idCampeonato == IdCampeonato select k.Ativo).FirstOrDefault();
                ViewState["kgAtivo"] = kgAtivo.HasValue ? kgAtivo.Value : false;
            }

            if (ddlCampeonatos1.SelectedIndex >= 0)
                IdCampeonato = Convert.ToInt16(ddlCampeonatos1.SelectedValue);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PanelPilotos.Visible = false;
                PanelEquipes.Visible = false;
                popularCampeonatos();

                string op = Request.QueryString["op"];
                if (string.IsNullOrEmpty(op))
                    op = "1";

                switch (op)
                {
                    case "1":
                        PopularPilotos();
                        break;
                    case "2":
                        PopularEquipes();
                        break;
                    default:
                        PopularPilotos();
                        break;
                }
            }
        }


        private void PopularPilotos()
        {
            PanelPilotos.Visible = true;
            PanelEquipes.Visible = false;

            gvPilotos.DataSource = getUserGrid();
            gvPilotos.DataBind();

        }
        private void PopularEquipes()
        {
            PanelPilotos.Visible = false;
            PanelEquipes.Visible = true;

            var equipes = from eq in dk.Kart_Equipe_Campeonatos
                          join eg in dk.Kart_Campeonatos on eq.idCampeonato equals eg.idCampeonato
                          where eg.idGrupo == IdGrupo
                          && eg.idCampeonato == IdCampeonato
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
                            //txtNomeEquipe.Text = equipe.NomeEquipe;
                            //txtSigla.Text = equipe.Sigla;

                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Edit", "OpenCadastro(); $(document).ready(function() {  $('#accordion').tabs( 'select' , 1); });", true);
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

        private object getUserGrid()
        {
            return from t0 in dk.Usuarios
                   join t1 in dk.Kart_Usuario_Grupos on t0.idUsuario equals t1.idUsuario
                   join t2 in dk.Kart_Campeonatos on t1.idGrupo equals t2.idGrupo
                   join t3 in dk.View_Equipe_Usuarios on new { t0.idUsuario, t2.idCampeonato } equals new { t3.idUsuario, t3.idCampeonato } into t3_join
                   from t3 in t3_join.DefaultIfEmpty()
                   where
                     t1.idGrupo == IdGrupo &&
                     t1.Aprovado == true &&
                     t2.idCampeonato == IdCampeonato
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

        protected void gvPilotos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string idUsuario = e.CommandArgument.ToString();
            if (e.CommandName == "ViewPilotoInfo")
                Response.Redirect(String.Format("~/Administrador/perfil.aspx?idUsuario={0}&Edit={1}&idGrupo={2}", idUsuario, IsAdmin, IdGrupo));
            else if(e.CommandName == "ViewEquipe")
                Response.Redirect("~/Administrador/PilotosEquipesGrupo.aspx?op=2");
        }

        protected void gvPilotos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int index = e.NewEditIndex;

            if (IsAdmin)
            {
                (sender as GridView).EditIndex = index;
                (sender as GridView).DataSource = getUserGrid();
                (sender as GridView).DataBind();
            }
            else
            {
                e.Cancel = true;
                (sender as GridView).EditIndex = -1;
                (sender as GridView).DataSource = getUserGrid();
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
                    
                    int idUsuario = String.IsNullOrEmpty(iusuario) ? 0 : Convert.ToInt16(iusuario);
                    int idEquipe = String.IsNullOrEmpty(iequipe) ? 0 : Convert.ToInt16(iequipe);

                    if (idEquipe > 0 && idUsuario > 0)
                    {
                        var UserEquipe = (from eq in dk.Kart_Usuario_Equipe_Campeonatos
                                          join a in dk.Kart_Equipe_Campeonatos on eq.idEquipeCampeonato equals a.idEquipeCampeonato
                                          join eg in dk.Kart_Campeonatos on a.idCampeonato equals eg.idCampeonato
                                          where eq.idUsuario == idUsuario
                                          && eg.idGrupo == IdGrupo
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
                            dk.GetTable<Kart_Usuario_Equipe_Campeonato>().InsertOnSubmit(UserEquipe);
                        }
                        dk.SubmitChanges();
                    }

                    (sender as GridView).EditIndex = -1;
                    (sender as GridView).DataSource = getUserGrid();
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
            (sender as GridView).DataSource = getUserGrid();
            (sender as GridView).DataBind();
        }
    }
}
