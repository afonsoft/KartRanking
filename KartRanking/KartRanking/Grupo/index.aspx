<%@ Page Title="" Language="C#" MasterPageFile="~/Grupo/KartGrupo.master" AutoEventWireup="true"
    CodeBehind="index.aspx.cs" Inherits="KartRanking.Grupo.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <link href="/Grupo/css/jquery.lwtCountdown.css" rel="stylesheet" type="text/css" />
    <link href="/Grupo/css/grid.css" rel="stylesheet" type="text/css" />
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
            color: #666666;
            font-size: 10px;
        }
        .sliderTitulo
        {
            font-size: 11px;
            color: Black;
            font-weight: bold;
            margin: 0px;
            padding: 2px 5px;
        }
    </style>
    <script src="/js/jquery.easySlider.js" type="text/javascript"></script>
    <script src="/Grupo/js/jquery.lwtCountdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:HiddenField ID="HiddenIdGrupo" runat="server" />
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


            var b = new Date;
            var e = b.getFullYear() + 1 + "/" + (b.getMonth() + 1) + "/" + b.getDate() + " " + b.getHours() + ":" + b.getMinutes() + ":" + b.getSeconds();
            b = -b.getTimezoneOffset() / 60;
            $('#count').jCountdown({ timeText: e, timeZone: b, style: "flip", color: "black", width: 0, textGroupSpace: 15, textSpace: 0, reflection: !0, reflectionOpacity: 10, reflectionBlur: 0, dayTextNumber: 3, displayDay: !0, displayHour: !0, displayMinute: !0, displaySecond: !0, displayLabel: !0 });


        });
    </script>
    <div class="container_12">
        <div class="wrapper">
            <article class="grid_12">
                <div class="page1 box maxheight" style="height: auto; min-height: 200px;">
                    <div class="padding-box">
                        <div class="indent-bot">
                            <h3 class="p2">
                                <strong class="text-2"><strong><strong>
                                    <asp:Literal ID="ltNomeCampeonato" runat="server"></asp:Literal></strong></strong></strong></h3>
                                <!-- Countdown dashboard start -->
		                        <div id="countdown_dashboard">
			                        <div class="dash weeks_dash">
				                        <span class="dash_title">semana</span>
				                        <div class="digit">0</div>
				                        <div class="digit">0</div>
			                        </div>

			                        <div class="dash days_dash">
				                        <span class="dash_title">dias</span>
				                        <div class="digit">0</div>
				                        <div class="digit">0</div>
			                        </div>

			                        <div class="dash hours_dash">
				                        <span class="dash_title">horas</span>
				                        <div class="digit">0</div>
				                        <div class="digit">0</div>
			                        </div>

			                        <div class="dash minutes_dash">
				                        <span class="dash_title">minutos</span>
				                        <div class="digit">0</div>
				                        <div class="digit">0</div>
			                        </div>

			                        <div class="dash seconds_dash">
				                        <span class="dash_title">secundos</span>
				                        <div class="digit">0</div>
				                        <div class="digit">0</div>
			                        </div>

		                        </div>
		                        <!-- Countdown dashboard end -->
                            <div class="border-bot">
                            </div>
                        </div>
                    </div>
                </div>
            </article>
            <div class="clear espaco">
                &nbsp;
            </div>
            <article class="grid_6">
                <div class="page1 box maxheight" style="height: auto; min-height: 420px;">
                    <div class="padding-box">
                        <div class="indent-bot">
                            <h3 class="p2">
                                <strong class="text-2"><strong><strong>Campeonato</strong></strong></strong></h3>
                            <div class="template" style="font-size: 8pt;">
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
                            <div class="border-bot">
                            </div>
                        </div>
                        <a href="#" class="button"><strong><strong>Mais</strong></strong></a>
                    </div>
                </div>
            </article>
            <article class="grid_6">
                <div class="page1 box maxheight" style="height: auto; min-height: 420px;">
                    <div class="padding-box">
                        <h3 class="p2">
                            <strong class="text-2"><strong><strong>Noticias</strong></strong></strong></h3>
                        <asp:Literal ID="ltNoticias" runat="server"></asp:Literal>
                    </div>
                </div>
            </article>
            <div class="clear espaco">
                &nbsp;
            </div>
            <article class="grid_6">
                <div class="page1 box maxheight" style="height: auto; min-height: 420px;">
                    <div class="padding-box">
                        <h3 class="p2">
                            <strong class="text-2"><strong><strong>Etapas</strong></strong></strong></h3>
                        <div class="template" style="font-size: 8pt;">
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
                        <a href="#" class="button"><strong><strong>Mais</strong></strong></a>
                    </div>
                </div>
            </article>
            <article class="grid_6">
                <div class="page1 box maxheight" style="height: auto; min-height: 420px;">
                    <div class="padding-box">
                        <h3 class="p2">
                            <strong class="text-2"><strong><strong>Piloto em Destaque</strong></strong></strong></h3>
                        <table width="100%" cellpadding="2" cellspacing="2" border="0">
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
                                <td>
                                    <asp:Label ID="lbEquipe" runat="server" Text=""></asp:Label>
                                </td>
                                <td style="width: 50px;">
                                    <b>Pontos:</b>
                                </td>
                                <td style="width: 50px;">
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
                            <tr>
                                <td colspan="5">
                                    <asp:LinkButton ID="lnkMaisInfo" runat="server" OnClick="lnkMaisInfo_Click" CssClass="button"><strong><strong>Mais informações do piloto</strong></strong></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </article>
            <div class="clear espaco">
                &nbsp;
            </div>
        </div>
    </div>
</asp:Content>
