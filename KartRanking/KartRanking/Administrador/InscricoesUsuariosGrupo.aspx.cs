using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using System.Data.Linq;
using KartRanking.email;

namespace KartRanking.Administrador
{
    public partial class InscricoesUsuariosGrupo : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string idTab = Request.QueryString["tab"];
                PopularGrids();

                if (!String.IsNullOrEmpty(idTab))
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Tab", "$(function() { $('#tabs').tabs( 'select' , 1 );});", true);
                    
            }
        }

        private void PopularGrids()
        {

            var UsuarioLivre = from u in dk.Usuarios
                               join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                               where ug.idGrupo == IdGrupo
                               && ug.Aprovado == false
                               select u;

            gvUsuariosAdmin.DataSource = UsuarioLivre;
            gvUsuariosAdmin.DataBind();

            
            var UsuariosGrupo = from t0 in dk.Usuarios
                                join t1 in dk.Kart_Usuario_Grupos on t0.idUsuario equals t1.idUsuario
                                where
                                  t1.idGrupo == IdGrupo &&
                                  t1.Aprovado == true
                                select new
                                {
                                    idUsuario = t0.idUsuario,
                                    t0.Nome,
                                    t0.Email,
                                    idGrupo = t1.idGrupo,
                                };

            gvPilotos.DataSource = UsuariosGrupo;
            gvPilotos.DataBind();

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
                kug.idGrupo = IdGrupo;
                kug.idUsuario = usr.idUsuario;
                kug.dtCriacao = DateTime.Now;

                dk.GetTable<Kart_Usuario_Grupo>().InsertOnSubmit(kug);
                dk.SubmitChanges(ConflictMode.FailOnFirstConflict);

                EMail.EnviarEmailBemvido(usr, IdGrupo);

                Alert("Convite enviado com sucesso!");

            }
            catch (Exception ex)
            {
                Alert(ex);
            }
            finally
            {
                Page.ClientScript.RegisterStartupScript( this.GetType(), "Tab", "$(function() { $('#tabs').tabs( 'select' , 1 );});", true);
            }
        }

        private string GerarSenhaAleatorio()
        {
            Random rnd = new Random();
            string pw = "";
            for (int i = 0; i < 6; i++)
                pw += rnd.Next(9);
            return pw;
        }

        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Aprovar")
            {
                if (IsAdmin)
                {
                    int idUsuario = Convert.ToInt16(e.CommandArgument);

                    Kart_Usuario_Grupo UsuarioAlterar = (from u in dk.Usuarios
                                                         join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                                                         where ug.idUsuario == idUsuario
                                                         && ug.idGrupo == IdGrupo
                                                         select ug).FirstOrDefault();

                    UsuarioAlterar.Aprovado = true;

                    dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

                    Alert("Alteração efetuado com sucesso!");
                    EMail.EnviarEmailStatus(idUsuario, IdGrupo);
                    PopularGrids();
                }
                else
                    Alert("Você não é o administrador do grupo para efetuar essa operação!");
            }
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

                        var ue = (from kart_usuario_grupos in dk.Kart_Usuario_Grupos
                                  join t3 in dk.Kart_Usuario_Equipe_Campeonatos on kart_usuario_grupos.idUsuario equals t3.idUsuario into t3_join
                                  from t3 in t3_join.DefaultIfEmpty()
                                  join t4 in dk.Kart_Equipe_Campeonatos on t3.idEquipeCampeonato equals t4.idEquipeCampeonato into t4_join
                                  from t4 in t4_join.DefaultIfEmpty()
                                  where
                                    kart_usuario_grupos.idUsuario == idUsuario &&
                                    kart_usuario_grupos.idGrupo == IdGrupo
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
                                             && g.idGrupo == IdGrupo
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
