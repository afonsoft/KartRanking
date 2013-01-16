<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PainelMenu.master" AutoEventWireup="true"
    CodeBehind="listarGrupos.aspx.cs" Inherits="KartRanking.Admin.listarGrupos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Listar os Grupos</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Visualizar os Grupos ativos no sistemas</p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <div class="template">
                <asp:GridView ID="gvGrupos" AutoGenerateColumns="false" DataKeyNames="idGrupo" CssClass="gridview"
                    runat="server" EmptyDataText="Nenhum grupo disponivel" OnRowCommand="gvGrupos_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Código</HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkCodGrupo" runat="server" CommandArgument='<%# Eval( "idGrupo" )%>'
                                    OnClientClick="return confirm('Deseja entrar nesse grupo?');" CommandName="Entrar"><%# Eval("idGrupo")%></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Sigla</HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkSiglaGrupo" runat="server" CommandArgument='<%# Eval( "idGrupo" )%>'
                                    OnClientClick="return confirm('Deseja entrar nesse grupo?');" CommandName="Entrar"><%# Eval("Sigla")%></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Nome do Grupo</HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkNomeGrupo" runat="server" CommandArgument='<%# Eval( "idGrupo" )%>'
                                    OnClientClick="return confirm('Deseja entrar nesse grupo?');" CommandName="Entrar"><%# Eval("NomeGrupo")%></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Url de Acesso" SortExpression="UrlAcesso" DataField="UrlAcesso" />
                        <asp:BoundField HeaderText="Cidade" SortExpression="Cidade" DataField="Cidade" />
                        <asp:BoundField HeaderText="Estado" SortExpression="Estado" DataField="Estado" />
                        <asp:BoundField HeaderText="Responsavel do Grupo" SortExpression="Responsavel" DataField="Responsavel" />
                        <asp:BoundField HeaderText="Id_Usuario_Lider" SortExpression="Id_Usuario_Lider" DataField="Id_Usuario_Lider"
                            Visible="false" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
    </div>
</asp:Content>
