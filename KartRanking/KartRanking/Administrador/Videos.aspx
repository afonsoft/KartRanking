<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="Videos.aspx.cs" Inherits="KartRanking.Administrador.Videos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelVideos" runat="server">
        <div class="container_12">
            <div class="grid_12">
                <h3 class="StepTitle">
                    Videos deste Grupo</h3>
                <div class="StepSubTitle">
                    Gerenciar os videos deste grupo</div>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12" style="text-align: right;">
                <% if (IsAdmin)
                   { %>
                <input id="btnAdd" type="button" value="Novo Album" onclick="OpenCadastro();" />
                <%}
                   else
                   { %>
                &nbsp;
                <%} %>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12" style="text-align: center;">
                <asp:Repeater ID="RepeaterVideos" runat="server" OnItemCommand="RepeaterVideos_ItemCommand">
                    <HeaderTemplate>
                        <div class="container_12">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="grid_12" style="text-align: center;">
                            <div id="Player_<%# Eval("idVideo") %>" style="text-align: center;">
                            </div>
                            <script type="text/javascript">
                                $('#Player_<%# Eval("idVideo") %>').youTubeEmbed({ video: '<%# Eval("UrlVideo") %>', width: 500, progressBar: false });
                            </script>
                        </div>
                        <div class="clear">
                            &nbsp;
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <div class="grid_12" style="text-align: left;">
                            <asp:LinkButton ID="lnkAnterior" runat="server" CommandArgument='<%# Convert.ToInt16(((string[])ViewState["InfoPage"])[1]) %>'
                                CommandName="PagA"><</asp:LinkButton>&nbsp;&nbsp;<%# ((string[])ViewState["InfoPage"])[0] %>&nbsp;&nbsp;
                            <asp:LinkButton ID="lnkProximo" runat="server" CommandArgument='<%# Convert.ToInt16(((string[])ViewState["InfoPage"])[1]) %>'
                                CommandName="PagP">></asp:LinkButton>&nbsp;</b>
                        </div>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="clear">
                &nbsp;
            </div>
        </div>
    </asp:Panel>
</asp:Content>
