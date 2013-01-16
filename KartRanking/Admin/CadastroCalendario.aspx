<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PainelMenu.master" AutoEventWireup="true"
    CodeBehind="CadastroCalendario.aspx.cs" Inherits="KartRanking.CadastroCalendario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $('#<%= ltData.ClientID %>').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy',
                dayNames: ['Domingo', 'Segunda', 'Ter&ccedil;a', 'Quarta', 'Quinta', 'Sexta', 'S&aacute;bado', 'Domingo'],
                dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
                dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'S&aacute;b', 'Dom'],
                monthNames: ['Janeiro', 'Fevereiro', 'Mar&ccedil;o', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
                nextText: 'Pr&oacute;ximo',
                prevText: 'Anterior',
                showAnim: 'slideDown'
            });

            $('#<%= ltHora.ClientID %>').mask("99:99");
        });
    </script>

    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Resultado da Etapa</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Visualizar e editar os resultados da etapa</p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Grupo:</span><asp:HiddenField ID="HiddenIdGrupo" runat="server" />
            <asp:HiddenField ID="HiddenIdCampeonato" runat="server" />
            <asp:HiddenField ID="HiddenIdCalendario" runat="server" />
        </div>
        <div class="grid_4">
            <asp:Literal ID="ltNomeGrupo" runat="server"></asp:Literal>
        </div>
        <div class="grid_2">
            <span class="label">Campeonato:</span>
        </div>
        <div class="grid_4">
            <asp:Literal ID="ltNomeCampeonato" runat="server"></asp:Literal>
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Etapa:</span>
        </div>
        <div class="grid_4">
            <asp:TextBox ID="ltEtapa" runat="server" MaxLength="20"></asp:TextBox>
        </div>
        <div class="grid_2">
            <span class="label">Data / Horário:</span>
        </div>
        <div class="grid_4">
            <asp:TextBox ID="ltData" runat="server" MaxLength="10" Width="100px"></asp:TextBox>&nbsp;
            <asp:TextBox ID="ltHora" runat="server" MaxLength="8" Width="50px"></asp:TextBox>
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Kartódromo:</span>
        </div>
        <div class="grid_4">
            <asp:TextBox ID="ltKartodromo" runat="server" MaxLength="150"></asp:TextBox>
        </div>
        <div class="grid_2">
            <span class="label">Circuito:</span>
        </div>
        <div class="grid_4">
            <asp:TextBox ID="ltCircuito" runat="server" MaxLength="20"></asp:TextBox>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <asp:Panel ID="pnlAdminEtapa" runat="server" DefaultButton="btnVoltar" Visible="false">
                <div class="container_12">
                    <div class="grid_2">
                        <asp:Button ID="btnVoltar" runat="server" Text="Voltar" OnClick="btnVoltar_Click"
                            Width="80px" /></div>
                    <div class="grid_2">
                        <asp:Button ID="btnAlterar" runat="server" Text="Alterar" OnClick="btnAlterar_Click"
                            Width="80px" /></div>
                    <div class="grid_2">
                        <asp:Button ID="BtnExcluir" runat="server" Text="Excluir" Width="80px" OnClick="BtnExcluir_Click"
                            OnClientClick="return confirm('Deseja excluir este grupo e todos os seus apontamentos?\n\nAo excluir, serão excluido os seguintes itens:\n*Grid desta Etapa\n*Resultado desta Etapa\n\nNão será possivel recuperar os valores após a exclusão.');" /></div>
                    <div class="grid_6">
                        &nbsp;</div>
                    <div class="clear espaco">
                        &nbsp;
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelAdminCadastro" runat="server" Visible="false">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="120px" OnClick="btnSalvar_Click" />
            </asp:Panel>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <div class="container_12">
                <asp:Panel ID="pnlAdminEtapa1" runat="server" Visible="false">
                    <div class="grid_12">
                        <asp:Literal ID="ltGrid" runat="server"></asp:Literal>
                    </div>
                    <div class="clear espaco_mini">
                        &nbsp;
                    </div>
                    <div class="grid_12">
                        <div class="template">
                            <asp:GridView ID="gvGrid" CssClass="gridview" runat="server" EmptyDataText="Nenhum campeonato neste grupo"
                                DataKeyNames="idGrid, idCalendario" OnRowCommand="gvGrid_RowCommand" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField HeaderText="Pos" SortExpression="Pos" DataField="Pos" />
                                    <asp:BoundField HeaderText="Nome Piloto" SortExpression="Nome" DataField="Nome" />
                                    <asp:BoundField HeaderText="Nome Equipe" SortExpression="NomeEquipe" DataField="NomeEquipe" />
                                    <asp:BoundField HeaderText="Tempo" SortExpression="tempo" DataField="tempo" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="clear espaco">
                        &nbsp;
                    </div>
                    <div class="grid_12">
                        <asp:Literal ID="ltResultados" runat="server"></asp:Literal>
                    </div>
                    <div class="clear espaco_mini">
                        &nbsp;
                    </div>
                    <div class="grid_12">
                        <div class="template">
                            <asp:GridView ID="gvResultados" CssClass="gridview" runat="server" EmptyDataText="Nenhum campeonato neste grupo"
                                DataKeyNames="idResultado, idCalendario" OnRowCommand="gvResultados_RowCommand"
                                AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField HeaderText="Pos" SortExpression="Pos" DataField="Pos" />
                                    <asp:BoundField HeaderText="Nome Piloto" SortExpression="Nome" DataField="Nome" />
                                    <asp:BoundField HeaderText="Nome Equipe" SortExpression="NomeEquipe" DataField="NomeEquipe" />
                                    <asp:BoundField HeaderText="Tempo" SortExpression="tempo" DataField="tempo" />
                                    <asp:BoundField HeaderText="Ponto" SortExpression="Ponto" DataField="Ponto" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="clear espaco_mini">
                        &nbsp;
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            &nbsp;
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
    </div>
</asp:Content>
