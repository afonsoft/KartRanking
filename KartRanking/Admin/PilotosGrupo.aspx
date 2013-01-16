<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PainelMenu.master" AutoEventWireup="true"
    CodeBehind="PilotosGrupo.aspx.cs" Inherits="KartRanking.PilotosGrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $("#accordion").tabs();
        });

        function OpenCadastro() {
            $(document).ready(function() {
                if ($("#Incluir").is(":hidden")) {
                    $("#Incluir").slideDown(500);
                } else {
                    $("#Incluir").slideUp(500);
                }
                $("#accordion").tabs("select", 1);
            });
        }
    </script>

    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Pilotos do Grupo / Equipes</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Informações dos pilotos e Equipes</p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Grupo:</span><asp:HiddenField ID="HiddenidGrupo" runat="server" />
        </div>
        <div class="grid_4">
            <asp:DropDownList ID="ddlGrupos" runat="server" Width="98%" AutoPostBack="true" OnSelectedIndexChanged="ddlGrupos_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="grid_2">
            <span class="label">Campeonato:</span><asp:HiddenField ID="HiddenidCampeonato" runat="server" />
        </div>
        <div class="grid_4">
            <asp:DropDownList ID="ddlCampeonato" runat="server" Width="98%" AutoPostBack="true"
                OnSelectedIndexChanged="ddlCampeonato_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <% if (IsAdmin)
               { %>
            <span class="label"><a href="InscricoesGrupo.aspx?idGrupo=<%=ddlGrupos.SelectedValue%>&tab=1">
                <img width="24px" height="24px" src="/images/Motorsport_Helmet.png" title="Adicionar piloto ao grupo"
                    alt="Adicionar piloto ao grupo" />Adicionar piloto</a></span>
            <%} %>
            <div id="accordion">
                <ul>
                    <li><a href="#tabs-1">Pilotos do Campeonato</a></li>
                    <li><a href="#tabs-2">Equipes</a></li>
                </ul>
                <div id="tabs-1">
                    <p>
                        Associa-lo a uma equipe</p>
                    <div class="template">
                        <asp:GridView ID="gvPilotos" CssClass="gridview" runat="server" DataKeyNames="idUsuario"
                            EmptyDataText="Nenhuma equipe neste grupo" OnRowCommand="gvPilotos_RowCommand"
                            AutoGenerateColumns="False" OnRowEditing="gvPilotos_RowEditing" OnRowUpdating="gvPilotos_RowUpdating"
                            OnRowCancelingEdit="gvPilotos_RowCancelingEdit">
                            <Columns>
                                <asp:BoundField HeaderText="" Visible="false" DataField="idUsuario" />
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Piloto</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkCodCalendario" runat="server" CommandArgument='<%# Eval( "idUsuario" )%>'
                                            CommandName="ViewPilotoInfo"><%# Eval("Nome")%></asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <span>
                                            <%# Eval("Nome")%></span>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Equipe</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkNomeCalendario" runat="server" CommandArgument='<%# Eval( "idUsuario" )%>'
                                            CommandName="ViewPiloto"><%# Eval("NomeEquipe")%></asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlEquipes" runat="server" DataSourceID="LinqDataSource1" DataTextField="NomeEquipe"
                                            DataValueField="idEquipeCampeonato">
                                        </asp:DropDownList>
                                        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="KartRanking.BaseDados.DataKartDataContext"
                                            OrderBy="NomeEquipe" Select="new (idEquipeCampeonato, NomeEquipe)" TableName="Kart_Equipe_Campeonatos"
                                            Where="idCampeonato == @idCampeonato">
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ddlCampeonato" Name="idCampeonato" PropertyName="SelectedValue"
                                                    Type="Int32" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:CommandField EditText="Alterar" ShowEditButton="True" UpdateText="Salvar" CancelText="Cancelar"
                                    HeaderStyle-Width="50px">
                                    <HeaderStyle Width="50px"></HeaderStyle>
                                </asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div id="tabs-2">
                    <p>
                        Gerencia / Criar uma equipe</p>
                    <a href="#" onclick="OpenCadastro();"><img alt="Incluir" src="/images/Motorsport_Helmet.png" width="16px" height="16px"/>Incluir</a>
                    <div id="Incluir" style="width: 100%; display: none;">
                        <div class="container_12">
                            <div class="grid_3">
                                <span class="label">Nome da Equipe:</span><asp:HiddenField ID="HiddenIdEquipeCampeonato"
                                    runat="server" />
                            </div>
                            <div class="grid_4">
                                <asp:TextBox ID="txtNomeEquipe" MaxLength="100" runat="server"></asp:TextBox>
                            </div>
                            <div class="grid_2">
                                <span class="label">Sigla:</span>
                            </div>
                            <div class="grid_1">
                                <asp:TextBox ID="txtSigla" MaxLength="10" runat="server"></asp:TextBox>
                            </div>
                            <div class="grid_2">
                                <asp:Button ID="btnSalvarEquipeGrupo" runat="server" Text="Salvar" OnClick="btnSalvarEquipeGrupo_Click" />
                            </div>
                            <div class="clear espaco_mini">
                                &nbsp;
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="template">
                        <asp:GridView ID="gvEquipes" CssClass="gridview" runat="server" DataKeyNames="idEquipeCampeonato"
                            EmptyDataText="Nenhuma equipe neste grupo" OnRowCommand="gvEquipes_RowCommand"
                            AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Siga</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkCodCalendario" runat="server" CommandArgument='<%# Eval( "idEquipeCampeonato" )%>'
                                            CommandName="EditCalendario"><%# Eval("Sigla")%></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Nome Equipe</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkNomeCalendario" runat="server" CommandArgument='<%# Eval( "idEquipeCampeonato" )%>'
                                            CommandName="EditCalendario"><%# Eval("NomeEquipe")%></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" Width="50px" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkExluir" CommandArgument='<%# Eval("idEquipeCampeonato") %>'
                                            CommandName="Exluir" OnClientClick="return confirm('Deseja excluir a Equipe?\nOs pontos da equipe e do piloto serão apagados!');"
                                            runat="server">Excluir</asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
        </div>
    </div>
</asp:Content>
