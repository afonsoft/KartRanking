<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PainelMenu.master" AutoEventWireup="true"
    CodeBehind="PermissoesGrupo.aspx.cs" Inherits="KartRanking.PermissoesGrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Permissões de um Grupo</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Informações dos pilotos e administradores do Grupo</p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_4">
            <span class="label">Selecione o grupo:</span>
        </div>
        <div class="grid_8">
            <asp:DropDownList ID="ddlGrupos" runat="server" Width="98%" AutoPostBack="true" OnSelectedIndexChanged="ddlGrupos_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Grupo:</span>
        </div>
        <div class="grid_6">
            <asp:Literal ID="ltGrupoNome" runat="server"></asp:Literal>
        </div>
        <div class="grid_2">
            <span class="label">Sigla:</span>
        </div>
        <div class="grid_2">
            <asp:Literal ID="ltGrupoSigla" runat="server"></asp:Literal>
        </div>
        <div class="clear espaco">
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
