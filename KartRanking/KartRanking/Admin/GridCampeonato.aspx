﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PainelMenu.master" AutoEventWireup="true" CodeBehind="GridCampeonato.aspx.cs" Inherits="KartRanking.GridCampeonato" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Grid da Etapa</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Visualizar e editar o Grid de lagarda da etapa</p>
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
            <asp:Literal ID="ltEtapa" runat="server"></asp:Literal>
        </div>
        <div class="grid_2">
            <span class="label">Data / Horário:</span>
        </div>
        <div class="grid_4">
            <asp:Literal ID="ltDataHora" runat="server"></asp:Literal>
        </div>
        <div class="clear ">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Kartódromo:</span>
        </div>
        <div class="grid_4">
            <asp:Literal ID="ltKartodromo" runat="server"></asp:Literal>
        </div>
        <div class="grid_2">
            <span class="label">Circuito:</span>
        </div>
        <div class="grid_4">
            <asp:Literal ID="ltCircuito" runat="server"></asp:Literal>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <asp:Panel ID="pnlAddResult" runat="server" Visible="false">

                <script type="text/javascript">
                    $(document).ready(function() {
                        $('#<%= txtTempo.ClientID%>').mask("99:99:999");
                    });
                </script>

                <div class="container_12">
                    <div class="clear espaco">
                        &nbsp;
                    </div>
                    <div class="grid_12">
                        <p>
                            Cadastro / Alteração</p>
                    </div>
                    <div class="clear espaco_mini">
                        &nbsp;
                    </div>
                    <div class="grid_1">
                        <label>
                            Posição</label><br />
                        <asp:TextBox ID="txtPos" MaxLength="2" runat="server"></asp:TextBox>
                    </div>
                    <div class="grid_6">
                        <label>
                            Piloto</label><br />
                        <asp:DropDownList ID="ddlPilotoDisponivel" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="grid_2">
                        <label>
                            Tempo</label><br />
                        <asp:TextBox ID="txtTempo" MaxLength="10" runat="server"></asp:TextBox>
                    </div>
                    <div class="grid_1">
                    &nbsp;
                    </div>
                    <div class="grid_2">
                        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
                        <asp:HiddenField ID="HiddenIdGrid" runat="server" />
                    </div>
                    <div class="clear espaco">
                        &nbsp;
                    </div>
                </div>
            </asp:Panel>
        </div>
        <div class="grid_12">
            <div class="template">
                <asp:GridView ID="gvGrids" CssClass="gridview" runat="server" EmptyDataText="Nenhum campeonato neste grupo"
                    DataKeyNames="idGrid, idCalendario" OnRowCommand="gvGrids_RowCommand" AutoGenerateColumns="false"
                    OnRowCreated="gvGrids_RowCreated">
                    <Columns>
                        <asp:BoundField HeaderText="Pos" SortExpression="Pos" DataField="Pos" />
                        <asp:BoundField HeaderText="Nome Piloto" SortExpression="Nome" DataField="Nome" />
                        <asp:BoundField HeaderText="Nome Equipe" SortExpression="NomeEquipe" DataField="NomeEquipe" />
                        <asp:BoundField HeaderText="Tempo" SortExpression="tempo" DataField="tempo" />
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Opções</HeaderTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkExluir" CommandArgument='<%# Eval("idGrid") %>' CommandName="Exluir"
                                    OnClientClick="return confirm('Deseja excluir?');" runat="server">Exluir</asp:LinkButton>&nbsp;|&nbsp;
                                <asp:LinkButton ID="lnkAlterar" CommandArgument='<%# Eval("idGrid") %>' CommandName="Alterar"
                                    runat="server">Alterar</asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
