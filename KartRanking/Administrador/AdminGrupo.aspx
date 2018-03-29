<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="AdminGrupo.aspx.cs" Inherits="KartRanking.Administrador.AdminGrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            $('#<%= txtNomeGrupo.ClientID %>').change(function () {
                $('#<%= txtUrlAcesso.ClientID %>').val($(this).val().split(" ").join(""));
            });

            try {
                $('#<%= txtUrlAcesso.ClientID %>').on("focus", function () {
                    var dest = $(this);
                    dest.val(dest.val().split(" ").join(""));
                });

                $('#<%= txtUrlAcesso.ClientID %>').on("blur", function () {
                    var dest = $(this);
                    dest.val(dest.val().split(" ").join(""));
                });

                $('#<%= txtUrlAcesso.ClientID %>').blur(function () {
                    var dest = $(this);
                    dest.val(dest.val().split(" ").join(""));
                });
            } catch (e) { }
        });
    </script>
    <table width="97%" cellpadding="2" cellspacing="2" border="0">
        <tr>
            <td colspan="6">
                <h3 class="StepTitle">
                    <asp:Literal ID="ltTitulo" runat="server"></asp:Literal></h3>
                <div class="StepSubTitle">
                    <asp:Literal ID="ltDescricao" runat="server"></asp:Literal>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <span class="label">Grupo Destivados:</span>
            </td>
            <td colspan="5">
                <asp:DropDownList ID="ddlGruposDesativados" runat="server" CssClass="text" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlGruposDesativados_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <span class="label">Nome Grupo:</span>
            </td>
            <td colspan="5">
                <asp:TextBox ID="txtNomeGrupo" MaxLength="200" CssClass="text" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <span class="label">Sigla Grupo:</span>
            </td>
            <td colspan="1">
                <asp:TextBox ID="txtSigla" MaxLength="50" CssClass="text" runat="server"></asp:TextBox>
            </td>
            <td colspan="1">
                <span class="label">Permitir Inscrições:</span>
            </td>
            <td colspan="1">
                <asp:DropDownList ID="ddlPermitirInscricoes" runat="server" CssClass="text">
                    <asp:ListItem Selected="true" Text="Sim" Value="true" />
                    <asp:ListItem Text="Não" Value="false" />
                </asp:DropDownList>
            </td>
            <td colspan="1">
                <span class="label">Ativo:</span>
            </td>
            <td colspan="1">
                <asp:DropDownList ID="ddlAtivo" runat="server" CssClass="text">
                    <asp:ListItem Text="Sim" Value="true" />
                    <asp:ListItem Text="Não" Value="false" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <span class="label">Url Acesso:</span>
            </td>
            <td colspan="5">
                <asp:TextBox ID="txtUrlAcesso" MaxLength="50" runat="server" ReadOnly="true" CssClass="text"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <span class="label">Estado:</span>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="text">
                    <asp:ListItem Text="Acre (AC)" Value="AC" />
                    <asp:ListItem Text="Alagoas (AL)" Value="AL" />
                    <asp:ListItem Text="Amapá (AP)" Value="AP" />
                    <asp:ListItem Text="Amazonas (AM)" Value="AM" />
                    <asp:ListItem Text="Bahia (BA)" Value="BA" />
                    <asp:ListItem Text="Ceará (CE)" Value="CE" />
                    <asp:ListItem Text="Distrito Federal (DF)" Value="DF" />
                    <asp:ListItem Text="Espírito Santo (ES)" Value="ES" />
                    <asp:ListItem Text="Goiás (GO)" Value="GO" />
                    <asp:ListItem Text="Maranhão (MA)" Value="MA" />
                    <asp:ListItem Text="Mato Grosso (MT)" Value="MT" />
                    <asp:ListItem Text="Mato Grosso do Sul (MS)" Value="MS" />
                    <asp:ListItem Text="Minas Gerais (MG)" Value="MG" />
                    <asp:ListItem Text="Pará (PA)" Value="PA" />
                    <asp:ListItem Text="Paraíba (PB)" Value="PB" />
                    <asp:ListItem Text="Paraná (PR)" Value="PR" />
                    <asp:ListItem Text="Pernambuco (PE)" Value="PE" />
                    <asp:ListItem Text="Piauí (PI)" Value="PI" />
                    <asp:ListItem Text="Rio de Janeiro (RJ)" Value="RJ" />
                    <asp:ListItem Text="Rio Grande do Norte (RN)" Value="RN" />
                    <asp:ListItem Text="Rio Grande do Sul (RS)" Value="RS" />
                    <asp:ListItem Text="Rondônia (RO)" Value="RO" />
                    <asp:ListItem Text="Roraima (RR)" Value="RR" />
                    <asp:ListItem Text="Santa Catarina (SC)" Value="SC" />
                    <asp:ListItem Text="São Paulo (SP)" Value="SP" />
                    <asp:ListItem Text="Sergipe (SE)" Value="SE" />
                    <asp:ListItem Text="Tocantins (TO)" Value="TO" />
                </asp:DropDownList>
            </td>
            <td colspan="1">
                <span class="label">Cidade:</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtCidade" MaxLength="100" runat="server" CssClass="text"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <a href="ListarGrupos.aspx">
                    <img height="16px" width="16px" src="/images/Group.png" />&nbsp;Associa-se a um
                    grupo</a>
            </td>
            <td colspan="3" style="text-align: right;">
                <asp:CheckBox ID="chkEnviarTodosUsuarios" runat="server" Text="Enviar e-mail de alterações a todos os usuários deste grupo?" />
                &nbsp;<asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click"
                    CssClass="button" />
                &nbsp;<asp:Button ID="btnNovo" runat="server" Text="Novo Grupo" OnClick="btnNovo_Click"
                    OnClientClick="return confirm('Deseja criar um novo grupo?');" CssClass="button" />
                &nbsp;<asp:Button ID="btnEditar" runat="server" Text="Editar Grupo" OnClick="btnEditar_Click"
                    CssClass="button" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                Campeonatos deste grupo
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <div class="template" itemscope itemtype="http://schema.org/Table">
                    <asp:GridView ID="gvCampeonatos" AutoGenerateColumns="false" DataKeyNames="idCampeonato"
                        CssClass="gridview" runat="server" EmptyDataText="Nenhum campeonato neste grupo"
                        OnRowCommand="gvCampeonatos_RowCommand">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Código</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkCodCampeonato" runat="server" CommandArgument='<%# Eval( "idCampeonato" )%>'
                                        CommandName="EditClassif"><%# Eval( "idCampeonato" )%></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Nome do Campeonato</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkNomeCampeonato" runat="server" CommandArgument='<%# Eval( "idCampeonato" )%>'
                                        CommandName="EditClassif"><%# Eval("NomeCampeonato")%></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="dt. Inicio" SortExpression="dtInicio" DataField="dtInicio"
                                DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField HeaderText="dt. Fim" SortExpression="dtFim" DataField="dtFim" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField HeaderText="Ativo" SortExpression="Ativo" DataField="Ativo" />
                            <asp:BoundField HeaderText="idGrupo" SortExpression="idGrupo" DataField="idGrupo"
                                Visible="false" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Editar</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgEditar" ToolTip="Editar o Campeonato" runat="server" Width="16px"
                                        Height="16px" CommandArgument='<%# Eval( "idCampeonato" )%>' ImageUrl="~/images/Edit16px.png"
                                        CommandName="EditCampeonato" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
