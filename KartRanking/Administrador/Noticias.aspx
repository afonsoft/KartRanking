<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="Noticias.aspx.cs" Inherits="KartRanking.Administrador.Noticias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <link href="/css/jquery-te-1.3.3.css" rel="stylesheet" type="text/css" />
    <script src="/js/jquery-te-1.3.3.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelNoticias" runat="server">
    
    <script type="text/javascript">
        function CadastrarNoticia() {
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
                <asp:Button ID="btnAddNoticias" runat="server" Text="Adicionar Noticias" 
                    onclick="btnAddNoticias_Click" />
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
                                        <%# Eval("Titulo") %><span style="font-size: xx-small; font-style:normal;">&nbsp;-&nbsp;por: &nbsp;<%# Eval("Nome") %>&nbsp;-&nbsp;em:&nbsp;<%# Convert.ToDateTime(Eval("dtCriacao")).ToString("dd/MM/yyy") %></span></h3>
                                    
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
                                    <asp:Button ID="btnRemover" runat="server" Text="Deletar" CommandName="Deletar" CommandArgument='<%# Eval("idNoticias") %>'
                                        OnClientClick="return confirm('Deseja remover esta noticia?');" />
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
