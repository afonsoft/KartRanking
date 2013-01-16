using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KartRanking.BaseDados;
using System.Data.Linq;
using KartRanking.Page;
using KartRanking.Tools;
using System.IO;
using KartRanking.email;

namespace KartRanking
{
    public partial class CadastroUsuario : PageBase
    {
        

        protected void Page_Load( object sender, EventArgs e )
        {
            if(!IsPostBack)
            {
                IdGrupo.Value = "0";

                if ( Request.QueryString[ "idGrupo" ] != null )
                {
                    IdGrupo.Value = Request.QueryString[ "idGrupo" ];

                    Kart_Grupo grupo = ( from g in dk.Kart_Grupos
                                         where g.idGrupo == Convert.ToInt16( IdGrupo.Value )
                                         select g ).FirstOrDefault();

                    if ( grupo != null && grupo.idGrupo >0 )
                    {
                        //Verficar se aceita iscrições.
                        if ( grupo.permitirInsricoes )
                        {
                            ltNomeGrupo.Text = "<b>"+grupo.NomeGrupo+"</b>";
                            IdGrupo.Value = grupo.idGrupo.ToString();
                        }
                        else
                        {
                            IdGrupo.Value = "0";
                            ltNomeGrupo.Text = "<b>"+grupo.NomeGrupo+"</b><br/>Esse grupo não permite inscrições!";
                        }
                    }
                    else
                    {
                        IdGrupo.Value = "0";
                        ltNomeGrupo.Text = "Grupo não localizado na base!";
                    }
                }
            }
        }

        protected void btnCadastrar_Click( object sender, EventArgs e )
        {
            try
            {
                ValidarDadosTela();

                Usuario u = new Usuario();

                u.Nome = txtNome.Text;
                u.Email= txtEmail.Text;
                u.Apelido= txtApelido.Text;
                if ( !string.IsNullOrEmpty( txtPeso.Text ) )
                    u.Peso = Convert.ToDecimal( txtPeso.Text );
                if ( !string.IsNullOrEmpty( txtAltura.Text ) )
                    u.Altura = Convert.ToDecimal( txtAltura.Text );
                u.Telefone = txtTelefone.Text;
                u.Celular = txtCelular.Text;
                u.Endereco = txtEndereco.Text;
                u.Cidade=  txtCidade.Text;
                u.Estado = ddlEstado.SelectedValue;
                u.Sexo = Convert.ToChar( ddlSexo.SelectedValue );
                u.dtCriacao = DateTime.Now;
                u.Senha = txtSenha1.Text;
                u.Perfil_Facebook = txtPerfilFacebook.Text;
                u.Perfil_Plus = txtPerfilPlus.Text;
                u.Perfil_Twitter = txtPerfilTwitter.Text;
                u.Obs = "";
                u.Perfil_Outros = "";
                u.MostarInfo = true;
                u.Ativo = true;

                dk.GetTable<Usuario>().InsertOnSubmit( u );

                dk.SubmitChanges( ConflictMode.FailOnFirstConflict );

                Session[ "Usuario" ] = u;

                //Cadastrar o usuario no grupo
                if ( Convert.ToInt16( IdGrupo.Value ) > 0 )
                {

                    int count = ( from k in dk.Kart_Usuario_Grupos
                                  where k.idUsuario == u.idUsuario && 
                                 k.idGrupo ==Convert.ToInt16( IdGrupo.Value )
                                  select k ).Count();

                    if ( count <=0 )
                    {
                        Kart_Usuario_Grupo kug = new Kart_Usuario_Grupo();
                        kug.Admin = false;
                        kug.Aprovado = false;
                        kug.idGrupo =Convert.ToInt16( IdGrupo.Value );
                        kug.idUsuario = u.idUsuario;
                        kug.dtCriacao = DateTime.Now;

                        dk.GetTable<Kart_Usuario_Grupo>().InsertOnSubmit( kug );
                        dk.SubmitChanges( ConflictMode.FailOnFirstConflict );
                    }
                }

                EMail.EnviarEmailBemvido(u, Convert.ToInt16(IdGrupo.Value));

                Alert("Cadastro efetuado com sucesso!", "index.aspx");
            }
            catch ( Exception ex )
            {
                Alert( ex );
            }
        }

        private void ValidarDadosTela()
        {
            if ( !txtSenha1.Text.Equals( txtSenha2.Text ) )
                throw new Exception( "Senha não confere!" );

            if ( String.IsNullOrEmpty( txtNome.Text ) )
                throw new Exception( "Campo nome é obrigatório." );

            if ( String.IsNullOrEmpty( txtApelido.Text ) )
                throw new Exception( "Campo apelido é obrigatório." );

            if ( String.IsNullOrEmpty( txtEmail.Text ) )
                throw new Exception( "Campo E-Mail é obrigatório." );

            if ( txtEmail.Text.IndexOf( '@' ) < 0 && txtEmail.Text.IndexOf( '.' ) < 0 )
                throw new Exception( "E-Mail informado é inválido." );

            int count = ( from k in dk.Usuarios
                          where k.Email == txtEmail.Text
                          select k ).Count();

            if ( count > 0 )
                throw new Exception( "E-Mail já cadastrado na base de dados!" );
        }
    }
}
