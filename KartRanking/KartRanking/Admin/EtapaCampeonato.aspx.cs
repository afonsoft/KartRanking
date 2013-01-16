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
    public partial class EtapaCampeonato : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HiddenIdCalendario.Value = Request.QueryString["IdCalendario"];
                HiddenIdCampeonato.Value = Request.QueryString["IdCampeonato"];
                HiddenIdGrupo.Value = Request.QueryString["IdGrupo"];
                HiddenIdResultado.Value = "0";

                if (String.IsNullOrEmpty(HiddenIdGrupo.Value) ||
                    String.IsNullOrEmpty(HiddenIdCampeonato.Value) ||
                    String.IsNullOrEmpty(HiddenIdGrupo.Value))
                    Response.Redirect("PainelControle.aspx?idgrupo=" + HiddenIdGrupo.Value);

                btnSalvar.Enabled = false;
                pnlAddResult.Visible = false;

                PopularTela(Convert.ToInt16(HiddenIdGrupo.Value), Convert.ToInt16(HiddenIdCampeonato.Value), Convert.ToInt16(HiddenIdCalendario.Value));

                if (IsAdmin)
                {
                    pnlAddResult.Visible = true;
                    btnSalvar.Enabled = true;
                }
            }
        }

        private void PopularTela(int idGrupo, int idCampeonato, int idCalendario)
        {
            var Resultado = (from g in dk.Kart_Resultado_Calendarios
                             join u in dk.Usuarios on g.idUsuario equals u.idUsuario
                             join ug in dk.Kart_Usuario_Grupos on u.idUsuario equals ug.idUsuario
                             join ge in dk.Kart_Campeonatos on ug.idGrupo equals ge.idGrupo
                             join e in dk.Kart_Equipe_Campeonatos on ge.idCampeonato equals e.idCampeonato
                             join ue in dk.Kart_Usuario_Equipe_Campeonatos on e.idEquipeCampeonato equals ue.idEquipeCampeonato
                             where g.idCalendario == idCalendario
                                && ue.idUsuario == g.idUsuario
                                && ue.idEquipeCampeonato == g.idEquipe
                                && ug.idGrupo == idGrupo
                                && e.idCampeonato == idCampeonato
                                && ug.Aprovado == true
                             orderby g.Pos ascending
                             select new
                             {
                                 g.idResultado,
                                 g.Ponto,
                                 g.idCalendario,
                                 g.idEquipe,
                                 g.Pos,
                                 g.Voltas,
                                 tempo = g.tempoMinutos.ToString().PadLeft(2, '0') + ":" + g.tempoSegundos.ToString().PadLeft(2, '0') + ":" + g.tempoMilisegundos.ToString().PadLeft(3, '0'),
                                 u.Nome,
                                 e.NomeEquipe
                             });


            gvResultados.DataSource = Resultado;
            gvResultados.DataBind();

            var Grupo = (from g in dk.Kart_Grupos
                         join c in dk.Kart_Campeonatos on g.idGrupo equals c.idGrupo
                         where g.idGrupo == idGrupo && c.idCampeonato == idCampeonato
                         select new { g.NomeGrupo, c.NomeCampeonato }).FirstOrDefault();

            if (Grupo != null)
            {
                ltNomeGrupo.Text = Grupo.NomeGrupo;
                ltNomeCampeonato.Text = Grupo.NomeCampeonato;
            }

            Kart_Calendario_Campeonato cc = (from c in dk.Kart_Calendario_Campeonatos
                                             where c.idCalendario == idCalendario
                                             && c.idCampeonato == idCampeonato
                                             select c).FirstOrDefault();

            if (cc != null)
            {
                ltDataHora.Text = cc.Data.ToString("dd/MM/yyyy") + " - " + cc.Horario;
                ltKartodromo.Text = cc.Kartodromo;
                ltEtapa.Text = cc.Nome;
            }

            PopularDDL(idGrupo, idCalendario);

        }

        private void PopularDDL( int idGrupo, int idCalendario)
        {
            
                //recuperar somente os usuarios que não está cadastro no resultados.
                var Pilotos = from kart_usuario_grupos in dk.Kart_Usuario_Grupos
                              join usuarios in dk.Usuarios on kart_usuario_grupos.idUsuario equals usuarios.idUsuario
                              from kart_calendario_campeonatos in dk.Kart_Calendario_Campeonatos
                              where
                                !
                                  (from a in dk.Kart_Resultado_Calendarios
                                   where
                                     a.idCalendario == kart_calendario_campeonatos.idCalendario
                                   select new
                                   {
                                       a.idUsuario
                                   }).Contains(new { usuarios.idUsuario }) &&
                                kart_usuario_grupos.idGrupo == idGrupo &&
                                kart_calendario_campeonatos.idCalendario == idCalendario
                              select new
                              {
                                  idUsuario = (System.Int32?)kart_usuario_grupos.idUsuario,
                                  usuarios.Nome
                              };

                ddlPilotoDisponivel.DataSource = Pilotos;
                ddlPilotoDisponivel.DataTextField = "Nome";
                ddlPilotoDisponivel.DataValueField = "idUsuario";
                ddlPilotoDisponivel.DataBind();
            
        }

        protected void gvResultados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (IsAdmin)
            {
                int idGrupo = Convert.ToInt16(HiddenIdGrupo.Value);
                int idCampeonato = Convert.ToInt16(HiddenIdCampeonato.Value);
                int idCalendario = Convert.ToInt16(HiddenIdCalendario.Value);
                int idResultado = Convert.ToInt16(e.CommandArgument);

                if (e.CommandName == "Exluir")
                {
                    var kr = ( from k in dk.Kart_Resultado_Calendarios
                           where k.idResultado == idResultado 
                           && k.idCalendario == idCalendario
                           select k ).FirstOrDefault();
                    if ( kr != null )
                    {
                        dk.GetTable<Kart_Resultado_Calendario>().DeleteOnSubmit( kr );
                        dk.SubmitChanges( System.Data.Linq.ConflictMode.FailOnFirstConflict );
                        PopularTela( idGrupo, idCampeonato, idCalendario );
                        Alert( "Apontamento excluido com sucesso!" );
                        
                        HiddenIdResultado.Value = "0";
                        txtPontos.Text = string.Empty;
                        txtPos.Text = string.Empty;
                        txtVoltas.Text = string.Empty;
                        txtTempo.Text = string.Empty;
                    }
                    else
                    {
                        Alert("Erro para localizar o dados na base!");
                    }
                }
                else if (e.CommandName == "Alterar")
                {
                    var kr = (from k in dk.Kart_Resultado_Calendarios
                              where k.idResultado == idResultado
                              && k.idCalendario == idCalendario
                              select k).FirstOrDefault();

                    if ( kr != null )
                    {
                        HiddenIdResultado.Value = Convert.ToString( idResultado );
                        var Usuario = ( from u in dk.Usuarios where u.idUsuario == kr.idUsuario select new { u.idUsuario, u.Nome } ).FirstOrDefault();
                        ddlPilotoDisponivel.Items.Clear();
                        ddlPilotoDisponivel.Items.Add( new ListItem( Usuario.Nome, Usuario.idUsuario.ToString(), true ) );
                        txtPontos.Text = kr.Ponto.ToString();
                        txtPos.Text = kr.Pos.ToString();
                        txtVoltas.Text= kr.Voltas.ToString();
                        txtTempo.Text = kr.tempoMinutos.ToString().PadLeft( 2, '0' ) + ":" + kr.tempoSegundos.ToString().PadLeft( 2, '0' ) + ":" + kr.tempoMilisegundos.ToString().PadLeft(3, '0' );
                    }
                    else
                    {
                        Alert( "Erro para localizar o dados na base!" );
                    }
                }
            }
        }

        protected void gvResultados_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count > 1)
            {
                if (IsAdmin)
                    e.Row.Cells[5].Visible = true;
                else
                    e.Row.Cells[5].Visible = false;
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (IsAdmin)
            {
                int IdResultado = String.IsNullOrEmpty(HiddenIdResultado.Value) ? 0 : Convert.ToInt16(HiddenIdResultado.Value);
                Kart_Resultado_Calendario kr = null;

                int idUsuario = Convert.ToInt16(ddlPilotoDisponivel.SelectedValue);
                int idGrupo = Convert.ToInt16(HiddenIdGrupo.Value);
                int idCampeonato = Convert.ToInt16(HiddenIdCampeonato.Value);
                int idCalendario = Convert.ToInt16(HiddenIdCalendario.Value);

                if (IdResultado <= 0)
                    kr = new Kart_Resultado_Calendario();
                else
                    kr = ( from k in dk.Kart_Resultado_Calendarios where k.idResultado == IdResultado && k.idCalendario == idCalendario select k ).FirstOrDefault();

                if (kr != null)
                {
                    var equipe_usuario = (from ek in dk.Kart_Usuario_Equipe_Campeonatos
                                          join en in dk.Kart_Equipe_Campeonatos on ek.idEquipeCampeonato equals en.idEquipeCampeonato
                                          join eg in dk.Kart_Campeonatos on en.idCampeonato equals eg.idCampeonato 
                                          where eg.idGrupo == idGrupo
                                          && ek.idUsuario == idUsuario
                                          && eg.idCampeonato == idCampeonato
                                          select new { ek.idUsuario, ek.idEquipeCampeonato }).FirstOrDefault();
                    
                    if (equipe_usuario != null)
                    {
                        kr.idCalendario = idCalendario;
                        kr.idEquipe = equipe_usuario.idEquipeCampeonato;
                        kr.idUsuario = idUsuario;
                        kr.Ponto = String.IsNullOrEmpty(txtPontos.Text) ? 0 : Convert.ToInt16(txtPontos.Text);
                        kr.Pos = String.IsNullOrEmpty(txtPos.Text) ? 0 : Convert.ToInt16(txtPos.Text);
                        kr.Voltas = String.IsNullOrEmpty(txtVoltas.Text) ? 0 : Convert.ToInt16(txtVoltas.Text);
                        //M00:S00:MS000
                        kr.tempoHoras = 0; 
                        kr.tempoMinutos = String.IsNullOrEmpty(txtTempo.Text) ? 0 : Convert.ToInt16(txtTempo.Text.Split(':')[0]);
                        kr.tempoSegundos = String.IsNullOrEmpty(txtTempo.Text) ? 0 : Convert.ToInt16(txtTempo.Text.Split(':')[1]);
                        kr.tempoMilisegundos = String.IsNullOrEmpty(txtTempo.Text) ? 0 : Convert.ToInt16(txtTempo.Text.Split(':')[2]);
                        
                        if ( IdResultado <= 0 )
                        {
                            kr.dtCriacao = DateTime.Now;
                            dk.GetTable<Kart_Resultado_Calendario>().InsertOnSubmit( kr );
                        }

                        dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

                        PopularTela(idGrupo, idCampeonato, idCalendario);

                        HiddenIdResultado.Value = "0";

                        txtPontos.Text = string.Empty;
                        txtPos.Text = string.Empty;
                        txtVoltas.Text = string.Empty;
                        txtTempo.Text = string.Empty;

                        Alert("Apontamento salvo com sucesso");
                    }
                    else
                    {
                        Alert("Usuário sem equipe!\n Não é possivel efetuar apontamento sem equipe!");
                        return;
                    }
                }
                else
                {
                    Alert("Não foi possivel efetuar a atualização do usuário.");
                    return;
                }
            }
            else
                Alert("Você não é o administrador deste grupo.");
        }
    }
}
