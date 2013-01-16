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
using System.Data.Linq;

namespace KartRanking
{
    public partial class InscricoesGrupo : PageBaseSecurity
    {


        protected void Page_Load( object sender, EventArgs e )
        {
            try
            {
                if (!IsPostBack)
                {

                    string idGrupo = Request.QueryString["idGrupo"];
                    string idTab = Request.QueryString["tab"];

                    if (String.IsNullOrEmpty(idGrupo) && Session["idGrupo"] != null) idGrupo = Session["idGrupo"].ToString();

                    Usuario user = (Usuario)Session["Usuario"];
                    PopularDDL(user.idUsuario);

                    IdGrupo.Value = "0";
                    if (!String.IsNullOrEmpty(idGrupo))
                    {
                        ControlUtil.SelectByValue(ref ddlGrupos, idGrupo);
                        IdGrupo.Value = idGrupo;
                    }

                    PopularGrids(Convert.ToInt16(ddlGrupos.SelectedValue));

                    if (!String.IsNullOrEmpty(idTab))
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Tab", "$(function() { $('#tabs').tabs( 'select' , 1 );});", true);
                    
                }
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

        protected void ddlGrupos_SelectedIndexChanged( object sender, EventArgs e )
        {
            try
            {
                Session["IdGrupo"] = ddlGrupos.SelectedValue;
                Session["idCampeonato"] = null;
                PopularGrids(Convert.ToInt16(ddlGrupos.SelectedValue));
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

        private void PopularDDL( int idUsuario )
        {
            var grupo = from g in dk.Kart_Grupos
                        join ug in dk.Kart_Usuario_Grupos on g.idGrupo equals ug.idGrupo
                        where ug.idUsuario == idUsuario
                        && ug.Aprovado == true
                        select g;

            if ( grupo != null && grupo.Count() > 0 )
            {
                ddlGrupos.DataSource = grupo;
                ddlGrupos.DataTextField = "NomeGrupo";
                ddlGrupos.DataValueField = "idGrupo";
                ddlGrupos.DataBind();
            }
            else
                ddlGrupos.Items.Add( new ListItem( "Nenhum grupo associado a esse usuario", "0", true ) );

        }

        private void PopularGrids(int idGrupo)
        {
            IdGrupo.Value = idGrupo.ToString();

            var UsuarioLivre = from u in dk.Usuarios
                               join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                               where ug.idGrupo == idGrupo
                               && ug.Aprovado == false
                               select u;

            gvUsuariosAdmin.DataSource = UsuarioLivre;
            gvUsuariosAdmin.DataBind();

            Kart_Grupo grupo = (from g in dk.Kart_Grupos
                                where g.idGrupo == idGrupo
                                select g).FirstOrDefault();

            if (grupo != null)
            {
                ltGrupoNome.Text = grupo.NomeGrupo;
                ltGrupoSigla.Text = grupo.Sigla;
            }

            var UsuariosGrupo = from t0 in dk.Usuarios
                                join t1 in dk.Kart_Usuario_Grupos on t0.idUsuario equals t1.idUsuario
                                join t2 in dk.Kart_Campeonatos on t1.idGrupo equals t2.idGrupo
                                join t3 in dk.Kart_Usuario_Equipe_Campeonatos on t0.idUsuario equals t3.idUsuario into t3_join
                                from t3 in t3_join.DefaultIfEmpty()
                                join t4 in dk.Kart_Equipe_Campeonatos on t3.idEquipeCampeonato equals t4.idEquipeCampeonato into t4_join
                                from t4 in t4_join.DefaultIfEmpty()
                                where
                                  t1.idGrupo == idGrupo &&
                                  t1.Aprovado == true
                                select new
                                {
                                    idUsuario = t0.idUsuario,
                                    t0.Nome,
                                    t0.Email,
                                    NomeEquipe = t4.NomeEquipe,
                                    Sigla = t4.Sigla,
                                    idGrupo = t1.idGrupo,
                                    idCampeonato = t2.idCampeonato
                                };

            gvPilotos.DataSource = UsuariosGrupo;
            gvPilotos.DataBind();

        }

        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Aprovar")
            {
                if (IsAdmin)
                {
                    int idUsuario = Convert.ToInt16(e.CommandArgument);
                    int idGrupo = Convert.ToInt16(ddlGrupos.SelectedValue);

                    Kart_Usuario_Grupo UsuarioAlterar = (from u in dk.Usuarios
                                                         join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                                                         where ug.idUsuario == idUsuario
                                                         && ug.idGrupo == idGrupo
                                                         select ug).FirstOrDefault();

                    UsuarioAlterar.Aprovado = true;

                    dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

                    Alert("Alteração efetuado com sucesso!");
                    EMail.EnviarEmailStatus(idUsuario, idGrupo);
                    PopularGrids(Convert.ToInt16(ddlGrupos.SelectedValue));
                }
                else
                    Alert("Você não é o administrador do grupo para efetuar essa operação!");
            }
        }
        protected void btnAddUsuarioGrupo_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmailNovoUsuario.Text.IndexOf('@') < 0 && txtEmailNovoUsuario.Text.IndexOf('.') < 0)
                    throw new Exception("E-Mail informado é inválido.");

                //Verificar se já existe cadastro um usuario com este e-mail.
                Usuario usr = (from k in dk.Usuarios
                             where k.Email == txtEmailNovoUsuario.Text
                             select k).FirstOrDefault();
                
                if (usr == null)
                {
                    string Apelido = txtEmailNovoUsuario.Text.Substring(0, txtEmailNovoUsuario.Text.IndexOf('@'));
                    if (Apelido.Length >= 29) Apelido.Substring(0, 29);

                    usr = new Usuario();
                    usr.Nome = txtEmailNovoUsuario.Text;
                    usr.Email = txtEmailNovoUsuario.Text;
                    usr.Apelido = Apelido;
                    usr.Senha = GerarSenhaAleatorio();
                    usr.MostarInfo = true;
                    usr.Ativo = false;

                    dk.GetTable<Usuario>().InsertOnSubmit(usr);
                    dk.SubmitChanges(ConflictMode.FailOnFirstConflict);
                }

                Kart_Usuario_Grupo kug = new Kart_Usuario_Grupo();
                kug.Admin = false;
                kug.Aprovado = true;
                kug.idGrupo = Convert.ToInt16(IdGrupo.Value);
                kug.idUsuario = usr.idUsuario;
                kug.dtCriacao = DateTime.Now;

                dk.GetTable<Kart_Usuario_Grupo>().InsertOnSubmit(kug);
                dk.SubmitChanges(ConflictMode.FailOnFirstConflict);

                EMail.EnviarEmailBemvido(usr, Convert.ToInt16(IdGrupo.Value));

                Alert("Convite enviado com sucesso!");

            }
            catch (Exception ex)
            {
                Alert(ex);
            }
            finally
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Tab", "$(function() { $('#tabs').tabs( 'select' , 1 );});", true);
            }
        }

