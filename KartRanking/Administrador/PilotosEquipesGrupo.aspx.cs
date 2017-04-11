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
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    * 04/04/2014: Incluido os ativos e inativos            *
    ********************************************************/
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
            DataKartDataContext dk = new DataKartDataContext();
            var kg = (from g in dk.Kart_Campeonatos
                      orderby g.dtCriacao ascending
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

            var TodosCampeonatos = (from g in dk.Kart_Campeonatos
                                    where g.idGrupo == IdGrupo
                                    orderby g.dtCriacao descending
                                    select new { Text = g.NomeCampeonato, g.Ativo, idCampeonato = (int)g.idCampeonato });

            ddlTodosCampeonatos.Items.Clear();
            ddlTodosCampeonatos.DataSource = TodosCampeonatos;
            ddlTodosCampeonatos.DataTextField = "Text";
            ddlTodosCampeonatos.DataValueField = "idCampeonato";
            ddlTodosCampeonatos.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HiddenFieldTab.Value = "0";
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
            DataKartDataContext dk = new DataKartDataContext();
            int[] PilotosDesativados = (from t0 in dk.Kart_Campeonato_Usuario_Desativados
                                        where t0.idCampeonato == IdCampeonato
                                        select t0.idUsuario).ToArray();

            var pilotos = (from t0 in dk.Usuarios
                           join t1 in dk.Kart_Usuario_Grupos on t0.idUsuario equals t1.idUsuario
                           join t2 in dk.Kart_Campeonatos on t1.idGrupo equals t2.idGrupo
                           join t3 in dk.View_Equipe_Usuarios on new { t0.idUsuario, t2.idCampeonato } equals new { t3.idUsuario, t3.idCampeonato } into t3_join
                           from t3 in t3_join.DefaultIfEmpty()
                           orderby t0.Nome ascending
                           where t1.idGrupo == IdGrupo
                           && t1.Aprovado == true
                           && t2.idCampeonato == IdCampeonato
                           select new
                           {
                               idUsuario = t0.idUsuario,
                               t0.Nome,
                               NomeEquipe = t3.NomeEquipe,
                               Sigla = t3.Sigla,
                               idGrupo = t1.idGrupo,
                               idCampeonato = t2.idCampeonato
                           }).ToArray();

            var pilotosAtivos = (from p in pilotos
                                 where !PilotosDesativados.Contains(p.idUsuario)
                                 select p);

            var pilotosInativos = (from p in pilotos
                                   where PilotosDesativados.Contains(p.idUsuario)
                                   select p);

            gvPilotos.DataSource = pilotosAtivos;
            gvPilotos.DataBind();

            gvPilotosInativos.DataSource = pilotosInativos;
            gvPilotosInativos.DataBind();

        }
        private void PopularEquipes()
        {
            PanelPilotos.Visible = false;
            PanelEquipes.Visible = true;
            DataKartDataContext dk = new DataKartDataContext();

            int[] EquipesDesativados = (from t0 in dk.Kart_Equipe_Campeonato_Desativados
                                        where t0.idCampeonato == IdCampeonato
                                        select t0.idEquipeCampeonato).ToArray();

            var TodasEquipes = (from eq in dk.Kart_Equipe_Campeonatos
                                join eg in dk.Kart_Campeonatos on eq.idCampeonato equals eg.idCampeonato
                                orderby eq.NomeEquipe ascending
                                where eg.idGrupo == IdGrupo
                                && eg.idCampeonato == IdCampeonato
                                select eq).ToArray();

            var equipesAtivos = (from t in TodasEquipes
                                 where !EquipesDesativados.Contains(t.idEquipeCampeonato)
                                 select t);

            var equipesInativos = (from t in TodasEquipes
                                   where EquipesDesativados.Contains(t.idEquipeCampeonato)
                                   select t);

            gvEquipes.DataSource = equipesAtivos;
            gvEquipes.DataBind();

            gvEquipesInativos.DataSource = equipesInativos;
            gvEquipesInativos.DataBind();
        }

        protected void gvEquipes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int IdEquipeCampeonato = 0;
                if (IsAdmin)
                {
                    DataKartDataContext dk = new DataKartDataContext();
                    HiddenIdEquipeCampeonato.Value = e.CommandArgument.ToString();
                    IdEquipeCampeonato = Convert.ToInt32(HiddenIdEquipeCampeonato.Value);

                    if (e.CommandName == "EditCalendario")
                    {
                        Kart_Equipe_Campeonato equipe = (from e1 in dk.Kart_Equipe_Campeonatos where e1.idEquipeCampeonato == IdEquipeCampeonato select e1).FirstOrDefault();

                        if (equipe != null)
                        {
                            txtNomeEquipe.Text = equipe.NomeEquipe;
                            txtSigla.Text = equipe.Sigla;

                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Edit", "OpenCadastro(0);", true);
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

                    else if (e.CommandName == "Inativar")
                    {
                        dk.Kart_Equipe_Campeonato_Desativados.InsertOnSubmit(new Kart_Equipe_Campeonato_Desativado()
                            {
                                idEquipeCampeonato = IdEquipeCampeonato,
                                idCampeonato = IdCampeonato,
                                idUsuarioCadastro = UsuarioLogado.idUsuario,
                                dtCadastro = DateTime.Now
                            });
                            dk.SubmitChanges();
                            PopularEquipes();
                            Alert("Equipe inativado com sucesso.");
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
                Response.Redirect(string.Format("~/Administrador/perfil.aspx?idUsuario={0}&Edit={1}&idGrupo={2}", idUsuario, IsAdmin, IdGrupo));
            else if(e.CommandName == "ViewEquipe")
                Response.Redirect("~/Administrador/PilotosEquipesGrupo.aspx?op=2");
            else if (e.CommandName == "Inativar")
            {
                if (IsAdmin)
                {
                    DataKartDataContext dk = new DataKartDataContext();
                    dk.Kart_Campeonato_Usuario_Desativados.InsertOnSubmit(new Kart_Campeonato_Usuario_Desativado()
                                    {
                                        idUsuario = Convert.ToInt32(idUsuario),
                                        idCampeonato = IdCampeonato,
                                        IdUsuarioCadastro = UsuarioLogado.idUsuario,
                                        dtCadastro = DateTime.Now
                                    });
                    dk.SubmitChanges();
                    PopularPilotos();
                    Alert("Piloto inativado com sucesso.");
                }
                else
                {
                    Alert("Você não é o administrador deste grupo!");
                }
            }
        }

        protected void gvPilotos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int index = e.NewEditIndex;

            if (IsAdmin)
            {
                PopularPilotos();
                (sender as GridView).EditIndex = index;
                (sender as GridView).DataBind();
            }
            else
            {
                PopularPilotos();
                e.Cancel = true;
                (sender as GridView).EditIndex = -1;
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
                    DataKartDataContext dk = new DataKartDataContext();
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

                    PopularPilotos();
                    (sender as GridView).EditIndex = -1;
                    (sender as GridView).DataBind();
                }
                else
                    Alert("Você não é o administrador do grupo para efetuar essa operação!");
            }
        }

        protected void gvPilotos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            PopularPilotos();
            (sender as GridView).EditIndex = -1;
            (sender as GridView).DataBind();
        }

        //Cadastrar/Alterar na equipe
        protected void lnkConfirmar_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsAdmin)
                {
                    DataKartDataContext dk = new DataKartDataContext();
                    if (String.IsNullOrEmpty(HiddenIdEquipeCampeonato.Value))
                        HiddenIdEquipeCampeonato.Value = "0";

                    int IdEquipeCampeonato = Convert.ToInt16(HiddenIdEquipeCampeonato.Value);

                    if (String.IsNullOrEmpty(txtNomeEquipe.Text) || String.IsNullOrEmpty(txtSigla.Text))
                        throw new Exception("Campos obrigatório não preenchido!");

                    int count = (from g in dk.Kart_Campeonatos
                                 join e1 in dk.Kart_Equipe_Campeonatos on g.idCampeonato equals e1.idCampeonato
                                 where (g.idGrupo == IdGrupo && e1.idEquipeCampeonato > IdEquipeCampeonato)
                                && (e1.NomeEquipe.Contains(txtNomeEquipe.Text) || e1.Sigla.Contains(txtSigla.Text))
                                && e1.idCampeonato == IdCampeonato
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
                        equipe.idCampeonato = IdCampeonato;
                        equipe.NomeEquipe = txtNomeEquipe.Text;
                        equipe.Sigla = txtSigla.Text;
                        equipe.dtCriacao = DateTime.Now;

                        if (IdEquipeCampeonato == 0)
                            dk.GetTable<Kart_Equipe_Campeonato>().InsertOnSubmit(equipe);

                        dk.SubmitChanges();

                        PopularEquipes();

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

        //Copiar os campeoanotos
        protected void lnkConfirmarAlter_Click(object sender, EventArgs e)
        {
            try
            {
                int idCampeonatoAntigo = 0;

                if (IsAdmin)
                {
                    DataKartDataContext dk = new DataKartDataContext();
                    idCampeonatoAntigo = Convert.ToInt32(ddlTodosCampeonatos.SelectedItem.Value);

                    if (idCampeonatoAntigo == IdCampeonato)
                    {
                        Alert("Não é possivel copiar o campeonato atual!");
                        return;
                    }

                    //Selecionar todos as equipes do campeonato selecionado.
                    List<Kart_Equipe_Campeonato> Equipes = (from g in dk.Kart_Equipe_Campeonatos
                                                            where g.idCampeonato == idCampeonatoAntigo
                                                            select g).ToList();

                    string msg = "";
                    foreach (Kart_Equipe_Campeonato equipe in Equipes)
                    {
                        bool JaExiste = (from g in dk.Kart_Equipe_Campeonatos
                                         where g.idCampeonato == IdCampeonato
                                         && (g.NomeEquipe.Contains(equipe.NomeEquipe) || g.Sigla.Contains(equipe.Sigla))
                                         select g).Count() > 0;
                        //Se não existir incluir
                        if (!JaExiste)
                        {
                            Kart_Equipe_Campeonato kec = new Kart_Equipe_Campeonato();
                            kec.Sigla = equipe.Sigla;
                            kec.NomeEquipe = equipe.NomeEquipe;
                            kec.idCampeonato = IdCampeonato;

                            dk.Kart_Equipe_Campeonatos.InsertOnSubmit(kec);
                            dk.SubmitChanges();
                        }
                        else
                        {
                            msg += "Sigla: " + equipe.Sigla + " - Nome: " + equipe.NomeEquipe + "\n";
                        }
                    }

                    PopularEquipes();


                    if (!string.IsNullOrEmpty(msg))
                    {
                        Alert("Copia efetua com sucesso!\nJá existe uma equipe parecida no sistema!\n" + msg);
                    }
                    else
                    {
                        Alert("Copia efetua com sucesso!");
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

        protected void gvPilotosInativos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (IsAdmin)
            {
                DataKartDataContext dk = new DataKartDataContext();
                int idUsuario = Convert.ToInt32(e.CommandArgument.ToString());
                var useruarioInativo = (from u in dk.Kart_Campeonato_Usuario_Desativados
                                        where u.idUsuario == idUsuario
                                        && u.idCampeonato == IdCampeonato
                                        select u);

                dk.Kart_Campeonato_Usuario_Desativados.DeleteAllOnSubmit(useruarioInativo);
                dk.SubmitChanges();
                PopularPilotos();
                Alert("Piloto ativado com sucesso.");
            }
            else
            {
                Alert("Você não é o administrador deste grupo!");
            }
        }

        protected void gvEquipesInativos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (IsAdmin)
            {
                DataKartDataContext dk = new DataKartDataContext();
                int idEquipeCampeonato = Convert.ToInt32(e.CommandArgument.ToString());
                var equipeInativo = (from u in dk.Kart_Equipe_Campeonato_Desativados
                                     where u.idEquipeCampeonato == idEquipeCampeonato
                                     && u.idCampeonato == IdCampeonato
                                     select u);

                dk.Kart_Equipe_Campeonato_Desativados.DeleteAllOnSubmit(equipeInativo);
                dk.SubmitChanges();
                PopularEquipes();
                Alert("Equipe ativado com sucesso.");
            }
            else
            {
                Alert("Você não é o administrador deste grupo!");
            }
        }
    }
}
