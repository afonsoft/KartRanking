<%@ Page Title="" Language="C#" MasterPageFile="~/Grupo/KartGrupo.master" AutoEventWireup="true"
    CodeBehind="informacoes.aspx.cs" Inherits="KartRanking.Grupo.informacoes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <div class="container_12">
        <div class="grid_12">
            <h3 class="p2">
                <span class="TitleFont">
                    <img src="/Grupo/ImgTitleHandler.ashx?Text=Regras&f=40" alt="Grupo" />
                </span>
            </h3>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <div id="ExibirRegras" runat="server" style="width: 100%;">
            </div>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
    </div>
</asp:Content>
