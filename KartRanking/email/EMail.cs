﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using KartRanking.Tools;
using System.IO;
using KartRanking.BaseDados;

namespace KartRanking.email
{
    public static class EMail
    {
        public static void EnviaEmail(string strEmail, string strCorpo, string subject, string strCopia)
        {
            try
            {
                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["SMTP_Host"], int.Parse(ConfigurationManager.AppSettings["SMTP_Port"]));
                MailAddress de = new MailAddress(ConfigurationManager.AppSettings["SMTP_Account"], "KartRanking");
                bool isSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["SMTP_SSL"]);
                string CopiaOculta = ConfigurationManager.AppSettings["SMTP_CCO"];

                MailAddress para = new MailAddress(strEmail);
                MailMessage mensagem = new MailMessage(de, para);

                client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["SMTP_Account"], ConfigurationManager.AppSettings["SMTP_Senha"]);
                client.EnableSsl = isSSL;

                if (!string.IsNullOrEmpty(strCopia) && strCopia.Length > 0)
                {
                    foreach (string i in strCopia.Split(';'))
                        mensagem.CC.Add(i);
                }

                if (!string.IsNullOrEmpty(CopiaOculta) && CopiaOculta.Length > 0)
                {
                    foreach (string i in CopiaOculta.Split(';'))
                        mensagem.Bcc.Add(i);
                }

