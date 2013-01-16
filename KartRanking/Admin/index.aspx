<%@ Page Title="" Language="C#" MasterPageFile="~/KartRanking.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="KartRanking.Admin.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
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
            <asp:TextBox ID="txtUsuario" placeholder="Usuário@email.com" MaxLength="200" runat="server"></asp:TextBox>
        </div>
        <div class="grid_4">
            <label>
                Senha:</label><br />
            <asp:TextBox ID="txtSenha" TextMode="Password" placeholder="Senha" MaxLength="50" runat="server"></asp:TextBox>
        </div>
        <div class="grid_2">
            &nbsp;</div>
        <div class="clear espaco_mini">
            &nbsp;</div>
        <div class="grid_2">
            &nbsp;</div>
        <div class="grid_8">
            <div style="text-align: right;">
                <asp:Button ID="btnLogar" runat="server" Text="Entrar" Width="150px" OnClick="btnLogar_Click" />
            </div>
        </div>
        <div class="grid_2">
            &nbsp;</div>
        <div class="clear espaco">
            &nbsp;</div>
    </div>
</asp:Content>
