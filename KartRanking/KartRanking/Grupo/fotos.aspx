<%@ Page Title="" Language="C#" MasterPageFile="~/Grupo/KartGrupo.master" AutoEventWireup="true"
    CodeBehind="fotos.aspx.cs" Inherits="KartRanking.Grupo.fotos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelListAlbum" runat="server">
        <div class="container_12">
            <div class="wrapper">
                <asp:Repeater ID="RepeaterAlbum" runat="server">
                    <ItemTemplate>
                        <div class="grid_12">
                            <div class="page1 box maxheight" style="height: auto; min-height: 200px;">
                                <div class="padding-box">
                                    <div class="indent-bot">
                                        <h3 class="p2">
                                            <span class="TitleFont" title='<%# Convert.ToDateTime(Eval("dtEvento")).ToString("dd/MM/yyyy") %>'>
                                                <img alt="Titulo album" src='/Grupo/ImgTitleHandler.ashx?Text=<%# Eval("NomeAlbum") %>&f=28' />
                                                </span>
                                        </h3>
                                        <div style="color: #FFF;">
                                            <asp:Repeater ID="RepeaterItem" runat="server" DataSource='<%# Eval("Itens") %>'>
                                                <HeaderTemplate>
                                                    <div class="container_12">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <div class="grid_2" style="max-height: 100px;">
                                                        <div style="<%# Convert.ToBoolean(Eval("Ativo")) ? "display:block;": "display:none;" %>">
                                                            <a href="/Grupo/Fotos.aspx?idgrupo=<%# Eval("idGrupo") %>&idalbum=<%# Eval("idAlbum") %>">
                                                                <img alt="<%# Eval("Nome") %>" src="<%# Eval("Foto") %>" width="100px" height="100px" />
                                                            </a>
                                                        </div>
                                                        &nbsp;
                                                    </div>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="border-bot">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clear espaco">
                            &nbsp;
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelAlbum" runat="server">
        <script type="text/javascript">
            jQuery(document).ready(function () {

                jQuery('.fancybox-thumbs').fancybox({
                    prevEffect: 'none',
                    nextEffect: 'none',

                    closeBtn: false,
                    arrows: false,
                    nextClick: true,

                    helpers: {
                        thumbs: {
                            width: 50,
                            height: 50
                        }
                    },
                    afterLoad: function () {
                        this.title = 'Imagem ' + (this.index + 1) + ' de ' + this.group.length + (this.title ? ' - ' + this.title : '');
                    }
                });
            });
        </script>
        <div class="container_12">
            <div class="wrapper">
                <div class="grid_12">
                    <div class="page1 box maxheight" style="height: auto; min-height: 200px;">
                        <div class="padding-box">
                            <div class="indent-bot">
                                <h3 class="p2">
                                    <span class="TitleFont">
                                        <asp:Image runat="server" ID="titleAlbum" />
                                    </span>
                                </h3>
                                <div style="color: #FFF;">
                                    <asp:Repeater ID="RepeaterFotos" runat="server">
                                        <HeaderTemplate>
                                            <div class="container_12">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <% TotalCol++; TotalImgCount++; %>
                                            <div class="grid_2">
                                                <div style="<%# Convert.ToBoolean(Eval("Ativo")) ? "display:block;": "display:none;" %>">
                                                    <a href="<%# Eval("Foto") %>" <%# Convert.ToBoolean(Eval("Ativo")) ? "class=\"fancybox-thumbs\"": "" %>
                                                        data-fancybox-group="button" title="<%# Eval("Nome") %>">
                                                        <img alt="<%# Eval("Nome")%>" src="<%# Eval("Foto") %>" width="130px" height="100px" />
                                                </div>
                                                &nbsp; </a>
                                            </div>
                                            <% if (TotalCol == 6)
                                               {
                                                   TotalCol = 0;%>
                                            <div class="clear espaco_mini">
                                                &nbsp;
                                            </div>
                                            <%} %>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="clear espaco_mini">
                                                &nbsp;
                                            </div>
                                            </div>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                                <div class="border-bot">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear espaco">
                    &nbsp;
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
