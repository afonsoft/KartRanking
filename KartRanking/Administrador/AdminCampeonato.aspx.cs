using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;

namespace KartRanking.Administrador
{
    public partial class AdminCampeonato : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                HiddenIdGrupo.Value = IdGrupo.ToString();
                HiddenIdCampeonato.Value = "0";

                if (String.IsNullOrEmpty(HiddenIdGrupo.Value))
                    throw new Exception("Grupo informado inválido.");

                if (!VerificarPermissaoUsuarioGrupo(IdGrupo))

                    if (IdCampeonato > 0)
                    {
                        HiddenIdCampeonato.Value = IdCampeonato.ToString();
                        ltTitulo.Text = "Alteração do Campeonato";
                        ltDescricao.Text = "Efetuar alteração do Campeonato";
                        PopularTela(IdCampeonato, IdGrupo);
                    }
                    else
                    {
                        HiddenIdCampeonato.Value = "0";
                        IdCampeonato = 0;
                        ltTitulo.Text = "Cadastro de um Campeonato";
                        ltDescricao.Text = "Efetuar cadastro de um Campeonato para o grupo";
                    }
            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }

        private void PopularTela(int idCampeonato, int idGrupo)
        {
            Kart_Campeonato kc = (from k in dk.Kart_Campeonatos where k.idGrupo == idGrupo && k.idCampeonato == idCampeonato select k).FirstOrDefault();

            if (kc != null)
            {
                txtDtFim.Text = kc.dtFim.ToString("dd/MM/yyyy");
                txtDtInicio.Text = kc.dtInicio.ToString("dd/MM/yyyy");
                txtNomeCampeonato.Text = kc.NomeCampeonato;
                ddlAtivo.Items.FindByValue(kc.Ativo.ToString()).Selected = true;
            }
            else
                Alert("Erro para recuperar as informações do Campeonato.", "PainelControle.aspx?IdGrupo=" + Request.QueryString["IdGrupo"]);

        }

        private bool VerificarPermissaoUsuarioGrupo(int idGrupo)
        {
            Usuario user = (Usuario)Session["Usuario"];

            var grupoAdmin = (from gu in dk.Kart_Usuario_Grupos
                              where gu.idUsuario == user.idUsuario
                              && gu.idGrupo == idGrupo
                              select new { gu.Admin }).FirstOrDefault();

            if (grupoAdmin != null && grupoAdmin.Admin.HasValue)
                return grupoAdmin.Admin.Value;
            else
                return false;
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                int idCampeonato = Convert.ToInt16(HiddenIdCampeonato.Value);
                int idGrupo = Convert.ToInt16(HiddenIdGrupo.Value);
                Kart_Campeonato kc = null;

                ValidarDatas();

                if (idCampeonato > 0)
                {
                    kc = (from k in dk.Kart_Campeonatos
                          where k.idCampeonato == idCampeonato && k.idGrupo == idGrupo
                          select k).FirstOrDefault();
                }
                else
                {
                    kc = new Kart_Campeonato();
                    kc.idGrupo = idGrupo;
                }

                kc.Ativo = Convert.ToBoolean(ddlAtivo.SelectedValue);
                kc.dtInicio = Convert.ToDateTime(txtDtInicio.Text);
                kc.dtFim = Convert.ToDateTime(txtDtFim.Text);
                kc.dtCriacao = DateTime.Now;
                kc.NomeCampeonato = txtNomeCampeonato.Text;

                if (idCampeonato <= 0)
                    dk.GetTable<Kart_Campeonato>().InsertOnSubmit(kc);

                dk.SubmitChanges(System.Data.Linq.ConflictMode.FailOnFirstConflict);

                if (idCampeonato > 0)
                    Alert("Alteração do Campeonato efetuado com sucesso!", "PainelControle.aspx?IdGrupo=" + Request.QueryString["IdGrupo"]);
                else
                    Alert("Criação do Campeonato efetuado com sucesso!", "PainelControle.aspx?IdGrupo=" + Request.QueryString["IdGrupo"]);

            }
            catch (Exception ex)
            {
                Alert(ex);
            }

        }

        private void ValidarDatas()
        {
            try
            {
                DateTime dt = Convert.ToDateTime(txtDtInicio.Text);
                dt = Convert.ToDateTime(txtDtFim.Text);
            }
            catch
            {
                throw new Exception("Data Inválida!");
            }
        }
    }
}
