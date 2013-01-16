<%@ Page Title="" Language="C#" MasterPageFile="~/KartRanking.Master" AutoEventWireup="true"
    CodeBehind="CadastroUsuario.aspx.cs" Inherits="KartRanking.CadastroUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $('#<%= txtDtNascimento.ClientID %>').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy',
                dayNames: ['Domingo', 'Segunda', 'Ter&ccedil;a', 'Quarta', 'Quinta', 'Sexta', 'S&aacute;bado', 'Domingo'],
                dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
                dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'S&aacute;b', 'Dom'],
                monthNames: ['Janeiro', 'Fevereiro', 'Mar&ccedil;o', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
                nextText: 'Pr&oacute;ximo',
                prevText: 'Anterior',
                showAnim: 'slideDown'
            });

            $('#<%= txtAltura.ClientID%>, #<%= txtPeso.ClientID%>').numeric(",");
        });
        
    </script>

    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Cadastro</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Efetuar um cadastro de usuário para participar dos grupos</p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <asp:Literal ID="ltNomeGrupo" runat="server"></asp:Literal>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Nome:</span><asp:HiddenField ID="IdGrupo" runat="server" />
        </div>
        <div class="grid_10">
            <asp:TextBox ID="txtNome" MaxLength="200" runat="server"></asp:TextBox>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">E-Mail:</span></div>
        <div class="grid_6">
            <asp:TextBox ID="txtEmail" MaxLength="200" runat="server"></asp:TextBox>
        </div>
        <div class="grid_2">
            <span class="label">Dt. Nascimento:</span></div>
        <div class="grid_2">
            <asp:TextBox ID="txtDtNascimento" MaxLength="10" runat="server"></asp:TextBox>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Senha:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtSenha1" TextMode="Password" MaxLength="50" runat="server"></asp:TextBox>
        </div>
        <div class="grid_2">
            <span class="label">Confirmar:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtSenha2" TextMode="Password" MaxLength="50" runat="server"></asp:TextBox>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Apelido:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtApelido" MaxLength="100" runat="server"></asp:TextBox>
        </div>
        <div class="grid_2">
            <span class="label">Sexo:</span></div>
        <div class="grid_4">
            <asp:DropDownList ID="ddlSexo" runat="server">
                <asp:ListItem Text="Masculino" Value="M" />
                <asp:ListItem Text="Feminino" Value="F" />
            </asp:DropDownList>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Peso:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtPeso" MaxLength="5" runat="server"></asp:TextBox>
        </div>
        <div class="grid_2">
            <span class="label">Altura:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtAltura" MaxLength="4" runat="server"></asp:TextBox>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Telefone:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtTelefone" MaxLength="50" runat="server"></asp:TextBox>
        </div>
        <div class="grid_2">
            <span class="label">Celular:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtCelular" MaxLength="50" runat="server"></asp:TextBox>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Endereço:</span></div>
        <div class="grid_10">
            <asp:TextBox ID="txtEndereco" MaxLength="200" runat="server"></asp:TextBox>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Estado:</span></div>
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
            <span class="label">Cidade:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtCidade" MaxLength="100" runat="server"></asp:TextBox>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Perfil Facebook:</span></div>
        <div class="grid_10">
            <asp:TextBox ID="txtPerfilFacebook" MaxLength="200" runat="server"></asp:TextBox>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Perfil Twitter:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtPerfilTwitter" MaxLength="200" runat="server"></asp:TextBox>
        </div>
        <div class="grid_2">
            <span class="label">Perfil Plus:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtPerfilPlus" MaxLength="200" runat="server"></asp:TextBox>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" Width="200px" OnClick="btnCadastrar_Click" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
    </div>
</asp:Content>
