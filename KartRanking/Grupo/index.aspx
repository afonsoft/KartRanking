<%@ Page Title="" Language="C#" MasterPageFile="~/Grupo/KartGrupo.master" AutoEventWireup="true"
    CodeBehind="index.aspx.cs" Inherits="KartRanking.Grupo.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <link href="countdown/jquery.countdown.css" rel="stylesheet" type="text/css" />
    <script src="countdown/jquery.countdown.min.js" type="text/javascript"></script>
    <script src="countdown/jquery.countdown-pt-BR.js" type="text/javascript"></script>
    <style type="text/css">
        #slider, #slider li
        {
            width: 100%;
            height: 250px;
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


        $("#defaultCountdown").countdown({ since: new Date(2014, 12 - 1, 25) });



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
                                    <span style="font-family:28 Days Later;"><asp:Literal ID="ltNomeCampeonato" runat="server" ></span></asp:Literal></h3>
                            <!-- Countdown dashboard start -->
                            <div id="defaultCountdown" class="hasCountdown">
                            </div>
                            <!-- Countdown dashboard end -->
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
                <div class="page1 box maxheight" style="height: auto; min-height: 515px;">
                    <div class="padding-box">
                        <div class="indent-bot">
                            <h3 class="p2">
                                <img src="../images/Campeonato.png" alt="Campeonato" />
                            </h3>
                            <div style="font-size: 7pt; color: #FFF;">
                                <asp:Repeater ID="gvRankigCampeonato" runat="server">
                                    <HeaderTemplate>
                                        <table style="width: 100%; padding: 1px; text-align: left; border: 0px solid #000;">
                                            <tr>
                                                <td style="width: 30px;">
                                                    <b>Pos</b>
                                                </td>
                                                <td style="width: auto;">
                                                    <b>Nome</b>
                                                </td>
                                                <td style="width: 30px;">
                                                    <b>Pontos</b>
                                                </td>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td style="width: 30px;">
                                                <span>
                                                    <%# Container.ItemIndex + 1%></span>
                                            </td>
                                            <td style="width: auto;">
                                                <a href='/Grupo/pilotos.aspx?idUsuario=<%# Eval("idUsuario") %>&idGrupo=<%# Eval("idGrupo") %>'>
                                                    <%# Eval("Nome") %></a>
                                            </td>
                                            <td style="width: 30px;">
                                                <span>
                                                    <%# Eval("Pontos") %>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <hr />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="border-bot">
                            </div>
                        </div>
                        <a href="/Grupo/pilotos.aspx" class="button"><strong><strong>Mais</strong></strong></a>
                    </div>
                </div>
            </div>
            <div class="grid_6">
                <div class="page1 box maxheight" style="height: auto; min-height: 515px;">
                    <div class="padding-box">
                        <div class="indent-bot">
                            <h3 class="p2">
                                <img src="../images/Noticias.png" alt="Noticias" />
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
                <div class="page1 box maxheight" style="height: auto; min-height: 515px;">
                    <div class="padding-box">
                        <div class="indent-bot">
                            <h3 class="p2">
                                <img src="../images/Etapas.png" alt="Etapas" /></h3>
                            <div style="font-size: 7pt; color: #FFF;">
                                <asp:Repeater ID="gvRankigEquipe" runat="server">
                                    <HeaderTemplate>
                                        <table style="width: 100%; padding: 1px; text-align: left; border: 0px solid #000;">
                                            <tr>
                                                <td style="width: 30px;">
                                                    <b>Pos</b>
                                                </td>
                                                <td style="width: auto;">
                                                    <b>Equipe</b>
                                                </td>
                                                <td style="width: 40px;">
                                                    <b>Sigla</b>
                                                </td>
                                                <td style="width: 30px;">
                                                    <b>Pontos</b>
                                                </td>
                                            </tr>
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
                                        <tr>
                                            <td colspan="4">
                                                <hr />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table></FooterTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="border-bot">
                            </div>
                        </div>
                        <a href="#" class="button"><strong><strong>Mais</strong></strong></a>
                    </div>
                </div>
            </div>
            <div class="grid_6">
                <div class="page1 box maxheight" style="height: auto; min-height: 515px;">
                    <div class="padding-box">
                        <div class="indent-bot">
                            <h3 class="p2">
                                <img src="../images/PilotoDestaque.png" alt="Piloto Destaque" /></h3>
                            <div>
                                <table style="width: 100%; padding: 1px; border-spacing: 1px; text-align: left; border: 0px solid #000;">
                                    <tr>
                                        <td rowspan="6" style="height: 170px; width: 150px;">
                                            <asp:Image ID="ImgPerfil" Width="150px" Height="170px" runat="server" />
                                        </td>
                                        <td style="width: 50px;">
                                            <b>Nome:</b>
                                        </td>
                                        <td style="min-width: 200px;" colspan="3">
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
                        <asp:LinkButton ID="lnkMaisInfo" runat="server" OnClick="lnkMaisInfo_Click" CssClass="button"><strong><strong>Mais informações do piloto</strong></strong></asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
        </div>
    </div>
</asp:Content>
