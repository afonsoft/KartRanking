<%@ Page Title="" Language="C#" MasterPageFile="~/Grupo/KartGrupo.master" AutoEventWireup="true"
    CodeBehind="videos.aspx.cs" Inherits="KartRanking.Grupo.videos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.fancybox-media')
				.attr('rel', 'media-gallery')
				.fancybox({
				    openEffect: 'none',
				    closeEffect: 'none',
				    prevEffect: 'none',
				    nextEffect: 'none',

				    arrows: false,
				    helpers: {
				        media: {},
				        buttons: {}
				    }
				});
        });
    </script>
    <div class="container_12">
        <div class="grid_12">
            <h3 class="p2">
                <span class="TitleFont">
                    <img src="/Grupo/ImgTitleHandler.ashx?Text=Videos&f=40" alt="Grupo" />
                </span>
            </h3>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <asp:Repeater ID="rptEtapas" runat="server">
                <HeaderTemplate>
                    <div class="container_12">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="grid_12">
                        <h3 class="p2">
                            <span class="TitleFont">
                                <%# Eval("NomeEtapa")%></span><span style="font-size: 10pt;">&nbsp;-&nbsp;<%# Eval("dtEvento")%></span></h3>
                    </div>
                    <div class="clear espaco_mini">
                        &nbsp;
                    </div>
                    <div class="grid_12">
                        <asp:Repeater ID="rptVideos" runat="server" DataSource='<%# Eval("lstVideos") %>'>
                            <HeaderTemplate>
                                <div class="container_12">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="grid_12" style="text-align: center;">
                                    <div id="Player_<%# Eval("idVideo") %>" style="text-align: left;">
                                        <a class="fancybox-media" href="<%# Eval("UrlVideo") %>">
                                            <%# Eval("txtTitulo")%>
                                            -
                                            <%# Eval("dtEvento")%></a>
                                    </div>
                                </div>
                                <div class="clear espaco_mini">
                                    &nbsp;
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
    </div>
</asp:Content>
