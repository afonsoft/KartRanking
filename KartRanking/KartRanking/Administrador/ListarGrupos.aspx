<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="ListarGrupos.aspx.cs" Inherits="KartRanking.Administrador.ListarGrupos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Lista de Grupos</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Associa-se a um grupo</p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <b>Grupos associados</b>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <div class="template">
                <asp:GridView ID="gvGruposAssociados" AutoGenerateColumns="false" DataKeyNames="idGrupo"
                    CssClass="gridview" runat="server" EmptyDataText="Nenhum campeonato neste grupo"
                    OnRowCommand="gvGrupos_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="NomeGrupo" SortExpression="NomeGrupo" HeaderText="Nome do Grupo" />
                        <asp:BoundField DataField="Sigla" SortExpression="Sigla" HeaderText="Sigla" />
                        <asp:BoundField DataField="Cidade" SortExpression="Cidade" HeaderText="Cidade" />
                        <asp:BoundField DataField="Estado" SortExpression="Estado" HeaderText="Estado" />
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Ativo</HeaderTemplate>
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("Ativo")) == true ? "Sim" : "Não" %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Url</HeaderTemplate>
                            <ItemTemplate>
                                <a href='/Grupo/<%# Eval("UrlAcesso")%>'>
                                    <%# Eval("UrlAcesso")%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="dtCriacao" SortExpression="dtCriacao" HeaderText="dtCriacao"
                            DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Sair</HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkSair" runat="server" CommandArgument='<%# Eval("idGrupo")%>'
                                    CommandName="Sair">Sair</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <b>Grupos Disponiveis</b>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_2">
            <b>Nome</b>
        </div>
        <div class="grid_7">
            <asp:TextBox ID="txtFiltrar" Width="98%" runat="server"></asp:TextBox>
        </div>
        <div class="grid_3">
            <asp:Button ID="btnConsultar" runat="server" Text="Consultar" />
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <div class="template">
                <asp:GridView ID="gvGruposDisponiveis" AutoGenerateColumns="false" DataKeyNames="idGrupo"
                    CssClass="gridview" runat="server" EmptyDataText="Nenhum campeonato neste grupo"
                    AllowPaging="true" OnRowCommand="gvGrupos_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="NomeGrupo" SortExpression="NomeGrupo" HeaderText="Nome do Grupo" />
                        <asp:BoundField DataField="Sigla" SortExpression="Sigla" HeaderText="Sigla" />
                        <asp:BoundField DataField="Cidade" SortExpression="Cidade" HeaderText="Cidade" />
                        <asp:BoundField DataField="Estado" SortExpression="Estado" HeaderText="Estado" />
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Ativo</HeaderTemplate>
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("Ativo")) == true ? "Sim" : "Não" %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Url</HeaderTemplate>
                            <ItemTemplate>
                                <a href='/Grupo/<%# Eval("UrlAcesso")%>'>
                                    <%# Eval("UrlAcesso")%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="dtCriacao" SortExpression="dtCriacao" HeaderText="dtCriacao"
                            DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Associar-se</HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkSair" runat="server" CommandArgument='<%# Eval("idGrupo")%>'
                                    CommandName="Associar">Associar-se</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
    </div>
</asp:Content>
