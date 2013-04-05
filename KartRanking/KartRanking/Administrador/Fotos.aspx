<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="Fotos.aspx.cs" Inherits="KartRanking.Administrador.Fotos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelListAlbum" runat="server">
        <script type="text/javascript">
            function OpenCadastro() {
                jQuery('#CadAlbum').dialog({
                    autoOpen: false, title: "Cadastrar novo Album",
                    buttons: {
                        "Salvar": function () { jQuery('#CadAlbum').dialog("close"); __doPostBack('<%= lnkConfirmar.UniqueID %>', ''); return true; },
                        "Sair": function () { jQuery('#CadAlbum').dialog("close"); return true; }
                    }
                });
                jQuery('#CadAlbum').dialog({ width: 300, height: 160 });
                jQuery("#CadAlbum").parent().appendTo(jQuery("form:first"));
                jQuery('#CadAlbum').dialog('open');
            }
        </script>
        <div id="CadAlbum" title="Cadastrar novo Album" style="display: none; font-size: x-small;
            color: Black; font-family: Verdana; font-style: normal; font-weight: normal;"
            class="ui-dialog ui-resizable-handle">
            <table width="98%" cellpadding="1" cellspacing="1" border="0">
                <tr>
                    <td>
                        <span><b>Nome:</b></span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNomeAlbum" Width="98%" MaxLength="20" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span><b>Data:</b></span>
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
                <h3 class="titulo">
                    Album de fotos do Grupo</h3>
                <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                    Gerencia e visualize os álbuns de fotos deste grupo</p>
                <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                    border-right: #ccc 1px dashed;" />
            </div>
            <div class="clear espaco">
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
            <div class="grid_12">
                &nbsp;
                <asp:Repeater ID="RepeaterAlbum" runat="server">
                    <HeaderTemplate>
                        <div class="container_12">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="grid_10">
                            <h4>
                                <a href="/Administrador/Fotos.aspx?idalbum=<%# Eval("idAlbum") %>">
                                    <%# Eval("NomeAlbum")%></a></h4>
                        </div>
                        <div class="grid_2" style="text-align: right;">
                            <%# Convert.ToDateTime(Eval("dtEvento")).ToString("dd/MM/yyyy")%></div>
                        <div class="clear espaco_mini">
                            &nbsp;</div>
                        <asp:Repeater ID="RepeaterItem" runat="server" DataSource='<%# Eval("Itens") %>'>
                            <ItemTemplate>
                                <div class="grid_2" style="max-height: 100px;">
                                    <div style="<%# Convert.ToBoolean(Eval("Ativo")) ? "display:block;": "display:none;" %>">
                                        <a href="/Administrador/Fotos.aspx?idalbum=<%# Eval("idAlbum") %>">
                                            <img alt="<%# Eval("Nome") %>" src="<%# Eval("Foto") %>" width="100px" height="100px" />
                                        </a>
                                    </div>
                                    &nbsp;
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="clear espaco_mini">
                            &nbsp;</div>
                        <div class="grid_12">
                            <hr />
                        </div>
                        <div class="clear espaco">
                            &nbsp;</div>
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
    <asp:Panel ID="PanelAlbum" runat="server">
        <script type="text/javascript">
            function OpenUploadPhoto() {
                jQuery('#dlgUpFile').dialog({
                    autoOpen: false, title: "Upload de Fotos",
                    buttons: {
                        "Enviar": function () { jQuery('#dlgUpFile').dialog("close"); __doPostBack('<%= lnkConfirmarUp.UniqueID %>', ''); return true; },
                        "Sair": function () { jQuery('#dlgUpFile').dialog("close"); return true; }
                    }
                });
                jQuery('#dlgUpFile').dialog({ width: 300, height: 250 });
                jQuery("#dlgUpFile").parent().appendTo(jQuery("form:first"));
                jQuery('#dlgUpFile').dialog('open');
            }
        </script>
        <div id="dlgUpFile" title="Upload de Fotos" style="display: none; font-size: x-small;
            color: Black; font-family: Verdana; font-style: normal; font-weight: normal;"
            class="ui-dialog ui-resizable-handle">
            <table width="98%" cellpadding="2" cellspacing="2" border="0">
                <tr>
                    <td>
                        <asp:FileUpload ID="FileUploadControl1" runat="server" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="FileUploadControl2" runat="server" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="FileUploadControl3" runat="server" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="FileUploadControl4" runat="server" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="FileUploadControl5" runat="server" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>São aceitos somente jpg.</span>
                    </td>
                </tr>
            </table>
            <div style="display: none;">
                <asp:LinkButton ID="lnkConfirmarUp" runat="server" OnClick="lnkConfirmarUp_Click"></asp:LinkButton>
            </div>
        </div>
        <div class="container_12">
            <div class="grid_12">
                <h3 class="titulo">
                    Album de fotos</h3>
                <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                    Visualize as fotos deste album</p>
                <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                    border-right: #ccc 1px dashed;" />
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_6">
                <b>Album:</b>&nbsp;<asp:Label ID="lbTituloAlbum" runat="server" Text=""></asp:Label>
            </div>
            <div class="grid_4" style="text-align: right;">
                <b>Data do album:</b><asp:Label ID="lbDtEvento" runat="server" Text=""></asp:Label>
            </div>
            <div class="grid_2" style="text-align: right; white-space: nowrap;">
                <% if (IsAdmin)
                   { %>
                <input id="btnOpenUpload" type="button" value="Upload" runat="server" onclick="OpenUploadPhoto();" />
                <%}%>
                &nbsp;
                <input id="btnVoltar" type="button" value="Voltar" onclick="window.location.href='/Administrador/Fotos.aspx'" />
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <asp:Repeater ID="RepeaterFotos" runat="server">
                <ItemTemplate>
                    <% TotalCol++; TotalImgCount++; %>
                    <div class="grid_2">
                        <a href="<%# Eval("Foto") %>" rel="lightbox[roadtrip]" title="<%# Eval("Nome") %>">
                            <img alt="<%= String.Format("Roadtrip: Imagem {0} de {1}",TotalImgCount, TotalImg)  %>"
                                src="<%# Eval("Foto") %>" width="130px" height="100px" />
                        </a>
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
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </asp:Panel>
</asp:Content>
