<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PainelMenu.master" AutoEventWireup="true"
    CodeBehind="InscricoesGrupo.aspx.cs" Inherits="KartRanking.InscricoesGrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">

    <script type="text/javascript">
        $(function() {
            $("#tabs").tabs();
            //$("#tabs").tabs( "select" , 2 );
        });
    </script>

    <asp:HiddenField ID="idGrupo" runat="server" />
    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Inscrições de usuário ao grupo</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Informações dos pilotos que inscreveram-se para participar deste grupo</p>
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
            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1">Aprovar solicitações de associação</a></li>
                    <li><a href="#tabs-2">Cadastrar um usuário ao grupo</a></li>
                    <li><a href="#tabs-3">Remover um usuário</a></li>
                </ul>
                <div id="tabs-1">
                    <div class="template">
                        <asp:GridView ID="gvUsuariosAdmin" CssClass="gridview" runat="server" EmptyDataText="Nenhum usuario pendente"
                            DataKeyNames="idUsuario" OnRowCommand="gv_RowCommand" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField HeaderText="Nome Piloto" SortExpression="Nome" DataField="Nome" />
                                <asp:BoundField HeaderText="Apelido" SortExpression="Apelido" DataField="Apelido" />
                                <asp:BoundField HeaderText="E-Mail" SortExpression="Email" DataField="Email" />
                                <asp:BoundField HeaderText="Telefone" SortExpression="Telefone" DataField="Telefone" />
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Aprovar</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkAprovar" CommandName="Aprovar" CommandArgument='<%# Bind("idUsuario") %>'
                                            runat="server">Aprovar</asp:LinkButton></ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div id="tabs-2">
                    <div class="container_12">
                        <div class="grid_1">
                            E-Mail
                        </div>
                        <div class="grid_8">
                            <asp:TextBox ID="txtEmailNovoUsuario" MaxLength="200" runat="server"></asp:TextBox>
                        </div>
                        <div class="grid_2">
                            <asp:Button ID="btnAddUsuarioGrupo" runat="server" Text="Convidar" OnClick="btnAddUsuarioGrupo_Click" />
                        </div>
                        <div class="clear">
                            &nbsp;
                        </div>
                    </div>
                </div>
                <div id="tabs-3">
                  <div class="template">
                <asp:GridView ID="gvPilotos" CssClass="gridview" runat="server" DataKeyNames="idUsuario"
                            EmptyDataText="Nenhuma equipe neste grupo" OnRowCommand="gvPilotos_RowCommand"
                            AutoGenerateColumns="False" >
                            <Columns>
                                <asp:BoundField HeaderText="" Visible="false" DataField="idUsuario" />
                                <asp:BoundField HeaderText="Piloto" DataField="Nome" />
                                <asp:BoundField HeaderText="E-Mail" DataField="Email" />
                                <asp:BoundField HeaderText="Equipe" DataField="NomeEquipe" />
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" Width="50px" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkExluir" CommandArgument='<%# Eval("idUsuario") %>' CommandName="Exluir"
                                            OnClientClick="return confirm('Será excluido todos os histórico deste usuário.\nNão será reordenado as possições do grid e dos resultados!\n\nDeseja excluir este usuário?');"
                                            runat="server">Excluir</asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        </div>
                </div>
            </div>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
    </div>
</asp:Content>
