<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="RecuperarSenha.aspx.cs" Inherits="KartRanking.Administrador.RecuperarSenha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">

    <script type="text/javascript">
        $(function() {
            $("#<%= btnRecuperar.ClientID %>").button();
        });          
    </script>

    <div class="container_12">
        <div class="grid_12">
            <h3 class="StepTitle">
                Recuperar a Senha</h3>
            <div class="StepSubTitle">
                Recuperar a senha de um e-mail</div>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <span>Você receberá um e-mail de confirmação, neste e-mail terá a sua senha de acesso.</span>
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
            <img src="Captcha.aspx" alt="Captcha" title="Captcha" />&nbsp;
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
            <asp:Button ID="btnRecuperar" runat="server" Text="Enviar a Senha" OnClick="btnRecuperar_Click"
                ValidationGroup="vgroup" />
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
    </div>
</asp:Content>
