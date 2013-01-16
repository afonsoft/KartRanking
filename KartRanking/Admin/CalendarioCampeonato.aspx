<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PainelMenu.master" AutoEventWireup="true"
    CodeBehind="CalendarioCampeonato.aspx.cs" Inherits="KartRanking.CalendarioCampeonato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function() {
            $("#accordion").tabs();
        });
    </script>

    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Calendário do Campeonato</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Informações e gerenciamento do campeonato</p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_3">
            <span class="label">Nome Campeonato:</span><asp:HiddenField ID="HiddenIdGrupo" runat="server" />
            <asp:HiddenField ID="HiddenIdCampeonato" runat="server" />
        </div>
        <div class="grid_9">
            <asp:Literal ID="ltNomeCampeonato" runat="server"></asp:Literal>
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_3">
            <span class="label">Dt. Inicio:</span>
        </div>
        <div class="grid_3">
            <asp:Literal ID="ltDtInicio" runat="server"></asp:Literal>
        </div>
        <div class="grid_3">
            <span class="label">Dt. Fim:</span>
        </div>
        <div class="grid_3">
            <asp:Literal ID="ltDtFim" runat="server"></asp:Literal>
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_12">
            <div id="accordion">
                <ul>
                    <li><a href="#tabs-1">Classificação dos Pilotos</a></li>
                    <li><a href="#tabs-2">Classificação das Equipes</a></li>
                    <li><a href="#tabs-3">Calendário de Provas</a></li>
                </ul>
                <div id="tabs-1">
                    <p>
                        Ranking geral dos pilotos do campeonato</p>
                    <div class="template">
                        <asp:GridView ID="gvRankigCampeonato" CssClass="gridview" runat="server" DataKeyNames="idUsuario"
                            EmptyDataText="Nenhuma pontuação encontrada." OnRowCommand="gvEtapas_RowCommand" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderText="Nome" SortExpression="Nome" DataField="Nome" />
                                <asp:BoundField HeaderText="Pontos" SortExpression="Pontos" DataField="Pontos" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div id="tabs-2">
                    <p>
                        Ranking geral das Equipe deste Campeonato</p>
                    <div class="template">
                        <asp:GridView ID="gvRankigEquipe" CssClass="gridview" runat="server" DataKeyNames="idEquipeCampeonato"
                            EmptyDataText="Nenhuma pontuação encontrada." OnRowCommand="gvEtapas_RowCommand" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderText="Equipe" SortExpression="Equipe" DataField="Equipe" />
                                <asp:BoundField HeaderText="Sigla" SortExpression="Sigla" DataField="Sigla" />
                                <asp:BoundField HeaderText="Pontos" SortExpression="Pontos" DataField="Pontos" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div id="tabs-3">
                    <p>
                        Selecione uma etapa para maiores detalhes</p>
                    <p>
                        <asp:Literal ID="ltNovaEtapa" runat="server"></asp:Literal></p>
                    <div class="template">
                        <asp:GridView ID="gvEtapas" CssClass="gridview" runat="server" DataKeyNames="idCalendario"
                            EmptyDataText="Nenhum campeonato neste grupo" OnRowCommand="gvEtapas_RowCommand" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Código</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkCodCalendario" runat="server" CommandArgument='<%# Eval( "idCalendario" )%>'
                                            CommandName="EditCalendario"><%# Eval("idCalendario")%></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Nome</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkNomeCalendario" runat="server" CommandArgument='<%# Eval( "idCalendario" )%>'
                                            CommandName="EditCalendario"><%# Eval("Nome")%></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Data" SortExpression="Data" DataField="Data" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField HeaderText="Kartodromo" SortExpression="Kartodromo" DataField="Kartodromo" />
                                <asp:BoundField HeaderText="Horario" SortExpression="Horario" DataField="Horario" />
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
