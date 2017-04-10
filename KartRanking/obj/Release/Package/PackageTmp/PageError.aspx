<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageError.aspx.cs" Inherits="KartRanking.PageError" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KartRanking - Erro</title>
    <style type="text/css">
        .Corpo {
            min-width: 800px;
            max-width: 1024px;
            height: auto;
            min-height: 500px;
            width: auto;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Corpo">
            <table width="80%" cellpadding="2" cellspacing="2" border="0">
                <tr>
                    <td style="text-align: left;">
                        <h3>
                            <b>Ocorreu um erro no Sistema!</b>
                        </h3>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;">
                        <h5>
                            <asp:Label ID="lblErrorCode" runat="server" Text=""></asp:Label>
                        </h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;">
                        <div id="dvError" runat="server">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Mais informações</b></label><br />
                        <asp:TextBox ID="txtInfo" TextMode="MultiLine" Width="100%" Rows="10" Columns="150" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;">
                        <asp:Button ID="btnEnviar" runat="server" Text="Reportar esse erro ao adiministrador!"
                            OnClick="btnEnviar_Click" />
                    </td>
                </tr>
            </table>
        </div>

        <script type="text/javascript">
            (function (i, s, o, g, r, a, m) { i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () { (i[r].q = i[r].q || []).push(arguments) }, i[r].l = 1 * new Date(); a = s.createElement(o), m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m) })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-23515540-2', 'auto');
            ga('send', 'pageview');
            ga('set', 'currencyCode', 'BRL');
            ga('send', 'exception', {
                'exDescription': '<%= ErrorMsg %>',
                'exFatal': true
            });
        </script>
    </form>
</body>
</html>
