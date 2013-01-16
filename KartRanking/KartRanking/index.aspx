<%@ Page Title="" Language="C#" MasterPageFile="~/KartRanking.Master" AutoEventWireup="true"
    CodeBehind="index.aspx.cs" Inherits="KartRanking.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <table cellpadding="2" cellspacing="2" border="0" width="100%">
        <tr>
            <td>
                <div class="container_12">
                    <div class="grid_2">
                        &nbsp;</div>
                    <div class="grid_8">
                        <h3 class="titulo">
                            Efetuar o login</h3>
                        <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                            Utilizar o seu e-mail cadastrado no sistema.</p>
                        <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                            border-right: #ccc 1px dashed;" />
                    </div>
                    <div class="grid_2">
                        &nbsp;</div>
                    <div class="clear espaco_mini">
                        &nbsp;</div>
                    <div class="grid_2">
                        &nbsp;</div>
                    <div class="grid_4">
                        <label>
                            Usuário:</label><br />
                        <asp:TextBox ID="txtUsuario" placeholder="Usuário@email.com" ToolTip="Informe o seu e-mail cadastrado." MaxLength="200" runat="server"></asp:TextBox>
                    </div>
                    <div class="grid_4">
                        <label>
                            Senha:</label><br />
                        <asp:TextBox ID="txtSenha" TextMode="Password" ToolTip="Informe a sua senha." placeholder="Senha" MaxLength="50"
                            runat="server"></asp:TextBox>
                    </div>
                    <div class="grid_2">
                        &nbsp;</div>
                    <div class="clear espaco_mini">
                        &nbsp;</div>
                    <div class="grid_2">
                        &nbsp;</div>
                    <div class="grid_4">
                        <a href="CadastroUsuario.aspx" title="Efetuar um novo cadastro.">Efetuar um cadastro</a></div>
                    <div class="grid_4">
                        <div style="text-align: right;">
                            <asp:Button ID="btnLogar" runat="server" Text="Entrar" Width="150px" OnClick="btnLogar_Click" />
                        </div>
                    </div>
                    <div class="grid_2">
                        &nbsp;</div>
                    <div class="clear espaco">
                        &nbsp;</div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <span>O <b>kart.afonsoft.com.br</b> é uma das primeiras comunidade Brasileira de kart
                    que oferece uma ferramenta completa para a administração e divulgação do seu campeonato
                    de kart.
                    <br />
                    Todos os serviços são 100% Free e criados especialmente para você.
                    <br />
                    Cadastrando o seu campeonato (indoor, profissional, amador), você terá a sua disposição
                    um site personalizado com tudo que você precisa para turbinar o seu evento. Ex:
                    kart.afonsoft.com.br/grupo/amigos2012.aspx<br />
                    Participe você também dessa comunidade de pilotos profissionais e amadores de todo
                    o mundo.
                    <br />
                    O cadastro leva aproximadamente 3 minutos e você terá a sua disposição um gestor
                    de conteúdo para publicar todas as informações do seu evento na internet de forma
                    muito simples. </span>
            </td>
        </tr>
    </table>
</asp:Content>
