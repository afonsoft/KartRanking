<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="AdminCalendarioProvas.aspx.cs" Inherits="KartRanking.Administrador.AdminCalendarioProvas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelSelecionar" runat="server">
        <div class="container_12">
            <div class="grid_12">
                <h3 class="titulo">
                    Calendário do Campeonato</h3>
                <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                    Informações e gerenciamento do calendário</p>
                <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                    border-right: #ccc 1px dashed;" />
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_3">
                <span class="label">Campeonato Selecionado:</span>
            </div>
            <div class="grid_9">
                <asp:DropDownList ID="ddlCampeonatos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCampeonatos_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
                <asp:Button ID="btnVoltarCampeonato" runat="server" Text="Voltar" OnClick="btnVoltarCampeonato_Click" />&nbsp;
                &nbsp;
                <asp:Button ID="btnNovoCalendario" runat="server" Text="Nova Etapa" OnClick="btnNovoCalendario_Click" />
                &nbsp; &nbsp;
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
                <div class="template">
                    <asp:GridView ID="gvEtapas" CssClass="gridview" runat="server" DataKeyNames="idCalendario"
                        EmptyDataText="Nenhuma prova neste campeonato" OnRowCommand="gvEtapas_RowCommand"
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
                                        CommandName="ViewCalendario"><%# Eval("Nome")%></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Data" SortExpression="Data" DataField="Data" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField HeaderText="Kartodromo" SortExpression="Kartodromo" DataField="Kartodromo" />
                            <asp:BoundField HeaderText="Horario" SortExpression="Horario" DataField="Horario" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Editar</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbntEditar" ImageUrl="~/images/Edit16px.png" Height="16px"
                                        Width="16px" runat="server" ToolTip="Editar esta Etapa do Campeonato" CommandArgument='<%# Eval( "idCalendario" )%>'
                                        CommandName="EditCalendario"  />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Excluir</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbntExcluir" ImageUrl="~/images/delete16px.png" Height="16px"
                                        Width="16px" runat="server" ToolTip="Excluir esta Etapa do Campeonato" CommandArgument='<%# Eval( "idCalendario" )%>'
                                        CommandName="ExcluirCalendario" OnClientClick="return confirm('Deseja excluir este grupo e todos os seus apontamentos?\n\nAo excluir, serão excluido os seguintes itens:\n*Grid desta Etapa\n*Resultado desta Etapa\n\nNão será possivel recuperar os valores após a exclusão.');" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelEditar" runat="server">

        <script type="text/javascript">
            $(document).ready(function() {
                $('#<%= ltData.ClientID %>').datepicker({
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

                $('#<%= ltHora.ClientID %>').mask("99:99");
            });
        </script>

        <div class="container_12">
            <div class="grid_12">
                <h3 class="titulo">
                    Editção / Cadastro de um Calendário</h3>
                <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                    Informações e gerenciamento do calendário</p>
                <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                    border-right: #ccc 1px dashed;" />
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_2">
                <span class="label">Etapa:</span>
            </div>
            <div class="grid_4">
                <asp:TextBox ID="ltEtapa" runat="server" MaxLength="20" Width="100%"></asp:TextBox>
            </div>
            <div class="grid_2">
                <span class="label">Data / Horário:</span>
            </div>
            <div class="grid_4">
                <asp:TextBox ID="ltData" runat="server" MaxLength="10" Width="100px"></asp:TextBox>&nbsp;
                <asp:TextBox ID="ltHora" runat="server" MaxLength="8" Width="50px"></asp:TextBox>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_2">
                <span class="label">Kartódromo:</span>
            </div>
            <div class="grid_4">
                <asp:TextBox ID="ltKartodromo" runat="server" MaxLength="150" Width="100%"></asp:TextBox>
            </div>
            <div class="grid_2">
                <span class="label">Circuito:</span>
            </div>
            <div class="grid_4">
                <asp:TextBox ID="ltCircuito" runat="server" MaxLength="20" Width="100%"></asp:TextBox>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_4">
                &nbsp;</div>
            <div class="grid_8" style="text-align: right;">
                &nbsp;
                <asp:Button ID="btnAlterar" runat="server" Text="Salvar" OnClick="btnAlterar_Click" />&nbsp;
                &nbsp;
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" OnClick="btnVoltar_Click" />
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
        </div>
    </asp:Panel>
</asp:Content>
