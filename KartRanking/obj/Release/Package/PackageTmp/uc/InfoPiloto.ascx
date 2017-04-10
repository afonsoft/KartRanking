<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InfoPiloto.ascx.cs"
    Inherits="KartRanking.uc.InfoPiloto" %>
<link href="../css/960Grid.css" rel="stylesheet" type="text/css" />
<div style="border: solid 1px #000; width: 400px; max-width: 400px;">
    <asp:HyperLink ID="lnkUsuario" runat="server">
        <div class="container_12">
            <div class="grid_4">
                <div class="container_12">
                    <div class="grid_12">
                        <div style="width: 100%; text-align: center; vertical-align: middle; height: auto;">
                            <asp:Image ID="imgUser" runat="server" Width="100px" Height="100px" />
                            <asp:HiddenField ID="HiddenIdUsuario" runat="server" />
                        </div>
                    </div>
                    <div class="clear espaco_mini">
                        &nbsp;
                    </div>
                </div>
            </div>
            <div class="grid_8">
                <div class="container_12">
                    <div class="grid_12">
                        <span>
                            <asp:Literal ID="ltNome" runat="server"></asp:Literal></span>
                    </div>
                    <div class="clear espaco">
                        &nbsp;
                    </div>
                    <div class="grid_12">
                        <span>
                            <asp:Literal ID="ltEmail" runat="server"></asp:Literal></span>
                    </div>
                    <div class="clear espaco_mini">
                        &nbsp;
                    </div>
                    <div class="grid_12">
                        <span>
                            <asp:Literal ID="ltTelefone" runat="server"></asp:Literal></span>
                    </div>
                    <div class="clear espaco_mini">
                        &nbsp;
                    </div>
                    <div class="grid_12">
                        <span>
                            <asp:Literal ID="ltDtNascimento" runat="server"></asp:Literal></span>
                    </div>
                    <div class="clear espaco_mini">
                        &nbsp;
                    </div>
                </div>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
        </div>
    </asp:HyperLink>
</div>
