﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KartRanking.BaseDados;
using KartRanking.LogErro;
using KartRanking.Tools;

namespace KartRanking
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    * 26-03-2014: Alteração para incluir a url amigavel.   *
    ********************************************************/

    public class Global : HttpApplication
    {
        //Fontes: http://rankingkart.codeplex.com/
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            var context = HttpContext.Current;
            if (context?.Session != null)
            {
                if (Convert.ToString(context.Session["idGrupoGrupos"]) != Convert.ToString(HttpContext.Current.Items["idGrupoGrupos"]) 
                    && Convert.ToString(HttpContext.Current.Items["idGrupoGrupos"]) != "0")
                {
                    context.Session["idGrupoGrupos"] = Convert.ToString(HttpContext.Current.Items["idGrupoGrupos"]);
                    context.Session["UrlGrupo"] = null;
                    context.Session["IdCampeonato"] = null;
                }
            }
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

            if (Request.Url.LocalPath.IndexOf(".", StringComparison.Ordinal) >= 0 ||
                Request.Url.LocalPath.IndexOf("?", StringComparison.Ordinal) >= 0)
            {
                return;
            }

            HttpContext.Current.Items["idGrupoGrupos"] = 0;

            if (Request.Url.Segments.Length == 2)
            {
                var nomeGrupo = Request.Url.Segments[1];

                if ((nomeGrupo.IndexOf(".", StringComparison.Ordinal) < 0) &&
                    (nomeGrupo.IndexOf("?", StringComparison.Ordinal) < 0))
                {
                    nomeGrupo = nomeGrupo.Replace(".aspx", "");
                    var idGrupo = GetIdGrupo(nomeGrupo);
                    if (idGrupo.HasValue && (idGrupo.Value > 0))
                    {
                        HttpContext.Current.Items["idGrupoGrupos"] = idGrupo;
                        Context.RewritePath("~/Grupo/index.aspx?IdGrupo=" + idGrupo);
                    }
                }
            }
            else if (Request.Url.Segments.Length == 3)
            {
                var nomeGrupo = Request.Url.Segments[1].Substring(0, Request.Url.Segments[1].Length - 1);
                var caminho = Request.Url.Segments[2];

                if ((nomeGrupo.IndexOf(".", StringComparison.Ordinal) < 0) && (nomeGrupo.IndexOf('?') < 0) &&
                    (caminho.IndexOf(".", StringComparison.Ordinal) < 0) && (caminho.IndexOf('?') < 0))
                {
                    nomeGrupo = nomeGrupo.Replace(".aspx", "");
                    var idGrupo = GetIdGrupo(nomeGrupo);
                    if (idGrupo.HasValue && (idGrupo.Value > 0))
                    {
                        HttpContext.Current.Items["idGrupoGrupos"] = idGrupo;
                        Context.RewritePath("~/Grupo/" + caminho + ".aspx?IdGrupo=" + idGrupo);
                    }
                }
            }
            else if (Request.Url.ToString().Contains("/pilotos/"))
            {
                var nomeGrupo = Request.Url.Segments[1].Substring(0, Request.Url.Segments[1].Length - 1);
                nomeGrupo = nomeGrupo.Replace(".aspx", "");
                var idGrupo = GetIdGrupo(nomeGrupo);

                if (idGrupo.HasValue && (idGrupo.Value > 0))
                {
                    HttpContext.Current.Items["idGrupoGrupos"] = idGrupo;
                    var url = Request.Url.AbsolutePath;

                    if (url.Contains("/info/") && (url.IndexOf(".", StringComparison.Ordinal) < 0) && (url.IndexOf('?') < 0))
                    {
                        var idusuario = Request.Url.Segments[4];
                        Context.RewritePath("~/Grupo/pilotos.aspx?idUsuario=" + idusuario + "&op=info&IdGrupo=" + idGrupo);
                    }
                    else if (url.Contains("/equipes/") && (url.IndexOf(".", StringComparison.Ordinal) < 0) && (url.IndexOf('?') < 0))
                    {
                        var idEquipe = Request.Url.Segments[4];
                        Context.RewritePath("~/Grupo/pilotos.aspx?op=equipes" + "&IdGrupo=" + idGrupo + "&IdEquipe=" + idEquipe);
                    }
                    else if (url.Contains("/equipes") && (url.IndexOf(".", StringComparison.Ordinal) < 0) && (url.IndexOf('?') < 0))
                    {
                        Context.RewritePath("~/Grupo/pilotos.aspx?op=equipes" + "&IdGrupo=" + idGrupo);
                    }
                    else if (url.Contains("/pilotos") && (url.IndexOf(".", StringComparison.Ordinal) < 0) && (url.IndexOf('?') < 0))
                    {
                        Context.RewritePath("~/Grupo/pilotos.aspx?op=pilotos" + "&IdGrupo=" + idGrupo);
                    }
                }
            }
            else if (Request.Url.ToString().Contains("/noticias/"))
            {
                var nomeGrupo = Request.Url.Segments[1].Substring(0, Request.Url.Segments[1].Length - 1);
                nomeGrupo = nomeGrupo.Replace(".aspx", "");
                var idGrupo = GetIdGrupo(nomeGrupo);

                if (idGrupo.HasValue && (idGrupo.Value > 0))
                {
                    HttpContext.Current.Items["idGrupoGrupos"] = idGrupo;
                    var sId = Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf('/') + 1,
                        Request.Url.AbsolutePath.Length - Request.Url.AbsolutePath.LastIndexOf('/') - 1);
                    int id;
                    int.TryParse(sId, out id);

                    if (id == 0)
                        Context.RewritePath("~/Grupo/noticias.aspx?IdGrupo=" + idGrupo);
                    else
                        Context.RewritePath("~/Grupo/noticias.aspx?idNoticia=" + id + "&IdGrupo=" + idGrupo);
                }
            }
            else if (Request.Url.ToString().Contains("/fotos/"))
            {
                var nomeGrupo = Request.Url.Segments[1].Substring(0, Request.Url.Segments[1].Length - 1);
                nomeGrupo = nomeGrupo.Replace(".aspx", "");
                var idGrupo = GetIdGrupo(nomeGrupo);

                if (idGrupo.HasValue && (idGrupo.Value > 0))
                {
                    HttpContext.Current.Items["idGrupoGrupos"] = idGrupo;
                    var sId = Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf('/') + 1,
                        Request.Url.AbsolutePath.Length - Request.Url.AbsolutePath.LastIndexOf('/') - 1);
                    int id;
                    int.TryParse(sId, out id);

                    if (id == 0)
                        Context.RewritePath("~/Grupo/fotos.aspx?IdGrupo=" + idGrupo);
                    else
                        Context.RewritePath("~/Grupo/fotos.aspx?idalbum=" + id + "&IdGrupo=" + idGrupo);
                }
            }
        }


        private int? GetIdGrupo(string nomeGrupo)
        {
            List<Kart_Grupo> lstGrupos;

            if (!CacheHelper.Exists("AllGrupo"))
            {
                lstGrupos = (from g in new DataKartDataContext().Kart_Grupos where g.Ativo == true select g).ToList();
                CacheHelper.Add(lstGrupos, "AllGrupo");
            }
            else
                CacheHelper.Get("AllGrupo", out lstGrupos);

            return (from g in lstGrupos
                where g.UrlAcesso.ToLower() == nomeGrupo.ToLower()
                select (int?) g.idGrupo).SingleOrDefault();
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            try
            {
                var ctx = HttpContext.Current;
                var exception = ctx.Server.GetLastError();

                if ((exception != null) && exception.Message.Contains("callback"))
                {
                    // This is a robot spam attack so we send it a 404 status to make it go away.
                    ctx.Response.StatusCode = 404;
                    ctx.Server.ClearError();
                }
                else if ((exception != null) &&
                         (exception.Message.Contains("File") || exception.Message.Contains("Arquivo") ||
                          exception.Message.Contains("inexistente") || exception.Message.Contains("not exist")))
                {
                    ctx.Server.ClearError();
                }
                else if (exception != null)
                {
                    Context.Items["Exception"] = exception;
                    Context.Items["StatusCode"] = ctx.Response.StatusCode;
                    Context.Items["AllKeys"] = Request.Form.AllKeys;

                    try
                    {
                        if (ctx.Session != null)
                        {
                            ctx.Session["Exception"] = exception;
                            ctx.Session["StatusCode"] = ctx.Response.StatusCode;
                            ctx.Session["AllKeys"] = Request.Form.AllKeys;
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                    try
                    {
                        try
                        {
                            ctx.Server.Transfer("~/PageError.aspx", true);
                        }
                        catch
                        {
                            Response.Redirect("~/PageError.aspx", true);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Logar(ex, HttpContext.Current);
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {
        }

        protected void Application_End(object sender, EventArgs e)
        {
        }
    }
}