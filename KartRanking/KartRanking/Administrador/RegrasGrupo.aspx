<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="RegrasGrupo.aspx.cs" Inherits="KartRanking.Administrador.RegrasGrupo"
    ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <link href="/css/jquery-te-1.3.3.css" rel="stylesheet" type="text/css" />
    <script src="/js/jquery-te-1.3.3.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <table width="97%" cellpadding="2" cellspacing="2" border="0">
        <tr>
            <td colspan="6">
                <h3 class="StepTitle">
                    Informações / Regras</h3>
                <div class="StepSubTitle">
                    Informções ou regras para o grupo.
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:TextBox ID="textarea" runat="server" TextMode="MultiLine" Style="width: 100%;
                    height: 600px;" Rows="400" Columns="100" CssClass="jqte"></asp:TextBox>
                <div id="ExibirRegras" runat="server" style="width: 100%; height: 600px;">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: right;">
                <asp:CheckBox ID="chkEnviarTodosUsuarios" runat="server" Text="Enviar e-mail de alterações a todos os usuários deste grupo?" />
            </td>
            <td colspan="1" style="text-align: right; width:100px;">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $('.jqte').jqte();
    </script>
</asp:Content>
