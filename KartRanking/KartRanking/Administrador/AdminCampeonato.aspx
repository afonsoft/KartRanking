<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="AdminCampeonato.aspx.cs" Inherits="KartRanking.Administrador.AdminCampeonato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
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
            <h3 class="StepTitle">
                <asp:Literal ID="ltTitulo" runat="server"></asp:Literal></h3>
            <div class="StepSubTitle">
                <asp:Literal ID="ltDescricao" runat="server"></asp:Literal>
            </div>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_3">
            <span class="label">Nome Campeonato:</span>
        </div>
        <div class="grid_9">
            <asp:TextBox ID="txtNomeCampeonato" MaxLength="100" runat="server" CssClass="text"></asp:TextBox>
        </div>
        <div class="clear espaco_mini">
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
        <div class="clear espaco_mini">
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
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_3">
            &nbsp;&nbsp;&nbsp;
        </div>
        <div class="grid_2">
            &nbsp;
        </div>
        <div class="grid_7" style="text-align: right;">
            &nbsp;<asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click"
                Width="100px" CssClass="button" />&nbsp;
            <asp:Button ID="btnNovo" runat="server" Text="Novo" Width="100px" OnClick="btnNovo_Click"
                CssClass="button" />&nbsp; &nbsp;<asp:Button ID="btnEditar" runat="server" Text="Editar o Campeonato"
                    OnClick="btnEditar_Click" CssClass="button" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <span class="label">Calendario de Provas</span>
        </div>
        <div class="clear">
            &nbsp;
        </div>
        <div class="grid_12">
            <div class="template" itemscope itemtype="http://schema.org/Table">
                <asp:GridView ID="gvEtapas" CssClass="gridview" runat="server" DataKeyNames="idCalendario"
                    EmptyDataText="Nenhum campeonato neste grupo" OnRowCommand="gvEtapas_RowCommand"
                    AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Código</HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkCodCalendario" runat="server" CommandArgument='<%# Eval( "idCalendario" )%>'
                                    CommandName="EditCalendario"><%# Eval("idCalendario")%></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Nome</HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkNomeCalendario" runat="server" CommandArgument='<%# Eval( "idCalendario" )%>'
                                    CommandName="EditCalendario"><%# Eval("Nome")%></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Data" SortExpression="Data" DataField="Data" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField HeaderText="Kartodromo" SortExpression="Kartodromo" DataField="Kartodromo" />
                        <asp:BoundField HeaderText="Horario" SortExpression="Horario" DataField="Horario" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
    </div>
</asp:Content>
