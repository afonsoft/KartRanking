using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.Page;
using KartRanking.BaseDados;
using KartRanking.Tools;
using KartRanking.email;

namespace KartRanking.Administrador
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)    *
    * DATA: 26-03-2014                                      *
    * E-MAIL: afonsoft@outlook.com.br                       *
    * *******************************************************
    * ALTERAÇÕES:                                           *
    * Issues (1759): Criação da tela                        *
    ********************************************************/
    public partial class RegrasGrupo : PageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                chkEnviarTodosUsuarios.Checked = false;
                PopularRegra();
            }
        }

        private void PopularRegra()
        {

            if (IsAdmin)
            {
                textarea.Visible = true;
                ExibirRegras.Visible = false;
                btnSalvar.Visible = true;
                chkEnviarTodosUsuarios.Visible = true;
            }
            else
            {
                textarea.Visible = false;
                ExibirRegras.Visible = true;
                btnSalvar.Visible = false;
                chkEnviarTodosUsuarios.Visible = false;
            }
            DataKartDataContext dk = new DataKartDataContext();
            Kart_Regras_Grupo regra = (from r in dk.Kart_Regras_Grupos
                                       where r.idGrupo == IdGrupo
                                       && r.Ativo == true
                                       select r).FirstOrDefault();

            if (regra != null)
            {
                if (IsAdmin)
                {
                    textarea.Text = regra.Regra;
                }
                else
                {
                    ExibirRegras.InnerHtml = regra.Regra;
                }
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                DataKartDataContext dk = new DataKartDataContext();
                var regras = (from r in dk.Kart_Regras_Grupos
                              where r.idGrupo == IdGrupo
                              && r.Ativo == true
                              select r);

                foreach (var reg in regras)
                {
                    reg.Ativo = false;
                }

                dk.SubmitChanges();

                Kart_Regras_Grupo regra = new Kart_Regras_Grupo();
                regra.Ativo = true;
                regra.dtCadastro = DateTime.Now;
                regra.idGrupo = IdGrupo;
                regra.idUsuario = UsuarioLogado.idUsuario;
                regra.Regra = textarea.Text;

                dk.Kart_Regras_Grupos.InsertOnSubmit(regra);
                dk.SubmitChanges();

                PopularRegra();

                Alert("Alteração da regra efetuado com sucesso.");

                EMail.EnviarEmailRegraGrupo(UsuarioLogado.idUsuario, IdGrupo);

                if (chkEnviarTodosUsuarios.Checked)
                {
                    //Pegar os usuarário do grupo e disparar o e-mail informando da alteração.
                    int[] idUsuarios = (from ug in dk.Kart_Usuario_Grupos
                                        where ug.idGrupo == IdGrupo
                                        && ug.idUsuario != UsuarioLogado.idUsuario
                                        && ug.Aprovado == true
                                        select ug.idUsuario).ToArray();

                    foreach (int idusuario in idUsuarios)
                    {
                        EMail.EnviarEmailRegraGrupo(idusuario, IdGrupo);
                    }
                }

                chkEnviarTodosUsuarios.Visible = false;
                chkEnviarTodosUsuarios.Checked = false;

            }
            catch (Exception ex)
            {
                Alert(ex);
            }
        }
    }
}