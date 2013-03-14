<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="index.aspx.cs" Inherits="KartRanking.Administrador.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <div class="container_12">
        <div class="grid_12">
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_6">
            <b>Classificação dos Pilotos</b>
        </div>
        <div class="grid_6">
            <b>Noticias do grupo</b>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_6">
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
        <div class="grid_6">
            &nbsp; a</div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_6">
            <b>Classificação das Equipes</b>
        </div>
        <div class="grid_6">
            <b>Piloto em Destaque</b>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_6">
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
        <div class="grid_6">
            &nbsp; b</div>
    </div>
</asp:Content>
