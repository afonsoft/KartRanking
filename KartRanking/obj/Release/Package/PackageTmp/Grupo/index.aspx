<%@ Page Title="" Language="C#" MasterPageFile="~/Grupo/KartGrupo.master" AutoEventWireup="true"
    CodeBehind="index.aspx.cs" Inherits="KartRanking.Grupo.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <script src="/grupo/countdown/countdown.js" type="text/javascript"></script>
    <style type="text/css">
        #slider, #slider li
        {
            width: 100%;
            min-height: 190px;
            height: auto;
            overflow: hidden;
        }
        #slider li p
        {
            padding-bottom: 15px;
        }
        span#prevBtn
        {
            text-decoration: none;
            font-style: normal;
        }
        span#nextBtn
        {
            text-decoration: none;
            font-style: normal;
        }
        .sliderSinopise
        {
            padding: 0px 5px 5px 5px;
            color: rgb(189, 178, 178);
            font-size: 10px;
        }
        .sliderTitulo
        {
            font-size: 11px;
            color: #fff;
            font-weight: bold;
            margin: 0px;
            padding: 2px 5px;
        }
        #defaultCountdown
        {
            width: 240px;
            height: 45px;
        }
        
        .cntSeparator
        {
            font-size: 54px;
            margin: 30px 8px;
        }
        .desc
        {
            margin: 7px 3px;
        }
        .desc div
        {
            float: left;
            font-family: Arial, Tahoma;
            width: 60px;
            margin-right: 45px;
            margin-left: 25px;
            text-align: center;
            font-size: 13px;
            font-weight: normal;
        }
        .p2
        {
            color: #fecc5f;
            font-size: 20px;
            font-weight: bold;
            text-transform: uppercase;
            line-height: 26px;
            margin-bottom: 10px;
        }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {

            $("#slider").easySlider({
                loop: true,                           // Looping
                orientation: 'vertical',              // Fading
                autoplayDuration: 6500,               // Autoplay with 1 second intervals
                autogeneratePagination: true,         // Automatically generate pagination links
                restartDuration: 1500,                // In case of user interaction, restart the autoplay after 2.5 seconds
                nextId: 'next',
                prevId: 'prev',
                pauseable: true                       // Pause by hovering over the image!  Then restart after 2.5 seconds (see above)
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:HiddenField ID="HiddenIdGrupo" runat="server" />
    <div class="container_12">
        <div class="wrapper">
            <div class="grid_12">
                <div class="page1 box maxheight" style="height: auto; min-height: 200px;">
                    <div class="padding-box">
                        <div class="indent-bot">
                            <h3 class="p2">
                                <span class="TitleFont">
                                    <img src="/Grupo/ImgTitleHandler.ashx?Text=<%= NomeGrupo %>&f=40" alt="Grupo" />
                                </span>
                            </h3>
                            <asp:HiddenField ID="HiddenFieldStartTime" runat="server" />
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 80%; vertical-align: top;">
                                        <p>
                                            Campeonato</p>
                                        <img src="/Grupo/ImgTitleHandler.ashx?Text=<%= NomeCampeonato %>&f=40" alt="Campeonato" />
                                    </td>
                                    <td>
                                        <p>
                                            Proxima Etapa:
                                            <asp:Literal ID="LtProximaEtapa" runat="server"></asp:Literal></p>
                                        <script type="text/javascript">
                                            // 86400 seconds = 1 day
                                            var timeSec = document.getElementById('<%= HiddenFieldStartTime.ClientID %>').value;
                                            var myCountdownLeftGame = new Countdown({ time: timeSec, width: 300, height: 60, rangeHi: "day", style: "flip" });
                                        </script>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_6">
                <div class="page1 box maxheight" style="height: auto; min-height: 380px;">
                    <div class="padding-box">
                        <div class="indent-bot">
                            <h3 class="p2">
                                <img src="/Grupo/ImgTitleHandler.ashx?Text=Campeonato&f=40" alt="Campeonato" />
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
                        <a href="/<%= UrlGrupo %>/pilotos" class="button"><strong><strong>Mais</strong></strong></a>
                    </div>
                </div>
            </div>
            <div class="grid_6">
                <div class="page1 box maxheight" style="height: auto; min-height: 380px;">
                    <div class="padding-box">
                        <div class="indent-bot">
                            <h3 class="p2">
                                <img src="/Grupo/ImgTitleHandler.ashx?Text=Noticias&f=40" alt="Noticias" />
                            </h3>
                            <div style="font-size: 7pt; color: #FFF;">
                                <asp:Literal ID="ltNoticias" runat="server"></asp:Literal></div>
                            <div class="border-bot">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_6">
                <div class="page1 box maxheight" style="height: auto; min-height: 380px;">
                    <div class="padding-box">
                        <div class="indent-bot">
                            <h3 class="p2">
                                <img src="/Grupo/ImgTitleHandler.ashx?Text=Equipe&f=40" alt="Equipe" />
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
                        <a href="/<%= UrlGrupo %>/pilotos/equipes" class="button"><strong><strong>Mais</strong></strong></a>
                    </div>
                </div>
            </div>
            <div class="grid_6">
                <div class="page1 box maxheight" style="height: auto; min-height: 380px;">
                    <div class="padding-box">
                        <div class="indent-bot">
                            <h3 class="p2">
                                <img src="/Grupo/ImgTitleHandler.ashx?Text=Piloto%20Destaque&f=40" alt="Piloto Destaque" />
                            </h3>
                            <div>
                                <table style="width: 99%; text-align: left; border: 0px solid #000;" cellpadding="1"
                                    cellspacing="1">
                                    <tr>
                                        <td rowspan="6" style="height: 170px; width: 150px; text-align: left; vertical-align: top;">
                                            <img src= "/Administrador/ImageHandler.ashx?id=<%= IdUsuarioDestaque %>" Width="140px" Height="160px"alt="Piloto Destaque" />
                                        </td>
                                        <td style="width: 50px;">
                                            <b>Nome:</b>
                                        </td>
                                        <td style="min-width: 100px;" colspan="3">
                                            <asp:Label ID="lbNome" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 50px;">
                                            <b>Equipe:</b>
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="lbEquipe" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 50px;">
                                            <b>Pontos:</b>
                                        </td>
                                        <td colspan="3">
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
                                        <td style="width: 50px;">
                                            <b>Facebook:</b>
                                        </td>
                                        <td colspan="3">
                                            <asp:Literal ID="ltPerfilFace" runat="server" Text=""></asp:Literal>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="border-bot">
                            </div>
                        </div>
                        <a href="/<%= UrlGrupo %>/pilotos/info/<%= IdUsuarioDestaque %>" class="button"><strong><strong>Mais informações do piloto</strong></strong></a>
                    </div>
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
        </div>
    </div>
</asp:Content>
