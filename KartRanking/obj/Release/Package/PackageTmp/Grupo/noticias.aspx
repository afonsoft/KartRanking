<%@ Page Title="" Language="C#" MasterPageFile="~/Grupo/KartGrupo.master" AutoEventWireup="true"
    CodeBehind="noticias.aspx.cs" Inherits="KartRanking.Grupo.noticias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelNoticias" runat="server">
        <div class="container_12">
            <div class="grid_12">
                <h3 class="p2">
                    <span class="TitleFont">
                        <img src="/Grupo/ImgTitleHandler.ashx?Text=Noticias&f=40" alt="Grupo" />
                    </span>
                </h3>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
                <asp:Repeater ID="RptNoticias" runat="server">
                    <HeaderTemplate>
                        <div class="container_12">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="grid_12">
                            <span style="font-size: large; font-style: normal;">
                                <%# Eval("Titulo") %></span><span style="font-size: xx-small; font-style: normal;">&nbsp;-&nbsp;por:
                                    &nbsp;<%# Eval("Nome") %>&nbsp;-&nbsp;em:&nbsp;<%# Convert.ToDateTime(Eval("dtCriacao")).ToString("dd/MM/yyy") %></span>
                        </div>
                        <div class="clear espaco">
                            &nbsp;
                        </div>
                        <div class="grid_12">
                            <span>
                                <%# Eval("Noticia") %></span>
                        </div>
                        <div class="clear espaco">
                            &nbsp;
                        </div>
                        <div class="grid_12">
                            <a href='/<%= UrlGrupo %>/noticias/<%# Eval("idNoticias") %>' class="button"><strong>
                                <strong>Continuar Lendo...</strong></strong></a>
                        </div>
                        <div class="clear espaco_mini">
                            &nbsp;
                        </div>
                        <div class="grid_12">
                            <hr />
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
            <div class="clear espaco">
                &nbsp;
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelReadNoticia" runat="server">
        <div class="container_12">
            <div class="grid_12">
                <h3 class="p2">
                    <span class="TitleFont">
                        <img src="/Grupo/ImgTitleHandler.ashx?Text=Noticias&f=40" alt="Grupo" />
                    </span>
                </h3>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12" style="text-align: left;">
                <h3>
                    <asp:Label ID="lbTitulo" runat="server" Text="">&nbsp;</asp:Label></h3>
                <span style="font-size: xx-small;">Por:&nbsp;<asp:Label ID="lbNome" runat="server"
                    Text=''></asp:Label>
                </span>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
                <span style="text-align: justify;">
                    <asp:Label ID="lbNoticia" runat="server" Text=""></asp:Label>
                </span>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_12">
                <a href="/<%= UrlGrupo %>/noticias" class="button"><strong><strong>Voltar</strong></strong></a>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
        </div>
    </asp:Panel>
</asp:Content>
