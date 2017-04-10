<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true" CodeBehind="InformacoesGrupos.aspx.cs" Inherits="KartRanking.Administrador.InformacoesGrupos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <div class="container_12">
        <div class="grid_12">
            <h3 class="StepTitle">Informações dos Grupos</h3>
            <div class="StepSubTitle">
                Top 100 Grupos ativos do sistema
            </div>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <asp:Repeater ID="rptGrupos" runat="server">
                <HeaderTemplate>
                    <table style="width: 100%" cellpadding="2" cellspacing="2">
                        <tr>
                            <td style="width: 80%;"><b>Nome do Grupo</b></td>
                            <td style="width: 20%;"><b>Sigla</b></td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td style="width: 80%;"><a href="<%# Eval("URL") %>" target="_blank"><%# Eval("Nome") %></a></td>
                        <td style="width: 20%;"><a href="<%# Eval("URL") %>" target="_blank"><%# Eval("Sigla") %></a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
    </div>
</asp:Content>
