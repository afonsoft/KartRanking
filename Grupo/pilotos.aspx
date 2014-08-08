<%@ Page Title="" Language="C#" MasterPageFile="~/Grupo/KartGrupo.master" AutoEventWireup="true"
    CodeBehind="pilotos.aspx.cs" Inherits="KartRanking.Grupo.pilotos" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelPiloto" runat="server" Visible="true">

        <script type="text/javascript">
            function openInfo(idDiv) {
                $(".ocultar").slideUp();
                if ($("#" + idDiv).is(":hidden")) {
                    $("#" + idDiv).slideDown();
                } else {
                    $("#" + idDiv).slideUp();
                }
            }
        </script>

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
                                            <th style="width: 20px;">
                                                <b>Pos</b>
                                            </th>
                                            <th style="width: auto;">
                                                <b>Nome</b>
                                            </th>
                                            <th style="width: 40px;">
                                                <b>Estatistica</b>
                                            </th>
                                            <th style="width: 35px;">
                                                <b>Pontos</b>
                                            </th>
                                            <th style="width: 30px;">
                                                <b>P.1</b>
                                            </th>
                                            <th style="width: 30px;">
                                                <b>P.2</b>
                                            </th>
                                            <th style="width: 30px;">
                                                <b>P.3</b>
                                            </th>
                                            <th style="width: 35px;">
                                                <b>Voltas</b>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 20px;">
                                        <span>
                                            <%# Container.ItemIndex + 1%></span>
                                    </td>
                                    <td style="width: auto;">
                                        <a href='/<%= UrlGrupo %>/pilotos/info/<%# Eval("idUsuario") %>'>
                                            <%# Eval("Nome") %></a>
                                    </td>
                                    <td style="width: 40px;">
                                        <a href="#" onclick="openInfo('Info_<%# Container.ItemIndex + 1%>');">Info</a>
                                    </td>
                                    <td style="width: 35px; text-align: center;">
                                        <span>
                                            <%# Eval("pontos") %>
                                        </span>
                                    </td>
                                    <td style="width: 30px; text-align: center;">
                                        <span>
                                            <%# Eval("Pos_1") %>
                                        </span>
                                    </td>
                                    <td style="width: 30px; text-align: center;">
                                        <span>
                                            <%# Eval("Pos_2") %>
                                        </span>
                                    </td>
                                    <td style="width: 30px; text-align: center;">
                                        <span>
                                            <%# Eval("Pos_3") %>
                                        </span>
                                    </td>
                                    <td style="width: 30px; text-align: right;">
                                        <span>
                                            <%# Eval("voltas") %>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8">
                                        <div id='Info_<%# Container.ItemIndex + 1%>' class="ocultar" style="display: none; width: 100%">
                                            <div class="container_12" style="margin-right: 1%; margin-left: 1%; width: 100%;">
                                                <div class="grid_6">
                                                    <span class="label" style="font-size: 8pt; color: red;">Podios</span><br />
                                                    <asp:Chart ID="ChartTotalPontosCampeonato" EnableViewState="false" BackColor="Transparent" runat="server" DataSource='<%# Eval("lstPontos") %>' Width="430px" Height="200px">
                                                        <Series>
                                                            <asp:Series Name="SeriesDataPodios" XValueMember="text" YValueMembers="value" ChartArea="chrtAreaTotalPodios" Color="Red" XValueType="String" YValueType="Int32" ChartType="Column"></asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="chrtAreaTotalPodios" BackColor="Transparent">
                                                                <AxisY LineColor="White" Title="Qts. Vezes" IsReversed="true" Interval="1" TitleForeColor="White">
                                                                    <LabelStyle Font="Trebuchet MS, 8pt" ForeColor="White" />
                                                                    <MajorGrid LineColor="#e6e6e6" />
                                                                    <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                                </AxisY>
                                                                <AxisX LineColor="White" Title="Posições" Interval="1" TitleForeColor="White">
                                                                    <LabelStyle Font="Trebuchet MS, 8pt" ForeColor="White" />
                                                                    <MajorGrid LineColor="#e6e6e6" />
                                                                    <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                                </AxisX>
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                </div>
                                                <div class="grid_6">
                                                    <span class="label" style="font-size: 8pt; color: red;">Pontos das 10 Etapas</span><br />
                                                    <asp:Chart ID="ChartTotalPodioCampeonato" runat="server" EnableViewState="false" DataSource='<%# Eval("lstPodios") %>' BackColor="Transparent" Width="450px" Height="200px">
                                                        <Series>
                                                            <asp:Series Name="SeriesDataPodios" XValueMember="text" YValueMembers="value" ChartArea="chrtAreaTotalPodios" Color="Red" XValueType="String" YValueType="Int32" ChartType="Line"></asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="chrtAreaTotalPodios" BackColor="Transparent">
                                                                <AxisY LineColor="White" Title="Posição" IsReversed="true" Minimum="1" Maximum="10" Interval="1" TitleForeColor="White">
                                                                    <LabelStyle Font="Trebuchet MS, 8pt" ForeColor="White" />
                                                                    <MajorGrid LineColor="#e6e6e6" />
                                                                    <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                                </AxisY>
                                                                <AxisX LineColor="White" Title="Etapas" Interval="1" TitleForeColor="White">
                                                                    <LabelStyle Font="Trebuchet MS, 8pt" ForeColor="White" />
                                                                    <MajorGrid LineColor="#e6e6e6" />
                                                                    <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                                </AxisX>
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                </div>
                                                <div class="clear">&nbsp;</div>
                                            </div>
                                        </div>
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
                <a href="/<%= UrlGrupo %>" class="button"><strong><strong>Voltar</strong></strong></a>
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
                                                <b>Equipe</b>
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
                                        <a href="#" onclick='openInfoEquipe(<%# Eval("idEquipeCampeonato") %>);'>
                                            <%# Eval("Equipe") %></a>
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
                <a href="/<%= UrlGrupo %>" class="button"><strong><strong>Voltar</strong></strong></a>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelInfo" Visible="true" runat="server">
        <div class="page1 box maxheight" style="height: auto; min-height: 380px;">
            <div class="padding-box">
                <div class="indent-bot">
                    <h3 class="p2">
                        <img src="/Grupo/ImgTitleHandler.ashx?Text=Piloto&f=44" alt="Equipe" />
                    </h3>
                    <div style="font-size: 7pt; color: #FFF;">
                        <div class="container_12">
                            <div class="grid_3">
                                <div class="container_12">
                                    <div class="grid_12">
                                        <img src="/Administrador/ImageHandler.ashx?id=<%= id %>" width="150px" height="170px"
                                            alt="Foto" />
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                            <div class="grid_5">
                                <div class="container_12" style="margin-right: 0px; margin-left: 0px; width: 100%;">
                                    <div class="grid_12">
                                        <span class="label" style="font-size: 10pt;"><strong>Informações</strong></span>
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Nome:</span><asp:HiddenField ID="IdUsuario" runat="server" />
                                    </div>
                                    <div class="grid_10">
                                        <asp:Label ID="txtNome" runat="server" CssClass="label"></asp:Label>
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Nasc:</span>
                                    </div>
                                    <div class="grid_3">
                                        <asp:Label ID="txtDtNascimento" runat="server" CssClass="label"></asp:Label>
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Apelido:</span>
                                    </div>
                                    <div class="grid_5">
                                        <asp:Label ID="txtApelido" runat="server" CssClass="label"></asp:Label>
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Peso:</span>
                                    </div>
                                    <div class="grid_3">
                                        <asp:Label ID="txtPeso" runat="server" CssClass="label"></asp:Label>
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Sexo:</span>
                                    </div>
                                    <div class="grid_5">
                                        <asp:Label ID="lbSexo" runat="server" CssClass="label"></asp:Label>
                                        <div style="display: none;">
                                            <asp:DropDownList ID="ddlSexo" runat="server" CssClass="label">
                                                <asp:ListItem Text="Masculino" Value="M" />
                                                <asp:ListItem Text="Feminino" Value="F" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Altura:</span>
                                    </div>
                                    <div class="grid_3">
                                        <asp:Label ID="txtAltura" runat="server"
                                            CssClass="label"></asp:Label>
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Estado:</span>
                                    </div>
                                    <div class="grid_5">
                                        <asp:Label ID="lbEstado" runat="server" CssClass="label"></asp:Label>
                                        <div style="display: none;">
                                            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="label">
                                                <asp:ListItem Text="Acre (AC)" Value="AC" />
                                                <asp:ListItem Text="Alagoas (AL)" Value="AL" />
                                                <asp:ListItem Text="Amapá (AP)" Value="AP" />
                                                <asp:ListItem Text="Amazonas (AM)" Value="AM" />
                                                <asp:ListItem Text="Bahia (BA)" Value="BA" />
                                                <asp:ListItem Text="Ceará (CE)" Value="CE" />
                                                <asp:ListItem Text="Distrito Federal (DF)" Value="DF" />
                                                <asp:ListItem Text="Espírito Santo (ES)" Value="ES" />
                                                <asp:ListItem Text="Goiás (GO)" Value="GO" />
                                                <asp:ListItem Text="Maranhão (MA)" Value="MA" />
                                                <asp:ListItem Text="Mato Grosso (MT)" Value="MT" />
                                                <asp:ListItem Text="Mato Grosso do Sul (MS)" Value="MS" />
                                                <asp:ListItem Text="Minas Gerais (MG)" Value="MG" />
                                                <asp:ListItem Text="Pará (PA)" Value="PA" />
                                                <asp:ListItem Text="Paraíba (PB)" Value="PB" />
                                                <asp:ListItem Text="Paraná (PR)" Value="PR" />
                                                <asp:ListItem Text="Pernambuco (PE)" Value="PE" />
                                                <asp:ListItem Text="Piauí (PI)" Value="PI" />
                                                <asp:ListItem Text="Rio de Janeiro (RJ)" Value="RJ" />
                                                <asp:ListItem Text="Rio Grande do Norte (RN)" Value="RN" />
                                                <asp:ListItem Text="Rio Grande do Sul (RS)" Value="RS" />
                                                <asp:ListItem Text="Rondônia (RO)" Value="RO" />
                                                <asp:ListItem Text="Roraima (RR)" Value="RR" />
                                                <asp:ListItem Text="Santa Catarina (SC)" Value="SC" />
                                                <asp:ListItem Text="São Paulo (SP)" Value="SP" />
                                                <asp:ListItem Text="Sergipe (SE)" Value="SE" />
                                                <asp:ListItem Text="Tocantins (TO)" Value="TO" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                            <div class="grid_4">
                                <span class="label" style="font-size: 10pt;"><strong>Estatistica deste Campeonato</strong></span>
                                <table width="100%" cellpadding="3" cellspacing="3">
                                    <tr>
                                        <td class="label"><span class="label"><strong>N.º Provas:</strong></span></td>
                                        <td class="label">
                                            <asp:Label runat="server" ID="lbNprovas" CssClass="label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="label"><span class="label"><strong>N.º Vitórias:</strong></span></td>
                                        <td class="label">
                                            <asp:Label runat="server" CssClass="label" ID="lbNvitorias"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="label"><span class="label"><strong>N.º Pódios:</strong></span></td>
                                        <td class="label">
                                            <asp:Label runat="server" ID="lbNpodios" CssClass="label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="label"><span class="label"><strong>N.º Poles:</strong></span></td>
                                        <td class="label">
                                            <asp:Label runat="server" ID="lbNpoles" CssClass="label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="label"><span class="label"><strong>N.º Pontos:</strong></span></td>
                                        <td class="label">
                                            <asp:Label runat="server" ID="lbNpontos" CssClass="label"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="clear espaco_mini">
                                &nbsp;
                            </div>
                            <div class="grid_12">
                                <div class="container_12" style="margin-right: 0px; margin-left: 0px; width: 100%;">
                                    <div class="grid_12">
                                        <span class="label" style="font-size: 10pt;"><strong>Estatisticas</strong></span>
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                    <div class="grid_6">
                                        <span class="label" style="font-size: 8pt;">Este Campeonato</span><br />
                                        <asp:Chart ID="ChartTotalCampeonato" runat="server" Width="400px" Height="200px">
                                            <Series>
                                                <asp:Series Name="SeriesDataPodios" ChartArea="chrtAreaTotalPodios" Color="Red" XValueType="String" YValueType="Int32" ChartType="Column"></asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="chrtAreaTotalPodios">
                                                    <AxisY LineColor="White" Title="Qts. Vezes" Interval="1">
                                                        <LabelStyle Font="Trebuchet MS, 8pt" />
                                                        <MajorGrid LineColor="#e6e6e6" />
                                                        <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                    </AxisY>
                                                    <AxisX LineColor="White" Title="Posições" Interval="1">
                                                        <LabelStyle Font="Trebuchet MS, 8pt" />
                                                        <MajorGrid LineColor="#e6e6e6" />
                                                        <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                    </AxisX>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                    <div class="grid_6">
                                        <span class="label" style="font-size: 8pt;">Histórico Geral</span><br />
                                        <asp:Chart ID="ChartTotalHistorico" runat="server" Width="400px" Height="200px">
                                            <Series>
                                                <asp:Series Name="SeriesDataPodios" ChartArea="chrtAreaTotalPodios" Color="Red" XValueType="String" YValueType="Int32" ChartType="Column"></asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="chrtAreaTotalPodios">
                                                    <AxisY LineColor="White" Title="Qts. Vezes" Interval="1">
                                                        <LabelStyle Font="Trebuchet MS, 8pt" />
                                                        <MajorGrid LineColor="#e6e6e6" />
                                                        <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                    </AxisY>
                                                    <AxisX LineColor="White" Title="Posições" Interval="1">
                                                        <LabelStyle Font="Trebuchet MS, 8pt" />
                                                        <MajorGrid LineColor="#e6e6e6" />
                                                        <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                    </AxisX>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                    <div class="grid_9">
                                        <span class="label" style="font-size: 8pt;">Posição nas Etapas</span><br />
                                        <asp:Chart ID="ChartTotalPodioCampeonato" runat="server" EnableViewState="false" Width="600px" Height="200px">
                                            <Series>
                                                <asp:Series Name="SeriesDataPodios" XValueMember="text" YValueMembers="value" ChartArea="chrtAreaTotalPodios" Color="Red" XValueType="String" YValueType="Int32" ChartType="Line"></asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="chrtAreaTotalPodios">
                                                    <AxisY LineColor="White" Title="Posição" IsReversed="true" Minimum="1" Maximum="10" Interval="1">
                                                        <LabelStyle Font="Trebuchet MS, 8pt" />
                                                        <MajorGrid LineColor="#e6e6e6" />
                                                        <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                    </AxisY>
                                                    <AxisX LineColor="White" Title="Etapas" Interval="1">
                                                        <LabelStyle Font="Trebuchet MS, 8pt" />
                                                        <MajorGrid LineColor="#e6e6e6" />
                                                        <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                    </AxisX>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                    <div class="grid_3">
                                        <span class="label" style="font-size: 8pt;">Grid neste Campeonato</span><br />
                                        <asp:Chart ID="ChartTotalPolesCampeonato" runat="server" EnableViewState="false" Width="190px" Height="200px">
                                            <Series>
                                                <asp:Series Name="SeriesDataPodios" XValueMember="text" YValueMembers="value" ChartArea="chrtAreaTotalPodios" Color="Red" XValueType="String" YValueType="Int32" ChartType="Column"></asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="chrtAreaTotalPodios">
                                                    <AxisY LineColor="White" Title="Qts. Vezes" IsReversed="true" Minimum="0" Interval="1">
                                                        <LabelStyle Font="Trebuchet MS, 8pt" />
                                                        <MajorGrid LineColor="#e6e6e6" />
                                                        <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                    </AxisY>
                                                      <AxisX LineColor="White" Title="Grid Posições" Interval="1">
                                                        <LabelStyle Font="Trebuchet MS, 8pt" />
                                                        <MajorGrid LineColor="#e6e6e6" />
                                                        <MinorGrid Enabled="false" LineColor="#e6e6e6" />
                                                    </AxisX>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                </div>
                            </div>
                            <div class="clear espaco_mini">
                                &nbsp;
                            </div>
                        </div>
                    </div>
                    <div class="border-bot">
                    </div>
                </div>
                <a href="/<%= UrlGrupo %>/pilotos" class="button"><strong><strong>Voltar</strong></strong></a>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
