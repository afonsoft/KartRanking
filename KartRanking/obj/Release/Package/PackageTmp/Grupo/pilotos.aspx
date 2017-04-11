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
                                        <a href='/<%= UrlGrupo %>/pilotos/info/<%# Eval("idUsuario") %>'>
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
                                        <img src="/Administrador/ImageHandler.ashx?id=<%= Id %>" width="150px" height="170px"
                                            alt="Foto" />
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                            <div class="grid_9">
                                <div class="container_12" style="margin-right: 0px; margin-left: 0px; width: 100%;">
                                    <div class="grid_2">
                                        <span class="label">Nome:</span><asp:HiddenField ID="IdUsuario" runat="server" />
                                    </div>
                                    <div class="grid_10">
                                        <asp:TextBox ID="txtNome" runat="server" CssClass="text" ReadOnly="true" Enabled="false"></asp:TextBox>
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Nascimento:</span>
                                    </div>
                                    <div class="grid_3">
                                        <asp:TextBox ID="txtDtNascimento" ReadOnly="true" Enabled="false" MaxLength="10"
                                            runat="server" CssClass="text"></asp:TextBox>
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Apelido:</span>
                                    </div>
                                    <div class="grid_5">
                                        <asp:TextBox ID="txtApelido" ReadOnly="true" Enabled="false" runat="server" CssClass="text"></asp:TextBox>
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Peso:</span></div>
                                    <div class="grid_3">
                                        <asp:TextBox ID="txtPeso" MaxLength="5" runat="server" CssClass="text" ReadOnly="true"
                                            Enabled="false"></asp:TextBox>
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Sexo:</span></div>
                                    <div class="grid_5">
                                        <asp:DropDownList ID="ddlSexo" runat="server" CssClass="text" ReadOnly="true" Enabled="false">
                                            <asp:ListItem Text="Masculino" Value="M" />
                                            <asp:ListItem Text="Feminino" Value="F" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Altura:</span></div>
                                    <div class="grid_3">
                                        <asp:TextBox ID="txtAltura" MaxLength="4" ReadOnly="true" Enabled="false" runat="server"
                                            CssClass="text"></asp:TextBox>
                                    </div>
                                    <div class="grid_2">
                                        <span class="label">Estado:</span></div>
                                    <div class="grid_5">
                                        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="text" ReadOnly="true" Enabled="false">
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
                                    <div class="clear espaco_mini">
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                            <div class="clear">
                                &nbsp;
                            </div>
                            <div class="grid_2">
                                <span class="label">Cidade:</span>
                            </div>
                            <div class="grid_4">
                                <asp:TextBox ID="txtCidade" ReadOnly="true" Enabled="false" runat="server" CssClass="text"></asp:TextBox>
                            </div>
                            <div class="grid_2">
                                <span class="label">Perfil Facebook:</span>
                            </div>
                            <div class="grid_4">
                                <asp:TextBox ID="txtPerfilFacebook" ReadOnly="true" Enabled="false" MaxLength="200"
                                    runat="server" CssClass="text"></asp:TextBox>
                            </div>
                            <div class="clear espaco_mini">
                                &nbsp;
                            </div>
                            <div class="grid_2">
                                <span class="label">Perfil Twitter:</span>
                            </div>
                            <div class="grid_4">
                                <asp:TextBox ID="txtPerfilTwitter" ReadOnly="true" Enabled="false" MaxLength="200"
                                    runat="server" CssClass="text"></asp:TextBox>
                            </div>
                            <div class="grid_2">
                                <span class="label">Perfil Plus:</span></div>
                            <div class="grid_4">
                                <asp:TextBox ID="txtPerfilPlus" ReadOnly="true" Enabled="false" MaxLength="200" runat="server"
                                    CssClass="text"></asp:TextBox>
                            </div>
                            <div class="clear espaco_mini">
                                &nbsp;
                            </div>
                            <div class="grid_2">
                                <span class="label">Obs:</span></div>
                            <div class="grid_10">
                                <asp:TextBox ID="txtObs" Height="100px" Width="100%" MaxLength="8000" ReadOnly="true"
                                    Enabled="false" TextMode="MultiLine" CssClass="text" runat="server"></asp:TextBox>
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
