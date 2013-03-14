<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="Noticias.aspx.cs" Inherits="KartRanking.Administrador.Noticias" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <link href="/css/jquery-te-1.3.3.css" rel="stylesheet" type="text/css" />
    <script src="/js/jquery-te-1.3.3.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelNoticias" runat="server">
        <div id="OpenCadastro" title="Cadastro de Noticias" style="display: none; font-size: x-small;
            color: Black; font-family: Verdana; font-style: normal; font-weight: normal;"
            class="ui-dialog ui-resizable-handle">
            <div class="container_12">
                <div class="grid_2">
                    <b>Titulo:</b>
                </div>
                <div class="grid_10">
                    <asp:TextBox ID="txtTitulo" MaxLength="100" Width="100%" runat="server"></asp:TextBox>
                </div>
                <div class="clear espaco_mini">
                    &nbsp;
                </div>
                <div class="grid_12">
                    <textarea name="textarea" id="textarea" cols="100" rows="100" runat="server" class="jqte"
                        style="width: 100%; height: 400px;">
                </textarea>
                </div>
                <div class="clear espaco">
                    &nbsp;
                </div>
            </div>
            <div style="display: none;">
                <asp:LinkButton ID="lnkCadastrar" runat="server" OnClick="lnkCadastrar_Click"></asp:LinkButton>
                <asp:HiddenField ID="HiddenFieldIdNoticia" runat="server" />
            </div>
        </div>

        <script type="text/javascript">
            $('.jqte').jqte();

            function CadastrarNoticia() {
                $('#OpenCadastro').dialog({
                    autoOpen: false, hide: 'explode', modal: false, show: 'slide',
                    buttons: {
                        "Salvar": function() {
                            $('#OpenCadastro').dialog("close");
                            __doPostBack('<%= lnkCadastrar.UniqueID %>', '');
                            return true;
                        },
                        "Sair": function() { $('#OpenCadastro').dialog("close"); return true; }
                    }
                });
                $('#OpenCadastro').dialog({ width: 750, height: 500 });
                $('#OpenCadastro').parent().appendTo($("form:first"));
                $('#OpenCadastro').dialog('open');
            }
        </script>

        <div class="container_12">
            <div class="grid_12">
                <h3 class="titulo">
                    Noticias</h3>
                <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                    Gerenciamento das noticias deste grupo</p>
                <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                    border-right: #ccc 1px dashed;" />
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_12" style="text-align: right;">
                <asp:Button ID="btnAddNoticias" runat="server" Text="Adicionar Noticias" OnClick="btnAddNoticias_Click" />
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
                <asp:Repeater ID="RptNoticias" runat="server" OnItemCommand="RptNoticias_ItemCommand">
                    <ItemTemplate>
                        <table width="100%" cellpadding="2" cellspacing="2" border="0">
                            <tr>
                                <td colspan="2">
                                    <h3>
                                        <%# Eval("Titulo") %><span style="font-size: xx-small; font-style: normal;">&nbsp;-&nbsp;por:
                                            &nbsp;<%# Eval("Nome") %>&nbsp;-&nbsp;em:&nbsp;<%# Convert.ToDateTime(Eval("dtCriacao")).ToString("dd/MM/yyy") %></span></h3>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>
                                        <%# Eval("Noticia") %></span>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">
                                    <asp:LinkButton ID="lnkRead" runat="server" CommandName="VerNoticia" CommandArgument='<%# Eval("idNoticias") %>'>Continuar Lendo...</asp:LinkButton>
                                </td>
                                <td style="text-align: right;">
                                    <asp:Button ID="btnAlterar" runat="server" Text="Alterar" CommandName="Alterar" CommandArgument='<%# Eval("idNoticias") %>' />
                                    &nbsp;<asp:Button ID="btnRemover" runat="server" Text="Deletar" CommandName="Deletar"
                                        CommandArgument='<%# Eval("idNoticias") %>' OnClientClick="return confirm('Deseja remover esta noticia?');" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
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
                <h3 class="titulo">
                    Noticias</h3>
                <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                    Informações da noticias selecionada</p>
                <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                    border-right: #ccc 1px dashed;" />
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_12" style="text-align: right;">
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" OnClick="btnVoltar_Click" />
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
            <div class="clear espaco_mini">
                &nbsp;
            </div>
        </div>
    </asp:Panel>
</asp:Content>
