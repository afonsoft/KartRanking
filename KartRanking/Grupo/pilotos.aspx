<%@ Page Title="" Language="C#" MasterPageFile="~/Grupo/KartGrupo.master" AutoEventWireup="true"
    CodeBehind="pilotos.aspx.cs" Inherits="KartRanking.Grupo.pilotos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelPiloto" runat="server" Visible="true">
        <div class="page1 box maxheight" style="height: auto; min-height: 380px;">
            <div class="padding-box">
                <div class="indent-bot">
                    <h3 class="p2">
                        <img src="/Grupo/ImgTitleHandler.ashx?Text=Rank%20do%20Campeonato&f=44" alt="Campeonato" />
                    </h3>
                    <div style="font-size: 7pt; color: #FFF;">
                        <asp:Repeater ID="gvRankigCampeonato" runat="server">
                            <HeaderTemplate>
                                <table style="width: 100%; padding: 2px; text-align: left; border: 0px solid #000;">
                                    <thead>
                                        <tr>
                                            <th style="width: 30px;">
                                                <b>Pos</b>
                                            </th>
                                            <th style="width: auto;">
                                                <b>Nome</b>
                                            </th>
                                            <th style="width: 30px;">
                                                <b>Pontos</b>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 30px;">
                                        <span>
                                            <%# Container.ItemIndex + 1%></span>
                                    </td>
                                    <td style="width: auto;">
                                        <a href='/Grupo/pilotos.aspx?idUsuario=<%# Eval("idUsuario") %>&idGrupo=<%# Eval("idGrupo") %>&op=info'>
                                            <%# Eval("Nome") %></a>
                                    </td>
                                    <td style="width: 30px;">
                                        <span>
                                            <%# Eval("Pontos") %>
                                        </span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody> </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="border-bot">
                    </div>
                </div>
                <a href="/Grupo/index.aspx?idGrupo=<%= IdGrupo %>" class="button"><strong><strong>Voltar</strong></strong></a>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelEquipes" Visible="false" runat="server">
        <asp:HiddenField ID="HiddenFieldidEquipeCampeonato" runat="server" />
        <script type="text/javascript">
            function openInfoEquipe(id) {
                document.getElementById("<%= HiddenFieldidEquipeCampeonato.ClientID %>").value = id;
                alert(id);
            }
        </script>
        <asp:LinkButton ID="lnkOpenInfoEquipe" runat="server" OnClick="lnkOpenInfoEquipe_Click"></asp:LinkButton>
        <div class="page1 box maxheight" style="height: auto; min-height: 380px;">
            <div class="padding-box">
                <div class="indent-bot">
                    <h3 class="p2">
                        <img src="/Grupo/ImgTitleHandler.ashx?Text=Equipes%20do%20Campeonato&f=44" alt="Equipe" />
                    </h3>
                    <div style="font-size: 7pt; color: #FFF;">
                        <asp:Repeater ID="gvRankigEquipe" runat="server">
                            <HeaderTemplate>
                                <table style="width: 100%; padding: 1px; text-align: left; border: 0px solid #000;">
                                    <thead>
                                        <tr>
                                            <th style="width: 30px;">
                                                <b>Pos</b>
                                            </th>
                                            <th style="width: auto;">
                                                <b><a href="#" onclick='openInfoEquipe(<%# Eval("idEquipeCampeonato") %>);'>Equipe</a></b>
                                            </th>
                                            <th style="width: 40px;">
                                                <b>Sigla</b>
                                            </th>
                                            <th style="width: 30px;">
                                                <b>Pontos</b>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 30px;">
                                        <%# Container.ItemIndex  + 1 %>
                                    </td>
                                    <td style="width: auto;">
                                        <%# Eval("Equipe") %>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# Eval("Sigla") %>
                                    </td>
                                    <td style="width: 30px;">
                                        <%# Eval("Pontos") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody> </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="border-bot">
                    </div>
                </div>
                <a href="/Grupo/index.aspx?idGrupo=<%= IdGrupo %>" class="button"><strong><strong>Voltar</strong></strong></a>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelInfo" Visible="true" runat="server">
    </asp:Panel>
</asp:Content>
