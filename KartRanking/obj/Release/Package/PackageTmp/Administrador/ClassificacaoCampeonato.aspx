<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="ClassificacaoCampeonato.aspx.cs" Inherits="KartRanking.Administrador.ClassificacaoCampeonato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelPilotos" runat="server">
        <div class="container_12">
            <div class="grid_12">
                <h3 class="StepTitle">
                    Classificação dos Pilotos</h3>
                <div class="StepSubTitle">
                    Classificações dos pilotos deste campeonato
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_3">
                <span class="label">Campeonato Selecionado:</span>
            </div>
            <div class="grid_9">
                <asp:DropDownList ID="ddlCampeonatos1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCampeonatos_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
                <div class="template">
                    <asp:GridView ID="gvRankigCampeonato" CssClass="gridview" runat="server" DataKeyNames="idUsuario"
                        EmptyDataText="Nenhuma pontuação encontrada." AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Pos
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <span>
                                        <%# Container.DataItemIndex + 1 %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Nome
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <a href='perfil.aspx?idUsuario=<%# Eval("idUsuario") %>&Edit=false&idGrupo=<%# Eval("idGrupo") %>'>
                                        <%# Eval("Nome") %></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Pontos" SortExpression="Pontos" DataField="Pontos" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelEquipes" runat="server">
        <div class="container_12">
            <div class="grid_12">
                <h3 class="StepTitle">
                    Classificação das Equipes</h3>
                <div class="StepSubTitle">
                    Classificações das equipes deste campeonato
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_3">
                <span class="label">Campeonato Selecionado:</span>
            </div>
            <div class="grid_9">
                <asp:DropDownList ID="ddlCampeonatos2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCampeonatos_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
                <div class="template">
                    <asp:GridView ID="gvRankigEquipe" CssClass="gridview" runat="server" DataKeyNames="idEquipeCampeonato"
                        EmptyDataText="Nenhuma pontuação encontrada." AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Pos
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <span>
                                        <%# Container.DataItemIndex + 1 %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Equipe" SortExpression="Equipe" DataField="Equipe" />
                            <asp:BoundField HeaderText="Sigla" SortExpression="Sigla" DataField="Sigla" />
                            <asp:BoundField HeaderText="Pontos" SortExpression="Pontos" DataField="Pontos" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
        </div>
    </asp:Panel>
</asp:Content>
