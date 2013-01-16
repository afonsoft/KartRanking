<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PainelMenu.master" AutoEventWireup="true"
    CodeBehind="PainelControle.aspx.cs" Inherits="KartRanking.PainelControle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Painel de Controle e Informações dos Grupos e Campeonatos</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Visualizar as informações do grupo e campeonatos</p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_1">
            <span class="label">Grupo:</span><asp:HiddenField ID="HiddenidGrupo" runat="server" />
        </div>
        <div class="grid_5">
            <asp:DropDownList ID="ddlGrupos" runat="server" Width="98%" AutoPostBack="true" OnSelectedIndexChanged="ddlGrupos_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="grid_3">
            <span class="label"><a href="listarGrupos.aspx">
                <img width="32px" height="32px" title="Associar-se a um Grupo existente" alt="Associar-se a um Grupo existente"
                    src="/images/GrupoSearch.png" />&nbsp;Associar-se</a></span>
        </div>
        <div class="grid_3">
            <span class="label"><a href="CadastroGrupo.aspx">
                <img width="32px" height="32px" title="Criar um Grupos" alt="Criar um Grupo" src="/images/Grupoadd.png" />&nbsp;Criar
                um Grupo</a></span>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <h3 class="titulo">
                Lista de Campeonatos</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Visualizar os campeonatos para este grupo</p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_3">
            <span class="label">Grupo Selecionado:</span>
        </div>
        <div class="grid_9">
            <span class="label">
                <asp:Literal ID="ltNomeGrupo" runat="server"></asp:Literal></span>
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_3">
            <span class="label">Sigla do Grupo:</span>
        </div>
        <div class="grid_9">
            <span class="label">
                <asp:Literal ID="ltSiglaGrupo" runat="server"></asp:Literal></span>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <% if (IsAdmin)
               { %>
            <span class="label"><a href='CadastroCampeonato.aspx?idGrupo=<%= HiddenidGrupo.Value %>'>
                <img title="Criar um Campeonato" alt="Criar um Campeonato" src="/images/Trophy_Gold.png"
                    width="32px" height="32px" />&nbsp;
                Criar um Campeonato</a></span>
            <%} %>
            &nbsp;
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_12">
            <div class="template">
                <asp:GridView ID="gvCampeonatos" AutoGenerateColumns="false" DataKeyNames="idCampeonato"
                    CssClass="gridview" runat="server" EmptyDataText="Nenhum campeonato neste grupo"
                    OnRowCommand="gvCampeonatos_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Código</HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkCodCampeonato" runat="server" CommandArgument='<%# Eval( "idCampeonato" )%>'
                                    CommandName="EditCampeonato"><%# Eval( "idCampeonato" )%></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Nome do Campeonato</HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkNomeCampeonato" runat="server" CommandArgument='<%# Eval( "idCampeonato" )%>'
                                    CommandName="EditCampeonato"><%# Eval("NomeCampeonato")%></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="dt. Inicio" SortExpression="dtInicio" DataField="dtInicio"
                            DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField HeaderText="dt. Fim" SortExpression="dtFim" DataField="dtFim" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField HeaderText="Ativo" SortExpression="Ativo" DataField="Ativo" />
                        <asp:BoundField HeaderText="idGrupo" SortExpression="idGrupo" DataField="idGrupo"
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