        private string GerarSenhaAleatorio()
        {
            string pw = "";
            for (int i = 0; i < 6; i++)
                pw += new Random().Next(9);
            return pw;
        }

        protected void gvPilotos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                object Argument = e.CommandArgument;
                string CommandName = e.CommandName;

                if (CommandName == "Exluir")
                {
                    if (IsAdmin)
                    {
                        int idUsuario = Convert.ToInt16(Argument);
                        int idGrupo = Convert.ToInt16(ddlGrupos.SelectedValue);
                        

                        var ue = (from kart_usuario_grupos in dk.Kart_Usuario_Grupos
                                  join t3 in dk.Kart_Usuario_Equipe_Campeonatos on kart_usuario_grupos.idUsuario equals t3.idUsuario into t3_join
                                  from t3 in t3_join.DefaultIfEmpty()
                                  join t4 in dk.Kart_Equipe_Campeonatos on t3.idEquipeCampeonato equals t4.idEquipeCampeonato into t4_join
                                  from t4 in t4_join.DefaultIfEmpty()
                                  where
                                    kart_usuario_grupos.idUsuario == idUsuario &&
                                    kart_usuario_grupos.idGrupo == idGrupo 
                                  select new
                                  {
                                      idGrupo = kart_usuario_grupos.idGrupo,
                                      Id_Usuario_Lider = kart_usuario_grupos.Kart_Grupo.Id_Usuario_Lider,
                                      idUsuario = kart_usuario_grupos.idUsuario,
                                      kart_usuario_grupos.idGrupoUsuario,
                                      idEquipeCampeonato = (System.Int16?)t4.idEquipeCampeonato,
                                      idUsuarioEquipeCampeonato = (System.Int16?)t3.idUsuarioEquipeCampeonato 
                                  }).FirstOrDefault();

                        if (ue != null)
                        {
                            if (idUsuario == ue.Id_Usuario_Lider)
                            {
                                Alert("Não é possivel remover o usuario lider do grupo!");
                                return;
                            }
                            //deletar os registros de resultados primeiro.
                            var resultados = from r in dk.Kart_Resultado_Calendarios
                                             join c in dk.Kart_Calendario_Campeonatos on r.idCalendario equals c.idCalendario
                                             join cp in dk.Kart_Campeonatos on c.idCampeonato equals cp.idCampeonato
                                             where r.idUsuario == idUsuario
                                             && cp.idGrupo == ue.idGrupo
                                             select r;

                            foreach (var r in resultados)
                            {
                                dk.GetTable<Kart_Resultado_Calendario>().DeleteOnSubmit(r);
                                dk.SubmitChanges();
                            }

                            //deletar do Grid
                            var grids = from r in dk.Kart_Grid_Calendarios
                                        join c in dk.Kart_Calendario_Campeonatos on r.idCalendario equals c.idCalendario
                                        join cp in dk.Kart_Campeonatos on c.idCampeonato equals cp.idCampeonato
                                        where r.idUsuario == idUsuario
                                        && cp.idGrupo == ue.idGrupo
                                        select r;

                            foreach (var r in grids)
                            {
                                dk.GetTable<Kart_Grid_Calendario>().DeleteOnSubmit(r);
                                dk.SubmitChanges();
                            }

                            if (ue.idUsuarioEquipeCampeonato != null)
                            {
                                //Deletar da Equipe
                                var UsuarioEquipe = (from eq in dk.Kart_Usuario_Equipe_Campeonatos
                                                     where eq.idUsuario == idUsuario
                                                     && eq.idUsuarioEquipeCampeonato == ue.idUsuarioEquipeCampeonato
                                                     select eq);

                                foreach (var item in UsuarioEquipe)
                                {
                                    dk.GetTable<Kart_Usuario_Equipe_Campeonato>().DeleteOnSubmit(item);
                                    dk.SubmitChanges();
                                }
                            }

                            if (ue.idGrupoUsuario > 0)
                            {
                                //deletar do grupo
                                var grupos = from g in dk.Kart_Usuario_Grupos
                                             where g.idUsuario == idUsuario
                                             && g.idGrupo == idGrupo
                                             select g;

                                foreach (var g in grupos)
                                {
                                    dk.GetTable<Kart_Usuario_Grupo>().DeleteOnSubmit(g);
                                    dk.SubmitChanges();
                                }
                            }

                            Alert("Usuario exluido do grupo com sucesso!");
                        }
                    }
                    else
                        Alert("Você não é o administrador do grupo para efetuar essa operação!");
                }
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }
    }
}