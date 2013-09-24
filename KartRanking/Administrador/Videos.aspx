<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="Videos.aspx.cs" Inherits="KartRanking.Administrador.Videos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelVideos" runat="server">
        <script type="text/javascript">
            jQuery(document).ready(function () {
                jQuery('.fancybox-media')
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

            function OpenCadastro() {
                jQuery('#CadVideo').dialog({
                    autoOpen: false, title: "Cadastrar novo video",
                    buttons: {
                        "Salvar": function () { jQuery('#CadVideo').dialog("close"); __doPostBack('<%= lnkConfirmar.UniqueID %>', ''); return true; },
                        "Sair": function () { jQuery('#CadVideo').dialog("close"); return true; }
                    }
                });
                jQuery('#CadVideo').dialog({ width: 300, height: 160 });
                jQuery("#CadVideo").parent().appendTo(jQuery("form:first"));
                jQuery('#CadVideo').dialog('open');
            }
        </script>
        <div id="CadVideo" title="Cadastrar novo Video" style="display: none; font-size: x-small;
            color: Black; font-family: Verdana; font-style: normal; font-weight: normal;"
            class="ui-dialog ui-resizable-handle">
            <table width="98%" cellpadding="1" cellspacing="1" border="0">
                <tr>
                    <td>
                        <span><b>Url YouTube:</b></span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUrlVideo" Width="98%" MaxLength="500" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span><b>Data Evento:</b></span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDtEvento" MaxLength="10" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div style="display: none;">
                <asp:LinkButton ID="lnkConfirmar" runat="server" OnClick="lnkConfirmar_Click"></asp:LinkButton>
            </div>
        </div>
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
                <input id="btnAdd" type="button" value="Novo Video" onclick="OpenCadastro();" />
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
                            <div id="Player_<%# Eval("idVideo") %>" style="text-align: left;">
                                <a class="fancybox-media" href="<%# Eval("UrlVideo") %>"><%# Eval("dtEvento")%></a>
                            </div>
                        </div>
                        <% if (IsAdmin)
                           { %>
                        <div class="clear espaco_mini">
                            &nbsp;
                        </div>
                        <div class="grid_12" style="text-align: left;">
                            <asp:Button ID="btnRemove" runat="server" Text="Remover" CommandArgument='<%# Eval("idVideo") %>'
                                CommandName="Remover" OnClientClick="return confirm('Deseja remover este video!');" />
                        </div>
                        <%} %>
                        <div class="clear espaco">
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
