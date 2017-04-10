<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AspNetInfo.aspx.cs" Inherits="AspNetInfo.AspNetInfo" %>
<%@ OutputCache NoStore="true" Location="None" %>
<%@ Register Namespace="AspNetInfo.Controls" Assembly="AspNetInfo" TagPrefix="aspnetinfo" %>
<%@ Import Namespace="AspNetInfo.Helpers"  %>
<%@ Import Namespace="AspNetInfo.Diagnostics" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>AspNetInfo</title>
    <link type="text/css" rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/redmond/jquery-ui.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>     
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <div id="logo">
            <img src='<%=GetImageResource("AspNetInfo_Logo.jpg") %>' alt="AspNetInfo" style="width: 217px; height: 50px;" />
        </div>
        <aspnetinfo:JQueryUIAlert id="alertTop" runat="server" />

        <div id="tabs">
            <ul>
                <% foreach (var tab in tabs) { %>
                <li><a href="#<%=GetTabId(tab) %>"><span><%=tab %></span></a></li>
                <%} %>
                <li><a href="#diagnostics"><span>Diagnostics</span></a></li>
            </ul>

            <% foreach (var tab in tabs) { %>
            <div id="<%=GetTabId(tab) %>">
                <%
                    // Get all detectors for this tab and render result.
                   var tabDetectors = GetDetectorsByTab(tab);
                   foreach (var detector in tabDetectors) {
                       Response.Write(String.Format("<h2>{0}</h2>", detector.Name));
                       if (!String.IsNullOrEmpty(detector.Description))
                       {
                           Response.Write(String.Format("<p>{0}</p>", detector.Description));
                       }
                       try
                       {
                           Response.Write(RenderDetectorGridView(detector.Detect(permissions)));
                       }
                       catch (Exception exc)
                       {
                           %>
                        <div class="ui-widget diag-message">
                            <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                                <p>
                                    <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                                    Failed to run the "<%=detector.Name %>" detector due to the following error:<br />
                                    <br />
                                    <%=exc.Message %>
                                </p>
                            </div>
                        </div> 
                        <%                          
                       }
                   }
                %>
            </div>
            <%} %>
          

            <div id="diagnostics">

                <div id="diag-button-panel">
                <a id="diag-run-button" href="javascript:void(0)">Run All Diagnostics</a>

                <a id="send-email" href="javascript:void(0)">Test Email</a>
                </div>
                               
                <div id="diag-run-message" class="ui-widget" style="display: none;">
                    <div class="ui-state-highlight ui-corner-all" style="padding: 0 .7em;">
                        <p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>Running all diagnostics.  Please wait...</p>
                    </div>
                </div>

                <%
                    foreach (var fixture in testFixtures)
                    {
                        %>
                        <h2><%=fixture.Name %></h2>
                        <dl class="diag-fixture group">
                        <%
                        if (fixture.Error != null) {
                            %>
                            <div class="ui-widget diag-message">
                                <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                                    <p>
                                        <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                                        Failed to setup diagnostic.<br />
                                        <%=fixture.Error.Message %>
                                    </p>
                                </div>
                            </div>
                            <%
                            continue;
                        }
                        if (fixture.Tests.Count == 0)
                        {
                            %>
                                <div class="ui-widget">
                                    <div class="ui-state-highlight ui-corner-all" style="padding: 0 .7em;">
                                        <p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>This diagnostic fixture couldn't find anything to test.</p>
                                    </div>
                                </div>
                            <%
                            continue;
                        }
                        foreach (var test in fixture.Tests)
                        {
                            %>
                                <dt class="test-status" >
                                    <a href="javascript:void(0)" class="test-run-button" data-name="<%=test.Name %>" data-status="new">
                                        <img src="<%=GetImageResource("control_play.png") %>" alt="Start" />
                                    </a>
                                </dt>
                                <dd class="test" data-name="<%=test.Name %>">
                                    <%=test.Description %>
                                </dd>
                            <%
                        }
                        %>
                        </dl>
                        <%
                    }     
                %>
                  
            </div>                                                         
        </div>    
    </div>
    <div id="emailDialog" title="Send test email" class="validationGroup">
            <p id="validateTips">Use this form to sent a test based on the following SMTP settings.</p>
            <p id="emailValidateTips"></p>
            <div id="emailTabs">
                <ul>
                    <li><a href="#testemail"><span>Send Test Email</span></a></li>
                    <li><a href="#customsmtp"><span>Custom SMTP</span></a></li>
                </ul>	 
                <div id="testemail">
                    <fieldset>
                        <label for="emailFrom">From:</label>
                        <input type="text" name="emailFrom" id="emailFrom" 
                            value="<%=SmtpSettings["From"] == "N/A" ? "no-reply@mailinator.com" : SmtpSettings["From"] %>"
                            class="text ui-widget-content ui-corner-all"/>
                        <label for="email">To:</label>
                        <input type="text" name="emailTo" id="emailTo" value="chestertester@mailinator.com" class="text ui-widget-content ui-corner-all" />
                        <div class="forminline">
                            <label for="emailMessage">Message format: </label><br />
                            <input id="emailFormatPlain" name="emailFormat" type="radio" value="plain" checked="checked" /> Plain text
                            <input id="emailFormatHtml" name="emailFormat" type="radio" value="html"  /> HTML
                        </div>		                
                        <label for="emailSubject">Subject:</label>
                        <input type="text" name="emailSubject" id="emailSubject" value="[TEST] Please reply to sender." class="text ui-widget-content ui-corner-all" />                        		                
                        <label for="emailMessage">Message:</label>
                        <textarea id="emailMessage" name="emailMessage" 
                            rows="3" cols="80"
                            class="ui-widget-content ui-corner-all" 
                            style="width:95%;height:5em;">This message has been sent to test the email settings from the website at <%=Request.ServerVariables["HTTP_HOST"] %>.  Please reply to <%=SmtpSettings["From"] %>.</textarea>                      		                
                    </fieldset>
                </div>     
                <div id="customsmtp">
                    <fieldset>
                        <div class="forminline">
                            <input id="smtpUseCustomSmtp" name="smtpUseCustomSmtp" type="checkbox" class="checkbox ui-widget-content ui-corner-all" />
                            <label for="smtpUseCustomSmtp">Use custom SMTP settings</label>
                        </div>
                        <div class="form2column">
                            <div class="left">
                                <label for="smtpHost">Host</label>
                                <input type="text" name="smtpHost" id="smtpHost" class="text ui-widget-content ui-corner-all"  value="<%=String.IsNullOrEmpty(SmtpSettings["Host"]) ? "localhost" : SmtpSettings["Host"] %>" />
                            </div>
                            <div class="right">
                                <label for="port">Port</label>
                                <input type="text" name="smtpPort" id="smtpPort" class="text ui-widget-content ui-corner-all"  value="<%=SmtpSettings["Port"] %>" />
                            </div>
                        </div>
                        <div class="form2column">
                            <div class="left">
                                <label for="SmtpDeliveryMethod">Delivery Method</label>
                                <select id="SmtpDeliveryMethod" name="SmtpDeliveryMethod" class="select ui-widget-content ui-corner-all">
                                    <option value="Network" <%=SmtpSettings["DeliveryMethod"] == "Network" ? "selected" : string.Empty%> >Network</option>
                                    <option value="PickupDirectoryFromIis" <%=SmtpSettings["DeliveryMethod"] == "PickupDirectoryFromIis" ? "selected" : string.Empty%> >Pickup Directory From IIS</option>
                                    <option value="SpecifiedPickupDirectory" <%=SmtpSettings["DeliveryMethod"] == "SpecifiedPickupDirectory" ? "selected" : string.Empty%> >Specified Pickup Directory</option>
                                </select>
                            </div>
                            <div class="right">
                                <label for="smtpPickupDir">Pickup Directory</label>
                                <input type="text" name="smtpPickupDir" id="smtpPickupDir" class="text delivery ui-widget-content ui-corner-all"  value="<%=SmtpSettings["PickupDirectoryLocation"] %>" />                		                     
                            </div>
                        </div>
                        <div class="forminline">
                            <input id="smtpUseDefaultCreds" name="smtpUseDefaultCreds" 
                                type="checkbox" <%=SmtpSettings["UseDefaultCredentials"] == "True" ? "checked" : string.Empty%>
                                class="checkbox ui-widget-content ui-corner-all" />
                            <label for="smtpUseDefaultCreds">Use default credentials</label>
                        </div>
                        <label for="smtpUsername">Username</label>
                        <input type="text" name="smtpUsername" id="smtpUsername" class="text credential ui-widget-content ui-corner-all"  value="<%=SmtpSettings["Username"] %>" />
                        <label for="smtpPass">Password</label>
                        <input type="text" name="smtpPass" id="smtpPass" class="text credential ui-widget-content ui-corner-all"  value="<%=SmtpSettings["Password"] %>" />		                                            
                    </fieldset>
                </div>                        
            </div>
        </div>
    <div id="dialog-message" title="Send Email Result" style="display: none;">
        <p>
            <span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
            Message Here
        </p>
    </div>
    </form> 
        
    <script id="alertTemplate" type="text/x-jquery-tmpl">
        <div class="ui-widget diag-message">
            <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>${}</p>
            </div>
        </div>
    </script>
    <script type="text/javascript">
        (function (aspnetinfo, $, undefined) {
            aspnetinfo.diagStatus = {
                passed: '<%=TestStatusImgBinder.Eval(TestStatus.Passed) %>',
                warning: '<%=TestStatusImgBinder.Eval(TestStatus.Warning) %>',
                failed: '<%=TestStatusImgBinder.Eval(TestStatus.Failed) %>',
                start: '<%=GetImageResource("control_play.png") %>',
                starthover: '<%=GetImageResource("control_play_blue.png") %>',
                running: '<%=GetImageResource("ajax-loader.gif") %>'
            };
        } (window.aspnetinfo = window.aspnetinfo || {}, jQuery));

        $(document).ready(function () {
            aspnetinfo.init();
        });    
    </script>
</body>
</html>
