<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PainelMenu.master" AutoEventWireup="true"
    CodeBehind="CadastroGrupo.aspx.cs" Inherits="KartRanking.CadastroGrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
        
            $('#<%= txtUrlAcesso.ClientID %>').on("focus", function() {
                var dest = $(this);
                dest.val(dest.val().split(" ").join(""));
            });
            
            $('#<%= txtUrlAcesso.ClientID %>').on("blur", function() {
                var dest = $(this);
                dest.val(dest.val().split(" ").join(""));
            });

            $('#<%= txtUrlAcesso.ClientID %>').blur(function() {
                var dest = $('#<%= txtUrlAcesso.ClientID %>').val();
                dest.val(dest.val().split(" ").join(""));
            });
            
        });
    </script>

    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                <asp:Literal ID="ltTitulo" runat="server"></asp:Literal></h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                <asp:Literal ID="ltDescricao" runat="server"></asp:Literal></p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Nome Grupo:</span><asp:HiddenField ID="HiddenIdGrupo" runat="server" />
        </div>
        <div class="grid_10">
            <asp:TextBox ID="txtNomeGrupo" MaxLength="200" runat="server"></asp:TextBox>
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Sigla Grupo:</span>
        </div>
        <div class="grid_4">
            <asp:TextBox ID="txtSigla" MaxLength="50" runat="server"></asp:TextBox>
        </div>
        <div class="grid_4">
            <span class="label">Permitir Inscrições:</span>
        </div>
        <div class="grid_2">
            <asp:DropDownList ID="ddlPermitirInscricoes" runat="server">
                <asp:ListItem Selected="true" Text="Sim" Value="true" />
                <asp:ListItem Text="Não" Value="false" />
            </asp:DropDownList>
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Url Acesso:</span>
        </div>
        <div class="grid_10">
            <asp:TextBox ID="txtUrlAcesso" MaxLength="50" runat="server"></asp:TextBox>
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Estado:</span>
        </div>
        <div class="grid_4">
            <asp:DropDownList ID="ddlEstado" runat="server">
                <asp:ListItem Text="Acre (AC)" Value="AC" />
                <asp:ListItem Text="Alagoas (AL)" Value="AL" />
                <asp:ListItem Text="Amapá (AP)" Value="AP" />
                <asp:ListItem Text="Amazonas (AM)" Value="AM" />
                <asp:ListItem Text="Bahia (BA)" Value="BA" />
                <asp:ListItem Text="Ceará (CE)" Value="CE" />
                <asp:ListItem Text="Distrito Federal (DF)" Value="DF" />
                <asp:ListItem Text="Espírito Santo (ES)" Value="ES" />
                <asp:ListItem Text="Goiás (GO)" Value="GO" />
                <asp:ListItem Text="Maranhão (MA)" Value="MA" />
                <asp:ListItem Text="Mato Grosso (MT)" Value="MT" />
                <asp:ListItem Text="Mato Grosso do Sul (MS)" Value="MS" />
                <asp:ListItem Text="Minas Gerais (MG)" Value="MG" />
                <asp:ListItem Text="Pará (PA)" Value="PA" />
                <asp:ListItem Text="Paraíba (PB)" Value="PB" />
                <asp:ListItem Text="Paraná (PR)" Value="PR" />
                <asp:ListItem Text="Pernambuco (PE)" Value="PE" />
                <asp:ListItem Text="Piauí (PI)" Value="PI" />
                <asp:ListItem Text="Rio de Janeiro (RJ)" Value="RJ" />
                <asp:ListItem Text="Rio Grande do Norte (RN)" Value="RN" />
                <asp:ListItem Text="Rio Grande do Sul (RS)" Value="RS" />
                <asp:ListItem Text="Rondônia (RO)" Value="RO" />
                <asp:ListItem Text="Roraima (RR)" Value="RR" />
                <asp:ListItem Text="Santa Catarina (SC)" Value="SC" />
                <asp:ListItem Text="São Paulo (SP)" Value="SP" />
                <asp:ListItem Text="Sergipe (SE)" Value="SE" />
                <asp:ListItem Text="Tocantins (TO)" Value="TO" />
            </asp:DropDownList>
        </div>
        <div class="grid_2">
            <span class="label">Cidade:</span>
        </div>
        <div class="grid_4">
            <asp:TextBox ID="txtCidade" MaxLength="100" runat="server"></asp:TextBox>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
    </div>
</asp:Content>
