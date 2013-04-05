<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="Videos.aspx.cs" Inherits="KartRanking.Administrador.Videos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">
    <asp:Panel ID="PanelVideos" runat="server">
        <div class="container_12">
            <div class="grid_12">
                <h3 class="StepTitle">
                    Videos deste Grupo</h3>
                <div class="StepSubTitle">
                    Gerenciar os videos deste grupo</div>
            </div>
            <div class="clear espaco_mini">
                &nbsp;
            </div>
             <div class="grid_12">
                <div id="Player"></div>
                <script type="text/javascript">
                    $('#Player').youTubeEmbed({
                        video: 'http://www.youtube.com/watch?v=yQt4EDKMVXg',
                        width: 600, // Height is calculated automatically
                        progressBar: false // Hide the progress bar
                    });
                </script>
             </div>
            <div class="clear">
                &nbsp;
            </div>
        </div>
    </asp:Panel>
</asp:Content>
