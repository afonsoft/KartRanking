<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.master" AutoEventWireup="true"
    CodeBehind="perfil.aspx.cs" Inherits="KartRanking.Administrador.perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceCorpo" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $('#<%= txtDtNascimento.ClientID %>').datepicker({
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


            $("#dialog-modal").dialog({
                autoOpen: false,
                height: 200,
                width: 350,
                modal: false,
                buttons: {
                    "Upload": function() {
                        $(this).dialog("close"); __doPostBack('<%=lnkUploadFile.UniqueID %>', '');
                    },
                    "Cancelar": function() {
                        $(this).dialog("close");
                    }
                }
            });
            $("#dialog-modal").parent().appendTo($("form:first"));

            $("#dialog-modalSenha").dialog({
                autoOpen: false,
                height: 170,
                width: 260,
                modal: false,
                buttons: {
                    "Alterar": function() {
                        $(this).dialog("close"); __doPostBack('<%=lnkAlterarSenha.UniqueID %>', '');
                    },
                    "Cancelar": function() {
                        $(this).dialog("close");
                    }
                }
            });
            $("#dialog-modalSenha").parent().appendTo($("form:first"));

            $("#<%= txtAltura.ClientID%>").mask("9,99");
            $("#<%= txtPeso.ClientID%>").mask("99,9");


        });

        function AlterarSenha() {
            $("#dialog-modalSenha").dialog({
                autoOpen: false,
                height: 170,
                width: 260,
                modal: false,
                buttons: {
                    "Alterar": function() {
                        $(this).dialog("close"); __doPostBack('<%=lnkAlterarSenha.UniqueID %>', '');
                    },
                    "Cancelar": function() {
                        $(this).dialog("close");
                    }
                }
            });
            $("#dialog-modalSenha").parent().appendTo($("form:first"));
            $('#dialog-modalSenha').dialog('open');
        }

        function OpenFileUpload() {
            $("#dialog-modal").dialog({
                autoOpen: false,
                height: 200,
                width: 350,
                modal: false,
                buttons: {
                    "Upload": function() {
                        $(this).dialog("close"); __doPostBack('<%=lnkUploadFile.UniqueID %>', '');
                    },
                    "Cancelar": function() {
                        $(this).dialog("close");
                    }
                }
            });
            $("#dialog-modal").parent().appendTo($("form:first"));
            $('#dialog-modal').dialog('open');
        }
        
    </script>

    <div class="container_12">
        <div class="grid_12">
            <h3 class="titulo">
                Perfil</h3>
            <p style="color: #666; padding-top: 2px; margin-top: 0px; margin-bottom: 0px">
                Alterar os dados pessoais</p>
            <hr style="border-bottom: #ccc 1px dashed; border-left: #ccc 1px dashed; border-top: #ccc 1px dashed;
                border-right: #ccc 1px dashed;" />
        </div>
        <div class="clear espaco">
            &nbsp;
        </div>
        <div class="grid_3">
            <div class="container_12">
                <div class="grid_12">
                    <asp:Image ID="ImgPerfil" Width="150px" Height="170px" runat="server" />
                </div>
                <div class="clear">
                    &nbsp;
                </div>
                <div class="grid_12">
                    <asp:LinkButton ID="lnkFile" runat="server" OnClick="lnkFile_Click">Atualizara Foto</asp:LinkButton>
                </div>
                <div class="clear espaco_mini">
                    &nbsp;
                </div>
            </div>
        </div>
        <div class="grid_9">
            <div class="container_12" style="margin-right:0px;margin-left:0px; width:100%;">
                <div class="grid_2">
                    <span class="label">Nome:</span><asp:HiddenField ID="IdUsuario" runat="server" />
                </div>
                <div class="grid_10">
                    <asp:TextBox ID="txtNome" runat="server" CssClass="text"></asp:TextBox>
                </div>
                <div class="clear espaco_mini">
                    &nbsp;
                </div>
                <div class="grid_2">
                    <span class="label">E-Mail:</span>
                </div>
                <div class="grid_10">
                    <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true" CssClass="text"></asp:TextBox>
                </div>
                <div class="clear espaco_mini">
                    &nbsp;
                </div>
                <div class="grid_2">
                    <span class="label">Nascimento:</span>
                </div>
                <div class="grid_3">
                    <asp:TextBox ID="txtDtNascimento" MaxLength="10" runat="server" CssClass="text"></asp:TextBox>
                </div>
                <div class="grid_2">
                    <span class="label">Apelido:</span>
                </div>
                <div class="grid_5">
                    <asp:TextBox ID="txtApelido" runat="server" CssClass="text"></asp:TextBox>
                </div>
                <div class="clear espaco_mini">
                    &nbsp;
                </div>
                <div class="grid_2">
                    <span class="label">Peso:</span></div>
                <div class="grid_3">
                    <asp:TextBox ID="txtPeso" MaxLength="5" runat="server" CssClass="text"></asp:TextBox>
                </div>
                <div class="grid_2">
                    <span class="label">Sexo:</span></div>
                <div class="grid_5">
                    <asp:DropDownList ID="ddlSexo" runat="server" CssClass="text">
                        <asp:ListItem Text="Masculino" Value="M" />
                        <asp:ListItem Text="Feminino" Value="F" />
                    </asp:DropDownList>
                </div>
                <div class="clear espaco_mini">
                    &nbsp;
                </div>
                <div class="grid_2">
                    <span class="label">Altura:</span></div>
                <div class="grid_3">
                    <asp:TextBox ID="txtAltura" MaxLength="4" runat="server" CssClass="text"></asp:TextBox>
                </div>
                <div class="grid_2">
                    <span class="label">Estado:</span></div>
                <div class="grid_5">
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="text">
                        <asp:ListItem Text="Acre (AC)" Value="AC" />
                        <asp:ListItem Text="Alagoas (AL)" Value="AL" />
                        <asp:ListItem Text="Amapá (AP)" Value="AP" />
                        <asp:ListItem Text="Amazonas (AM)" Value="AM" />
                        <asp:ListItem Text="Bahia (BA)" Value="BA" />
                        <asp:ListItem Text="Ceará (CE)" Value="CE" />
                        <asp:ListItem Text="Distrito Federal (DF)" Value="DF" />
                        <asp:ListItem Text="Espírito Santo (ES)" Value="ES" />
                        <asp:ListItem Text="Goiás (GO)" Value="GO" />
                        <asp:ListItem Text="Maranhão (MA)" Value="MA" />
                        <asp:ListItem Text="Mato Grosso (MT)" Value="MT" />
                        <asp:ListItem Text="Mato Grosso do Sul (MS)" Value="MS" />
                        <asp:ListItem Text="Minas Gerais (MG)" Value="MG" />
                        <asp:ListItem Text="Pará (PA)" Value="PA" />
                        <asp:ListItem Text="Paraíba (PB)" Value="PB" />
                        <asp:ListItem Text="Paraná (PR)" Value="PR" />
                        <asp:ListItem Text="Pernambuco (PE)" Value="PE" />
                        <asp:ListItem Text="Piauí (PI)" Value="PI" />
                        <asp:ListItem Text="Rio de Janeiro (RJ)" Value="RJ" />
                        <asp:ListItem Text="Rio Grande do Norte (RN)" Value="RN" />
                        <asp:ListItem Text="Rio Grande do Sul (RS)" Value="RS" />
                        <asp:ListItem Text="Rondônia (RO)" Value="RO" />
                        <asp:ListItem Text="Roraima (RR)" Value="RR" />
                        <asp:ListItem Text="Santa Catarina (SC)" Value="SC" />
                        <asp:ListItem Text="São Paulo (SP)" Value="SP" />
                        <asp:ListItem Text="Sergipe (SE)" Value="SE" />
                        <asp:ListItem Text="Tocantins (TO)" Value="TO" />
                    </asp:DropDownList>
                </div>
                <div class="clear espaco_mini">
                    &nbsp;
                </div>
            </div>
        </div>
        <div class="clear">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Telefone:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtTelefone" runat="server" CssClass="text"></asp:TextBox>
        </div>
        <div class="grid_2">
            <span class="label">Celular:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtCelular" runat="server" CssClass="text"></asp:TextBox>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Endereço:</span></div>
        <div class="grid_10">
            <asp:TextBox ID="txtEndereco" runat="server" CssClass="text"></asp:TextBox>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Cidade:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtCidade" runat="server" CssClass="text"></asp:TextBox>
        </div>
        <div class="grid_2">
            <span class="label">Perfil Facebook:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtPerfilFacebook" MaxLength="200" runat="server" CssClass="text"></asp:TextBox>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Perfil Twitter:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtPerfilTwitter" MaxLength="200" runat="server" CssClass="text"></asp:TextBox>
        </div>
        <div class="grid_2">
            <span class="label">Perfil Plus:</span></div>
        <div class="grid_4">
            <asp:TextBox ID="txtPerfilPlus" MaxLength="200" runat="server" CssClass="text"></asp:TextBox>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_2">
            <span class="label">Obs:</span></div>
        <div class="grid_10">
            <asp:TextBox ID="txtObs" Height="100px" Width="100%" MaxLength="8000" TextMode="MultiLine"
                CssClass="text" runat="server"></asp:TextBox>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
        <div class="grid_12">
            <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" Width="150px" OnClick="btnAtualizar_Click"
                CssClass="button" />&nbsp;
            <input id="btnAlterSenha" type="button" value="Alterara Senha" onclick="AlterarSenha();" runat="server"/>
        </div>
        <div class="clear espaco_mini">
            &nbsp;
        </div>
    </div>
    <div id="dialog-modalSenha" title="Alterar a Senha" style="display: none; font-size: x-small;
        color: Black; font-family: Verdana; font-style: normal; font-weight: normal;"
        class="ui-dialog ui-resizable-handle">
        <table width="100%" cellpadding="1" cellspacing="1" border="0">
            <tr>
                <td style="width: 100px;">
                    <b>Senha Antiga:</b>
                </td>
                <td>
                    <asp:TextBox ID="txtSenhaAntiga" TextMode="Password" runat="server" Width="98%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                    <b>Senha Nova:</b>
                </td>
                <td>
                    <asp:TextBox ID="txtSenhaNova1" TextMode="Password" runat="server" Width="98%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                    <b>Senha Nova:</b>
                </td>
                <td>
                    <asp:TextBox ID="txtSenhaNova2" TextMode="Password" runat="server" Width="98%"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div style="display: none;">
            <asp:LinkButton ID="lnkAlterarSenha" runat="server" OnClick="lnkAlterarSenha_Click"></asp:LinkButton>
        </div>
    </div>
    <div id="dialog-modal" title="Upload" style="display: none; font-size: x-small; color: Black;
        font-family: Verdana; font-style: normal; font-weight: normal;" class="ui-dialog ui-resizable-handle">
        <fieldset>
            <legend>Atualizar a sua foto do perfil.</legend>
            <asp:FileUpload ID="flUpload" class="ui-widget-content ui-corner-all" runat="server" /><br />
            <span>As fotos tem de ser JPG, GIF e no maximo 1MB e nas resoluções W170 X H190.</span>
        </fieldset>
        <div style="display: none;">
            <asp:LinkButton ID="lnkUploadFile" runat="server" OnClick="lnkUploadFile_Click"></asp:LinkButton>
        </div>
    </div>
</asp:Content>
