<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="CalendarioProvas.aspx.cs" Inherits="KartRanking.Administrador.CalendarioProvas" %>

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
                <asp:Button ID="btnNovoCalendario" runat="server" Visible="false" Text="Nova Etapa"
                    OnClick="btnNovoCalendario_Click" />
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
                <span class="label">Calendario Selecionado:</span>
            </div>
            <div class="grid_9">
                <asp:Label ID="lbCalendarioSelecionado" runat="server" Text="Teste"></asp:Label>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12" >
                <asp:Button ID="BtnVoltarSelecionar" runat="server" Text="Voltar" OnClick="BtnVoltarSelecionar_Click" />
                &nbsp; &nbsp;
            </div>
            <div class="clear">
                &nbsp;
            </div>
            <div class="grid_10">
                <span class="label"><b>Grid de qualificação</b></span>
            </div>
            <div class="grid_2" style="text-align: right;">
                &nbsp;<asp:Button ID="btnEditarGrid" runat="server" Text="Editar" Visible="false" OnClick="btnEditarGrid_Click" />
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
                <div class="template">
                    <asp:GridView ID="gvGrid" CssClass="gridview" runat="server" EmptyDataText="Nenhum resultado de classificação"
                        DataKeyNames="idGrid, idCalendario" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="Pos" DataField="Pos" />
                            <asp:BoundField HeaderText="Nome Piloto" DataField="Nome" />
                            <asp:BoundField HeaderText="Nome Equipe" DataField="NomeEquipe" />
                            <asp:BoundField HeaderText="Tempo" DataField="tempo" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_10">
                <span class="label"><b>Grid Final da Etapa</b></span>
            </div>
            <div class="grid_2" style="text-align: right;">
                &nbsp;&nbsp;<asp:Button ID="btnEditResultado" runat="server" Text="Editar" Visible="false" OnClick="btnEditResultado_Click" />
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
                <div class="template">
                    <asp:GridView ID="gvResultados" CssClass="gridview" runat="server" EmptyDataText="Nenhum resultado final"
                        DataKeyNames="idResultado, idCalendario" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="Pos" DataField="Pos" />
                            <asp:BoundField HeaderText="Nome Piloto" DataField="Nome" />
                            <asp:BoundField HeaderText="Nome Equipe" DataField="NomeEquipe" />
                            <asp:BoundField HeaderText="Tempo" DataField="tempo" />
                            <asp:BoundField HeaderText="Ponto" DataField="Ponto" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="clear">
                &nbsp;
            </div>
        </div>
    </asp:Panel>
</asp:Content>
