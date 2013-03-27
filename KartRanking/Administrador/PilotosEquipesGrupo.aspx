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
                                <ItemStyle HorizontalAlign="Left" />
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
                                <ItemStyle HorizontalAlign="Left" />
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

        <script type="text/javascript">
        function OpenCadastro(op) {

            if (op == 1) {
                var hidden = document.getElementById('<%= HiddenIdEquipeCampeonato.ClientID %>');
                var txtNome = document.getElementById('<%= txtNomeEquipe.ClientID %>');
                var txtSigla = document.getElementById('<%= txtSigla.ClientID %>');
                hidden.value = "0";
                txtNome.value = "";
                txtSigla.value = "";
            }
        
            jQuery('#CadEquipe').dialog({
                autoOpen: false, bgiframe: false, hide: 'explode', resizable: false, draggable: false,
                modal: false, show: 'slide', title: "Aviso",
                buttons: {
                    "Salvar": function() { jQuery('#CadEquipe').dialog("close"); __doPostBack('<%= lnkConfirmar.UniqueID %>', ''); return true; },
                    "Sair": function() { jQuery('#CadEquipe').dialog("close"); return true; }
                }
            });
            jQuery('#CadEquipe').dialog({ width: 300, height: 160 });
            jQuery("#CadEquipe").parent().appendTo(jQuery("form:first"));
            jQuery('#CadEquipe').dialog('open');
        }
        function OpenCampeonato() {

            jQuery('#CopyCampeonatos').dialog({
                autoOpen: false, bgiframe: false, hide: 'explode', resizable: false, draggable: false,
                modal: false, show: 'slide', title: "Aviso",
                buttons: {
                    "Copiar": function() { jQuery('#CopyCampeonatos').dialog("close"); __doPostBack('<%= lnkConfirmarAlter.UniqueID %>', ''); return true; },
                    "Sair": function() { jQuery('#CopyCampeonatos').dialog("close"); return true; }
                }
            });
            jQuery('#CopyCampeonatos').dialog({ width: 350, height: 150 });
            jQuery("#CopyCampeonatos").parent().appendTo(jQuery("form:first"));
            jQuery('#CopyCampeonatos').dialog('open');
        }    
        </script>

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
            <div class="grid_12" style="text-align: right;">
                <input id="Button2" type="button" value="Copiar Equipes" onclick="OpenCampeonato();" />&nbsp;<input
                    id="Button1" type="button" value="Adicionar" onclick="OpenCadastro(1);" />
                <!-- Dialog Cadastro -->
                <asp:HiddenField ID="HiddenIdEquipeCampeonato" runat="server" />
                <div id="CadEquipe" title="Cadastrar / Alterar Equipe" style="display: none; font-size: x-small;
                    color: Black; font-family: Verdana; font-style: normal; font-weight: normal;"
                    class="ui-dialog ui-resizable-handle">
                    <table width="98%" cellpadding="1" cellspacing="1" border="0">
                        <tr>
                            <td>
                                <span><b>Nome:</b></span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNomeEquipe" Width="98%" MaxLength="20" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span><b>Sigla:</b></span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSigla" MaxLength="5" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <div style="display: none;">
                        <asp:LinkButton ID="lnkConfirmar" runat="server" OnClick="lnkConfirmar_Click"></asp:LinkButton>
                    </div>
                </div>
            </div>
            <!-- Fim Dialog Cadastro -->
            <!-- Dialog copiar -->
            <div id="CopyCampeonatos" title="Copiar as equipes" style="display: none; font-size: x-small;
                color: Black; font-family: Verdana; font-style: normal; font-weight: normal;"
                class="ui-dialog ui-resizable-handle">
                <table width="98%" cellpadding="1" cellspacing="1" border="0">
                    <tr>
                        <td>
                            <span><b>Campeonato:</b></span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlTodosCampeonatos" runat="server" Width="100%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <div style="display: none;">
                    <asp:LinkButton ID="lnkConfirmarAlter" runat="server" OnClick="lnkConfirmarAlter_Click"></asp:LinkButton>
                </div>
            </div>
            <!-- Fim -->
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
                                    Sigla</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkCodCalendario" runat="server" CommandArgument='<%# Eval( "idEquipeCampeonato" )%>'
                                        CommandName="EditCalendario"><%# Eval("Sigla")%></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Nome Equipe</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkNomeCalendario" runat="server" CommandArgument='<%# Eval( "idEquipeCampeonato" )%>'
                                        CommandName="EditCalendario"><%# Eval("NomeEquipe")%></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
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
    </asp:Panel>
</asp:Content>
