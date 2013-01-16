<%@ Page Title="" Language="C#" MasterPageFile="~/Grupo/KartGrupo.master" AutoEventWireup="true"
    CodeBehind="index.aspx.cs" Inherits="KartRanking.Grupo.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <link href="css/grid.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:HiddenField ID="HiddenIdGrupo" runat="server" />
    <div class="container_12">
        <div class="wrapper">
            <article class="grid_6">
                	<div class="page1 box maxheight" style="height: auto; min-height:450px; ">
                    	<div class="padding-box">
                        	<div class="indent-bot">
                                <h3 class="p2"><strong class="text-2"><strong><strong>Campeonato</strong></strong></strong></h3>
                                    <asp:Literal ID="ltNomeCampeonato" runat="server"></asp:Literal><br />
                                    <asp:GridView ID="gvCampeonatos" AutoGenerateColumns="false" DataKeyNames="idCampeonato, idUsuario, idGrupo"
                                        CssClass="table" Width="95%" runat="server" EmptyDataText="Nenhum campeonato neste grupo">
                                        <Columns>
                                            <asp:BoundField HeaderText="Nome" SortExpression="Nome" DataField="Nome" ItemStyle-Width="80%" />
                                            <asp:BoundField HeaderText="Pontos" SortExpression="Pontos" DataField="Pontos" ItemStyle-Width="20%" />
                                        </Columns>
                                    </asp:GridView>
                                <div class="border-bot"></div>
                            </div>
                            <a href="#" class="button"><strong><strong>Mais</strong></strong></a>
                        </div>
                    </div>
            </article>
            <article class="grid_6">
                	<div class="page1 box maxheight" style="height: auto; min-height:450px;">
                    	<div class="padding-box">
                            <h3 class="p2"><strong class="text-2"><strong><strong>Etapas</strong></strong></strong></h3>
                            <asp:GridView ID="gvEtapaCampeonatos" AutoGenerateColumns="false" DataKeyNames="idCalendario, idCampeonato"
                                        CssClass="table" Width="95%" runat="server" EmptyDataText="Nenhuma etapa cadastrado">
                                        <Columns>
                                            <asp:BoundField HeaderText="Etapa" SortExpression="Nome" DataField="Nome" ItemStyle-Width="50%" />
                                            <asp:BoundField HeaderText="Data" SortExpression="Data" DataField="Data" ItemStyle-Width="50%" />
                                        </Columns>
                                    </asp:GridView>
                            <a href="#" class="button"><strong><strong>Mais</strong></strong></a>
                        </div>
                    </div>
                </article>
        </div>
    </div>
</asp:Content>
