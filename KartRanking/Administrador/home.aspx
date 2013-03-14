<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="home.aspx.cs" Inherits="KartRanking.Administrador.home" %>

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
            <b>Classificação dos Pilotos (Top 10)</b>
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
            <div style="width: 100%; height: 270px; border: solid 1px #dbddff;">
                &nbsp;
            </div>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_6">
            <b>Classificação das Equipes (Top 10)</b>
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
            <table width="100%" cellpadding="2" cellspacing="2" border="0">
                <tr>
                    <td rowspan="5" style="height: 170px; width: 150px;">
                        <asp:Image ID="ImgPerfil" Width="150px" Height="170px" runat="server" />
                    </td>
                    <td style="width: 50px;">
                        <b>Nome:</b>
                    </td>
                    <td style="min-width: 250px;" colspan="3">
                        <asp:Label ID="lbNome" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50px;">
                        <b>Equipe:</b>
                    </td>
                    <td>
                        <asp:Label ID="lbEquipe" runat="server" Text=""></asp:Label>
                    </td>
                    <td style="width: 50px;">
                        <b>Pontos:</b>
                    </td>
                    <td>
                        <asp:Label ID="lbPontos" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50px;">
                        <b>Nasicmento:</b>
                    </td>
                    <td colspan="3">
                        <asp:Label ID="lbData" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:LinkButton ID="lnkMaisInfo" runat="server" OnClick="lnkMaisInfo_Click">Mais informações do piloto</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
    </div>
</asp:Content>
