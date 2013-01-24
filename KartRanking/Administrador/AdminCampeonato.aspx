<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="AdminCampeonato.aspx.cs" Inherits="KartRanking.Administrador.AdminCampeonato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $('#<%= txtDtInicio.ClientID %>, #<%= txtDtFim.ClientID %>').datepicker({
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
        <div class="grid_3">
            <span class="label">Nome Campeonato:</span>
        </div>
        <div class="grid_9">
            <asp:TextBox ID="txtNomeCampeonato" MaxLength="100" runat="server" CssClass="text"></asp:TextBox>
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_3">
            <span class="label">Dt. Inicio:</span>
        </div>
        <div class="grid_3">
            <asp:TextBox ID="txtDtInicio" MaxLength="12" runat="server" CssClass="text"></asp:TextBox>
        </div>
        <div class="grid_3">
            <span class="label">Dt. Fim:</span>
        </div>
        <div class="grid_3">
            <asp:TextBox ID="txtDtFim" MaxLength="12" runat="server" CssClass="text"></asp:TextBox>
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_3">
            <span class="label">Ativo?:</span>
        </div>
        <div class="grid_2">
            <asp:DropDownList ID="ddlAtivo" runat="server" CssClass="text">
                <asp:ListItem Selected="True" Text="Sim" Value="true" />
                <asp:ListItem Text="Não" Value="false" />
            </asp:DropDownList>
        </div>
        <div class="grid_7">
            &nbsp;
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_4">
            &nbsp;&nbsp;&nbsp;
        </div>
        <div class="grid_3">
            &nbsp;&nbsp;&nbsp;
        </div>
        <div class="grid_5" style="text-align: right;">
            &nbsp;<asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click"
                Width="100px" CssClass="button" />&nbsp;
            <asp:Button ID="btnNovo" runat="server" Text="Salvar" Width="100px" OnClick="btnNovo_Click"
                CssClass="button" />&nbsp; &nbsp;<asp:Button ID="btnEditar" runat="server" Text="Editar o Campeonato"
                    OnClick="btnEditar_Click" CssClass="button" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
    </div>
</asp:Content>
