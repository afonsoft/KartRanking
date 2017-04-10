<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="PermissaoGrupo.aspx.cs" Inherits="KartRanking.Administrador.PermissaoGrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <div class="container_12">
        <div class="grid_12">
            <h3 class="StepTitle">
                Permissões do Grupo</h3>
            <div class="StepSubTitle">
                Gerenciar os administradores deste grupo</div>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <span class="label">Administradores</span>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <div class="template">
                <asp:GridView ID="gvUsuariosAdmin" CssClass="gridview" runat="server" EmptyDataText="Nenhum usuario neste grupo"
                    DataKeyNames="idUsuario" OnRowCommand="gv_RowCommand" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="Nome Piloto" SortExpression="Nome" DataField="Nome" />
                        <asp:BoundField HeaderText="Apelido" SortExpression="Apelido" DataField="Apelido" />
                        <asp:BoundField HeaderText="E-Mail" SortExpression="Email" DataField="Email" />
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Excluir</HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkExcluir" CommandName="Excluir" CommandArgument='<%# Bind("idUsuario") %>'
                                    runat="server">Excluir</asp:LinkButton></ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <span class="label">Não Administradores</span>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <div class="template">
                <asp:GridView ID="gvUsuariosNAdmin" CssClass="gridview" runat="server" EmptyDataText="Nenhum usuario neste grupo"
                    DataKeyNames="idUsuario" OnRowCommand="gv_RowCommand" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="Nome Piloto" SortExpression="Nome" DataField="Nome" />
                        <asp:BoundField HeaderText="Apelido" SortExpression="Apelido" DataField="Apelido" />
                        <asp:BoundField HeaderText="E-Mail" SortExpression="Email" DataField="Email" />
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Incluir</HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkIncluir" CommandName="Incluir" CommandArgument='<%# Bind("idUsuario") %>'
                                    runat="server">Incluir</asp:LinkButton></ItemTemplate>
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
