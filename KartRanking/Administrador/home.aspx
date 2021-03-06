﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="home.aspx.cs" Inherits="KartRanking.Administrador.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
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
    <div class="container_12">
    <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12" style="text-align:left;">
            <span><b>Url do Grupo (Url Amigavel): </b>
                <asp:Literal ID="ltUrlAmigavel" runat="server"></asp:Literal></span>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_4">
            <b>Classificação dos Pilotos (Top 10)</b>
        </div>
        <div class="grid_2" style="text-align: right;">
            <a href="ClassificacaoCampeonato.aspx?op=1">Rank Completo</a>
        </div>
        <div class="grid_4">
            &nbsp;<b>Noticias do grupo</b>
        </div>
        <div class="grid_2" style="text-align: right;">
            <a href="Noticias.aspx">Mais Noticias</a>
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
                <asp:Literal ID="ltNoticias" runat="server"></asp:Literal>
                &nbsp;
            </div>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_4">
            <b>Classificação das Equipes (Top 10)</b>
        </div>
        <div class="grid_2" style="text-align: right;">
            <a href="ClassificacaoCampeonato.aspx?op=2">Rank de Equipe</a>
        </div>
        <div class="grid_4">
            &nbsp;<b>Piloto em Destaque</b>
        </div>
        <div class="grid_2" style="text-align: right;">
            <a href="PilotosEquipesGrupo.aspx?op=1">Todos os Pilotos</a>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_6">
            <div class="template" >
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
            <div style="width: 100%; height: 270px; border: solid 1px #dbddff;">
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
                            <asp:LinkButton ID="lnkMaisInfo" runat="server" OnClick="lnkMaisInfo_Click">Mais informações do piloto</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
    </div>
</asp:Content>