                mensagem.IsBodyHtml = true;
                mensagem.Subject = subject;
                mensagem.Body = strCorpo;
                client.Timeout = 36000;
                client.Send(mensagem);
            }
            catch (Exception ex)
            {
                throw new Exception("EnviaEmail - " + ex.Message , ex.InnerException);
            }
        }

        public static void EnviarEmailBemvido(Usuario u, int idGrupo)
        {
            string Path = PathUtil.GetFullPathRoot() + @"\email\benvindo.htm";
            string HTML = "";
            using (StreamReader sr = new StreamReader(Path, true))
            {
                HTML = sr.ReadToEnd();
            }
            HTML = HTML.Replace("##NOMEUSUARIO##", u.Nome);
            HTML = HTML.Replace("##SENHAUSUARIO##", u.Senha);

            string NomeGrupo = "Nenhum grupo associado no cadastro.";

            if (idGrupo > 0)
            {
                NomeGrupo = (from g in new DataKartDataContext().Kart_Grupos
                             where g.idGrupo == idGrupo
                             select g.NomeGrupo).SingleOrDefault();
            }
            HTML = HTML.Replace("##NOMEGRUPO##", NomeGrupo);

            EnviaEmail(u.Email, HTML, "Cadastro efetuado com sucesso.", "");

            if (idGrupo > 0)
            {
                EnviarEmailGrupoAdmin(idGrupo, u);
            }
        }

        public static void EnviarEmailStatus(int idUsuario, int idGrupo)
        {
            string Path = PathUtil.GetFullPathRoot() + @"\email\GrupoStatus.htm";
            string HTML = "";
            using (StreamReader sr = new StreamReader(Path, true))
            {
                HTML = sr.ReadToEnd();
            }

            string EmailUsuario = (from u in new DataKartDataContext().Usuarios where u.idUsuario == idUsuario select u.Email).SingleOrDefault();
            string NomeGrupo = (from g in new DataKartDataContext().Kart_Grupos where g.idGrupo == idGrupo select g.NomeGrupo).SingleOrDefault();

            HTML = HTML.Replace("##NOMEGRUPO##", NomeGrupo).Replace("##STATUS##", "Aprovado no grupo!");

            EnviaEmail(EmailUsuario, HTML, "Associação ao grupo efetuado com sucesso.", "");
        }

        public static void EnviarEmailStatusGrupo(int idUsuario, int idGrupo)
        {
            string Path = PathUtil.GetFullPathRoot() + @"\email\GrupoModificado.htm";
            string HTML = "";
            using (StreamReader sr = new StreamReader(Path, true))
            {
                HTML = sr.ReadToEnd();
            }

            string EmailUsuario = (from u in new DataKartDataContext().Usuarios where u.idUsuario == idUsuario select u.Email).SingleOrDefault();
            var Grupo = (from g in new DataKartDataContext().Kart_Grupos where g.idGrupo == idGrupo select g).SingleOrDefault();

            HTML = HTML.Replace("##NOMEGRUPO##", Grupo.NomeGrupo).Replace("##STATUS##", idGrupo == 0 ? "cadastro" : "alteração").Replace("##SIGLAGRUPO##", Grupo.Sigla).Replace("##URLAMIGAVEL##", "http://kart.afonsoft.com.br/grupo/" + Grupo.UrlAcesso + ".aspx").Replace("##URL##", "http://kart.afonsoft.com.br/grupo/index.aspx?idGrupo=" + Grupo.idGrupo);

            EMail.EnviaEmail(EmailUsuario, HTML, "Grupo " + (idGrupo == 0 ? "cadastrado" : "alteração") + " com sucesso.", "");
        }

        public static void EnviarEmailAssociado(string email, int idGrupo)
        {
            string Path = PathUtil.GetFullPathRoot() + @"\email\AssociadoGrupo.htm";
            string HTML = "";
            using (StreamReader sr = new StreamReader(Path, true))
            {
                HTML = sr.ReadToEnd();
            }

            string NomeGrupo = (from g in new DataKartDataContext().Kart_Grupos
                                where g.idGrupo == idGrupo
                                select g.NomeGrupo).SingleOrDefault();

            HTML = HTML.Replace("##NOMEGRUPO##", NomeGrupo);

            EMail.EnviaEmail(email, HTML, "Associação ao grupo efetuado com sucesso.", "");
        }

        public static void EnviarEmailGrupoAdmin(int idGrupo, Usuario uCadastrado)
        {
            DataKartDataContext dk = new DataKartDataContext();
            var Grupo = (from g in dk.Kart_Grupos
                         join gu in dk.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                         join u in dk.Usuarios on gu.idUsuario equals u.idUsuario
                         where g.idGrupo == idGrupo
                         && gu.Admin == true
                         && gu.Aprovado == true
                         select new { g.NomeGrupo, gu.idUsuario, u.Email });

            string NomeGrupo = (from g in Grupo select g.NomeGrupo).SingleOrDefault();
            string EmailAdmin = String.Join(";", (from g in Grupo select g.Email).ToArray<string>());
            string NomeUsuarioCadastro = uCadastrado.Nome + " (" + uCadastrado.Email + ")";

            string Path = PathUtil.GetFullPathRoot() + @"\email\AssociadoGrupoAdmin.htm";
            string HTML = "";
            using (StreamReader sr = new StreamReader(Path, true))
            {
                HTML = sr.ReadToEnd();
            }
            HTML = HTML.Replace("##NOMEGRUPO##", NomeGrupo).Replace("##NOMEUSUARIO##", NomeUsuarioCadastro);

            EnviaEmail(EmailAdmin, HTML, "Cadastro efetuado com sucesso.", "");
        }

        public static void EnviarEmailStatusPermissao(int idUsuario, int idGrupo, bool isAdmin)
        {
            string Path = PathUtil.GetFullPathRoot() + @"\email\GrupoStatus.htm";
            string HTML = "";
            using (StreamReader sr = new StreamReader(Path, true))
            {
                HTML = sr.ReadToEnd();
            }

            string EmailUsuario = (from u in new DataKartDataContext().Usuarios where u.idUsuario == idUsuario select u.Email).SingleOrDefault();
            string NomeGrupo = (from g in new DataKartDataContext().Kart_Grupos where g.idGrupo == idGrupo select g.NomeGrupo).SingleOrDefault();

            HTML = HTML.Replace("##NOMEGRUPO##", NomeGrupo).Replace("##STATUS##", isAdmin ? "Você agora é administrador do grupo" : "Você não é mais o administrador deste grupo");

            EMail.EnviaEmail(EmailUsuario, HTML, "Associação ao grupo efetuado com sucesso.", "");
        }

        public static void EnviarEmailNoticias(int idGrupo, int idNoticia)
        {

            DataKartDataContext dk = new DataKartDataContext();

            var InfoNoticia = (from n in dk.Kart_Noticias_Grupos where n.idGrupo == idGrupo && n.idNoticias == idNoticia select n).FirstOrDefault();

            if (InfoNoticia != null)
            {

                var Grupo = (from g in dk.Kart_Grupos
                             join gu in dk.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                             join u in dk.Usuarios on gu.idUsuario equals u.idUsuario
                             where g.idGrupo == idGrupo
                             && gu.Aprovado == true
                             select new { g.NomeGrupo, gu.idUsuario, u.Email });

                string NomeGrupo = (from g in Grupo select g.NomeGrupo).FirstOrDefault();

                string Path = PathUtil.GetFullPathRoot() + @"\email\GrupoNoticias.htm";
                string HTML = "";
                using (StreamReader sr = new StreamReader(Path, true))
                {
                    HTML = sr.ReadToEnd();
                }
                HTML = HTML.Replace("##NOMEGRUPO##", NomeGrupo).Replace("##URL##", "http://kart.afonsoft.com.br/Administrador/Noticias.aspx?id=" + idNoticia).Replace("##NOTICIA##", InfoNoticia.Noticia);


                foreach (var u in Grupo)
                {
                    EnviaEmail(u.Email, HTML, "Nova noticia cadastrada.", "");
                }
            }
        }


        public static void EnviarEmailNoticias(int idGrupo, int idVideo)
        {

            DataKartDataContext dk = new DataKartDataContext();

            var InfoVideo = (from n in dk.Kart_Videos_Grupos where n.idGrupo == idGrupo && n.idVideo == idVideo select n).FirstOrDefault();

            if (InfoVideo != null)
            {

                var Grupo = (from g in dk.Kart_Grupos
                             join gu in dk.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                             join u in dk.Usuarios on gu.idUsuario equals u.idUsuario
                             where g.idGrupo == idGrupo
                             && gu.Aprovado == true
                             select new { g.NomeGrupo, gu.idUsuario, u.Email });

                string NomeGrupo = (from g in Grupo select g.NomeGrupo).FirstOrDefault();

                string Path = PathUtil.GetFullPathRoot() + @"\email\GrupoVideos.htm";
                string HTML = "";
                using (StreamReader sr = new StreamReader(Path, true))
                {
                    HTML = sr.ReadToEnd();
                }
                HTML = HTML.Replace("##NOMEGRUPO##", NomeGrupo).Replace("##URLTUBE##", InfoVideo.UrlVideo);


                foreach (var u in Grupo)
                {
                    EnviaEmail(u.Email, HTML, "Novo Video cadastrada.", "");
                }
            }
        }
    }
}
