<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="CalendarioProvas.aspx.cs" Inherits="KartRanking.Administrador.CalendarioProvas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelSelecionar" runat="server">
        <div class="container_12">
            <div class="grid_12">
                <h3 class="StepTitle">
                    Calendário do Campeonato</h3>
                <div class="StepSubTitle">
                    Informações e gerenciamento do calendário
                </div>
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
                <asp:Button ID="btnNovoCalendario" runat="server" Visible="false" Text="Administrar as Etapas"
                    OnClick="btnNovoCalendario_Click" />
                &nbsp; &nbsp;

            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
                <div class="template" itemscope itemtype="http://schema.org/Table">
                    <asp:GridView ID="gvEtapas" CssClass="gridview" runat="server" DataKeyNames="idCalendario"
                        EmptyDataText="Nenhuma prova neste campeonato" OnRowCommand="gvEtapas_RowCommand"
                        AutoGenerateColumns="false">
                        <Columns>
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
    </asp:Panel>
    <asp:Panel ID="PanelGridEtapa" runat="server">
        <script type="text/javascript">
            $(document).ready(function () {
                $('#<%= txtGridTempo.ClientID%>').mask("99:99:999");
                $('#<%= txtEtapaTempo.ClientID%>').mask("99:99:999");
                $('#<%= txtGridPos.ClientID%>').numeric(false);
                $('#<%= txtEtapaPontos.ClientID%>').numeric(false);
                $('#<%= txtEtapaPos.ClientID%>').numeric(false);
            });

            function OpenGrid(id, op) {
                document.getElementById('<%= HiddenIdGrid.ClientID %>').value = id;
                document.getElementById('<%= HiddenIdEtapa.ClientID %>').value = 0;
                document.getElementById('<%= HiddenFieldOpEdit.ClientID %>').value = op;

                $('#OpenGrid').dialog({
                    autoOpen: false, hide: 'explode', modal: false, show: 'slide',
                    buttons: {
                        "Salvar": function () {
                            $('#OpenGrid').dialog("close");
                            document.getElementById('<%= HiddenIdGridPiloto.ClientID %>').value = document.getElementById('<%= ddlGridPilotoDisponivel.ClientID %>').selectedIndex;
                            __doPostBack('<%= lnkAtualizaGridEtapa.UniqueID %>', '');
                            return true;
                        },
                        "Sair": function () { $('#OpenGrid').dialog("close"); return true; }
                    }
                });
                $('#OpenGrid').dialog({ width: 550, height: 220 });
                $('#OpenGrid').parent().appendTo($("form:first"));
                $('#OpenGrid').dialog('open');
                return true;
            }

            function OpenEtapa(id, op) {
                document.getElementById('<%= HiddenIdEtapa.ClientID %>').value = id;
                document.getElementById('<%= HiddenIdGrid.ClientID %>').value = 0;
                document.getElementById('<%= HiddenFieldOpEdit.ClientID %>').value = op;

                $('#OpenEtapa').dialog({
                    autoOpen: false, hide: 'explode', modal: false, show: 'slide',
                    buttons: {
                        "Salvar": function () {
                            $('#OpenEtapa').dialog("close");
                            document.getElementById('<%= HiddenIdEtapaPiloto.ClientID %>').value = document.getElementById('<%= ddlEtapaPilotoDisponivel.ClientID %>').selectedIndex;
                            __doPostBack('<%= lnkAtualizaGridEtapa.UniqueID %>', '');
                            return true;
                        },
                        "Sair": function () { $('#OpenEtapa').dialog("close"); return true; }
                    }
                });
                $('#OpenEtapa').dialog({ width: 600, height: 220 });
                $('#OpenEtapa').parent().appendTo($("form:first"));
                $('#OpenEtapa').dialog('open');
                return true;
            }
            
        </script>
        <div class="container_12">
            <div class="grid_12">
                <h3 class="StepTitle">
                    Calendário do Campeonato</h3>
                <div class="StepSubTitle">
                    Informações e gerenciamento do calendário
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_3">
                <span class="label">Calendario Selecionado:</span>
            </div>
            <div class="grid_9">
                <asp:Label ID="lbCalendarioSelecionado" runat="server" Text="Teste"></asp:Label>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12" style="text-align: right;">
                <asp:Button ID="BtnVoltarSelecionar" runat="server" Text="Voltar" OnClick="BtnVoltarSelecionar_Click" />
                &nbsp; &nbsp;
            </div>
            <div class="clear">
                &nbsp;
            </div>
            <div class="grid_1" style="text-align: right;">
                &nbsp;<asp:ImageButton ID="imgAdd1" runat="server" CommandArgument="1" ImageUrl="~/images/add.png"
                    Width="16px" Height="16px" OnClick="imgAdd_Click" />
            </div>
            <div class="grid_11">
                <span class="label"><b>Grid de qualificação</b></span>
            </div>
            <div class="clear">
                &nbsp;
            </div>
            <div class="grid_12">
                <div class="template" itemscope itemtype="http://schema.org/Table">
                    <asp:GridView ID="gvGrid" CssClass="gridview" runat="server" EmptyDataText="Nenhum resultado de classificação"
                        DataKeyNames="idGrid, idCalendario" AutoGenerateColumns="false" OnRowCommand="gvGrid_RowCommand"
                        OnRowCreated="gvGrids_RowCreated">
                        <Columns>
                            <asp:BoundField HeaderText="Pos" DataField="Pos" />
                            <asp:BoundField HeaderText="Nome Piloto" DataField="Nome" />
                            <asp:BoundField HeaderText="Nome Equipe" DataField="NomeEquipe" />
                            <asp:BoundField HeaderText="Tempo" DataField="tempo" />
                            <asp:TemplateField Visible="true">
                                <HeaderTemplate>
                                    Opções</HeaderTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="80px" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkExluir" CommandArgument='<%# Eval("idGrid") %>' CommandName="Exluir"
                                        OnClientClick="return confirm('Deseja excluir?');" runat="server">Exluir</asp:LinkButton>&nbsp;|&nbsp;
                                    <asp:LinkButton ID="lnkAlterar" CommandArgument='<%# Eval("idGrid") %>' CommandName="Alterar"
                                        runat="server">Alterar</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_1" style="text-align: right;">
                &nbsp;<asp:ImageButton ID="imgAdd2" runat="server" CommandArgument="2" ImageUrl="~/images/add.png"
                    Width="16px" Height="16px" OnClick="imgAdd_Click" />
            </div>
            <div class="grid_11">
                <span class="label"><b>Grid Final da Etapa</b></span>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
                <div class="template" itemscope itemtype="http://schema.org/Table">
                    <asp:GridView ID="gvResultados" CssClass="gridview" runat="server" EmptyDataText="Nenhum resultado final"
                        DataKeyNames="idResultado, idCalendario" AutoGenerateColumns="false" OnRowCommand="gvResultados_RowCommand"
                        OnRowCreated="gvResultados_RowCreated">
                        <Columns>
                            <asp:BoundField HeaderText="Pos" DataField="Pos" />
                            <asp:BoundField HeaderText="Nome Piloto" DataField="Nome" />
                            <asp:BoundField HeaderText="Nome Equipe" DataField="NomeEquipe" />
                            <asp:BoundField HeaderText="Tempo" DataField="tempo" />
                            <asp:BoundField HeaderText="Ponto" DataField="Ponto" />
                            <asp:TemplateField Visible="true">
                                <HeaderTemplate>
                                    Opções</HeaderTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="80px" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkExluir" CommandArgument='<%# Eval("idResultado") %>' CommandName="Exluir"
                                        OnClientClick="return confirm('Deseja excluir?');" runat="server">Exluir</asp:LinkButton>&nbsp;|&nbsp;
                                    <asp:LinkButton ID="lnkAlterar" CommandArgument='<%# Eval("idResultado") %>' CommandName="Alterar"
                                        runat="server">Alterar</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="clear">
                &nbsp;
            </div>
        </div>
        <div style="display: none;">
            <asp:HiddenField ID="HiddenFieldOpEdit" runat="server" />
            <asp:LinkButton ID="lnkAtualizaGridEtapa" runat="server" OnClick="lnkAtualizaGridEtapa_Click"></asp:LinkButton>
        </div>
        <div id="OpenGrid" title="Grid qualificação" style="display: none; font-size: x-small;
            color: Black; font-family: Verdana; font-style: normal; font-weight: normal;"
            class="ui-dialog ui-resizable-handle">
            <dl>
                <dt><b>Grid Qualificação</b></dt>
                <dd>
                    <table width="98%">
                        <tr>
                            <td>
                                Posição
                            </td>
                            <td>
                                Piloto
                            </td>
                            <td>
                                Tempo
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtGridPos" MaxLength="2" Width="50px" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlGridPilotoDisponivel" Width="250px" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGridTempo" MaxLength="10" Width="100px" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField ID="HiddenIdGrid" runat="server" />
                    <asp:HiddenField ID="HiddenIdGridPiloto" runat="server" />
                </dd>
            </dl>
        </div>
        <div id="OpenEtapa" title="Qualificação Final" style="display: none; font-size: x-small;
            color: Black; font-family: Verdana; font-style: normal; font-weight: normal;"
            class="ui-dialog ui-resizable-handle">
            <dl>
                <dt><b>Grid Final da Etapa</b></dt>
                <dd>
                    <table width="98%">
                        <tr>
                            <td>
                                Posição
                            </td>
                            <td>
                                Piloto
                            </td>
                            <td>
                                Tempo
                            </td>
                            <td>
                                Pontos
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtEtapaPos" MaxLength="2" runat="server" Width="50px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEtapaPilotoDisponivel" Width="250px" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEtapaTempo" MaxLength="10" Width="100px" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEtapaPontos" MaxLength="3" Width="50px" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField ID="HiddenIdEtapa" runat="server" />
                    <asp:HiddenField ID="HiddenIdEtapaPiloto" runat="server" />
                </dd>
            </dl>
        </div>
    </asp:Panel>
</asp:Content>
