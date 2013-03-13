<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="CadastroUsuarioBasico.aspx.cs" Inherits="KartRanking.Administrador.CadastroUsuarioBasico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Cadastro basico de usuário</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Efetuar um cadastro basico de um usuário</p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Grupo:</span>
        </div>
        <div class="grid_10">
            <asp:Label ID="lblGrupo" runat="server" Text="Nenhum grupo selecionado"></asp:Label>
        </div>
        <div class="clear">
            &nbsp;
        </div>
        <div class="grid_12">
            <span>Você receberá um e-mail de confirmação, neste e-mail terá a sua senha de acesso.
                Após o primeiro acesso será necessário preencher o resto dos seus dados.</span>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">E-Mail:</span>
        </div>
        <div class="grid_10">
            <asp:TextBox ID="txtMail" runat="server" MaxLength="200" Width="350px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="O campo é obrigatório!"
                ToolTip="O campo é obrigatório!" ControlToValidate="txtMail" ValidationGroup="vgroup">*</asp:RequiredFieldValidator>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_2">
            <img src="Captcha.aspx" alt="Captcha" />
        </div>
        <div class="grid_10">
            <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" runat="server" ErrorMessage="O campo é obrigatório!"
                ControlToValidate="txtCaptcha" ToolTip="O campo é obrigatório!" ValidationGroup="vgroup">*</asp:RequiredFieldValidator>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_2">
            &nbsp;
        </div>
        <div class="grid_10">
            <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" OnClick="btnCadastrar_Click"
                ValidationGroup="vgroup" />
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
    </div>
</asp:Content>
