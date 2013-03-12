<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="PilotosEquipesGrupo.aspx.cs" Inherits="KartRanking.Administrador.PilotosEquipesGrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelPilotos" runat="server">
        <div class="container_12">
            <div class="grid_12">
                <h3 class="titulo">
                    Pilotos do Grupo</h3>
                <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                    Informações e gerenciamento dos pilotos</p>
                <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                    border-right: #ccc 1px dashed;" />
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_3">
                <span class="label">Campeonato Selecionado:</span>
            </div>
            <div class="grid_9">
                <asp:DropDownList ID="ddlCampeonatos1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCampeonatos_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
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
                                        CommandName="ViewEquipe"><%# Eval("NomeEquipe")%></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEquipes" runat="server" DataSourceID="LinqDataSource1" DataTextField="NomeEquipe"
                                        DataValueField="idEquipeCampeonato">
                                    </asp:DropDownList>
                                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="KartRanking.BaseDados.DataKartDataContext"
                                        OrderBy="NomeEquipe" Select="new (idEquipeCampeonato, NomeEquipe)" TableName="Kart_Equipe_Campeonatos"
                                        Where="idCampeonato == @idCampeonato">
                                        <WhereParameters>
                                            <asp:ControlParameter ControlID="ddlCampeonatos1" Name="idCampeonato" PropertyName="SelectedValue"
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
                <div class="clear espaco">
                    &nbsp;
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelEquipes" runat="server">
        <div class="container_12">
            <div class="grid_12">
                <h3 class="titulo">
                    Equipes do Grupo</h3>
                <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                    Informações e gerenciamento das equipes</p>
                <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                    border-right: #ccc 1px dashed;" />
            </div>
            <div class="clear espaco">
                &nbsp;
            </div>
            <div class="grid_3">
                <span class="label">Campeonato Selecionado:</span>
            </div>
            <div class="grid_9">
                <asp:DropDownList ID="ddlCampeonatos2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCampeonatos_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
            <div class="grid_12">
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
            <div class="clear espaco">
                &nbsp;
            </div>
        </div>
        <asp:HiddenField ID="HiddenIdEquipeCampeonato" runat="server" />
    </asp:Panel>
</asp:Content>
