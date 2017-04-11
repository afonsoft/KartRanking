using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using KartRanking.BaseDados;
using KartRanking.Tools;

namespace KartRanking.email
{
    public static class EMail
    {
        public static void EnviaEmail(string strEmail, string strCorpo, string subject, string strCopia)
        {
            try
            {
                var client = new SmtpClient(ConfigurationManager.AppSettings["SMTP_Host"],
                    int.Parse(ConfigurationManager.AppSettings["SMTP_Port"]));
                var de = new MailAddress(ConfigurationManager.AppSettings["SMTP_Account"], "KartRanking");
                var isSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["SMTP_SSL"]);
                var copiaOculta = ConfigurationManager.AppSettings["SMTP_CCO"];

                client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["SMTP_Account"],
                    ConfigurationManager.AppSettings["SMTP_Senha"]);
                client.EnableSsl = isSsl;

                var mensagem = new MailMessage {From = de};

                if (!string.IsNullOrEmpty(strEmail) && (strEmail.Length > 0))
                    foreach (var i in strEmail.Split(';'))
                        mensagem.To.Add(i);

                if (!string.IsNullOrEmpty(strCopia) && (strCopia.Length > 0))
                    foreach (var i in strCopia.Split(';'))
                        mensagem.CC.Add(i);

                if (!string.IsNullOrEmpty(copiaOculta) && (copiaOculta.Length > 0))
                    foreach (var i in copiaOculta.Split(';'))
                        mensagem.Bcc.Add(i);

                mensagem.IsBodyHtml = true;
                mensagem.Subject = subject;
                mensagem.Body = strCorpo;
                client.Timeout = 36000;
                client.Send(mensagem);
            }
            catch (Exception ex)
            {
                throw new Exception("EnviaEmail - " + ex.Message, ex.InnerException);
            }
        }

        public static void EnviarEmailBemvido(Usuario u, int idGrupo)
        {
            var path = PathUtil.GetFullPathRoot() + @"\email\benvindo.htm";
            string html;
            using (var sr = new StreamReader(path, true))
            {
                html = sr.ReadToEnd();
            }
            html = html.Replace("##NOMEUSUARIO##", u.Nome);
            html = html.Replace("##SENHAUSUARIO##", u.Senha);

            var NomeGrupo = "Nenhum grupo associado no cadastro.";

            if (idGrupo > 0)
            {
                var grupo1 = (from g in new DataKartDataContext().Kart_Grupos
                    where g.idGrupo == idGrupo
                    select g).FirstOrDefault();

                if (grupo1 != null)
                {
                    html = html.Replace("##NOMEGRUPO##", grupo1.NomeGrupo);
                    html = html.Replace("##URLGRUPO##", "http://kart.afonsoft.com.br/" + grupo1.UrlAcesso);
                }
            }
            else
            {
                using (var db = new DataKartDataContext())
                {
                    var grupo1 = (from g in db.Kart_Grupos
                        join gu in db.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                        orderby gu.dtCriacao descending
                        where gu.idUsuario == u.idUsuario
                        select g).FirstOrDefault();

                    if (grupo1 != null)
                    {
                        html = html.Replace("##NOMEGRUPO##", grupo1.NomeGrupo);
                        html = html.Replace("##URLGRUPO##", "http://kart.afonsoft.com.br/" + grupo1.UrlAcesso);
                    }
                    else
                    {
                        html = html.Replace("##NOMEGRUPO##", NomeGrupo);
                        html = html.Replace("##URLGRUPO##", "http://kart.afonsoft.com.br/");
                    }
                }
            }

            EnviaEmail(u.Email, html, "KartRanking - Cadastro efetuado com sucesso.", "");

            if (idGrupo > 0)
                EnviarEmailGrupoAdmin(idGrupo, u);
        }

        public static void EnviarEmailStatus(int idUsuario, int idGrupo)
        {
            var path = PathUtil.GetFullPathRoot() + @"\email\GrupoStatus.htm";
            string html;
            using (var sr = new StreamReader(path, true))
            {
                html = sr.ReadToEnd();
            }
            DataKartDataContext dk = new DataKartDataContext();

            var emailUsuario = dk.Usuarios
                .Where(x => x.idUsuario == idUsuario)
                .Select(x => x.Email)
                .SingleOrDefault();

            var nomeGrupo = dk.Kart_Grupos
                .Where(x => x.idGrupo == idGrupo)
                .Select(x => x.NomeGrupo)
                .SingleOrDefault();

            html = html.Replace("##NOMEGRUPO##", nomeGrupo).Replace("##STATUS##", "Aprovado no grupo!");

            EnviaEmail(emailUsuario, html, "KartRanking - Associação ao grupo efetuado com sucesso.", "");
        }

        public static void EnviarEmailStatusGrupo(int idUsuario, int idGrupo)
        {
            var path = PathUtil.GetFullPathRoot() + @"\email\GrupoModificado.htm";
            string html;
            using (var sr = new StreamReader(path, true))
            {
                html = sr.ReadToEnd();
            }

            DataKartDataContext dk = new DataKartDataContext();

            var emailUsuario = dk.Usuarios
              .Where(x => x.idUsuario == idUsuario)
              .Select(x => x.Email)
              .SingleOrDefault();

            var grupo = dk.Kart_Grupos
                .SingleOrDefault(x => x.idGrupo == idGrupo);

            if (grupo != null)
            {
                html =
                    html.Replace("##NOMEGRUPO##", grupo.NomeGrupo)
                        .Replace("##STATUS##", idGrupo == 0 ? "cadastro" : "alteração")
                        .Replace("##SIGLAGRUPO##", grupo.Sigla)
                        .Replace("##URLAMIGAVEL##", "http://kart.afonsoft.com.br/" + grupo.UrlAcesso)
                        .Replace("##URL##", "http://kart.afonsoft.com.br/Administrador/index.aspx?idGrupo=" + grupo.idGrupo);

                EnviaEmail(emailUsuario, html, "KartRanking - Grupo " + (idGrupo == 0 ? "cadastrado" : "alteração") + " com sucesso.", "");
            }
        }

        public static void EnviarEmailAssociado(string email, int idGrupo)
        {
            var path = PathUtil.GetFullPathRoot() + @"\email\AssociadoGrupo.htm";
            string html;
            using (var sr = new StreamReader(path, true))
            {
                html = sr.ReadToEnd();
            }

            DataKartDataContext dk = new DataKartDataContext();
            var grupo = dk.Kart_Grupos
                .SingleOrDefault(x => x.idGrupo == idGrupo);

            if (grupo != null)
            {
                html = html.Replace("##NOMEGRUPO##", grupo.NomeGrupo);
                html = html.Replace("##URLGRUPO##", "http://kart.afonsoft.com.br/" + grupo.UrlAcesso);
            }

            EnviaEmail(email, html, "KartRanking - Associação ao grupo efetuado com sucesso.", "");
        }

        public static void EnviarEmailGrupoAdmin(int idGrupo, Usuario uCadastrado)
        {
            var dk = new DataKartDataContext();
            var grupo = (from g in dk.Kart_Grupos
                join gu in dk.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                join u in dk.Usuarios on gu.idUsuario equals u.idUsuario
                where (g.idGrupo == idGrupo)
                      && (gu.Admin == true)
                      && (gu.Aprovado == true)
                select new {g.NomeGrupo, gu.idUsuario, u.Email, g.UrlAcesso}).ToArray();


            var emailAdmin = string.Join(";", (from g in grupo select g.Email).ToArray());
            var nomeUsuarioCadastro = uCadastrado.Nome + " (" + uCadastrado.Email + ")";

            var path = PathUtil.GetFullPathRoot() + @"\email\AssociadoGrupoAdmin.htm";
            string html;
            using (var sr = new StreamReader(path, true))
            {
                html = sr.ReadToEnd();
            }
            html = html.Replace("##NOMEGRUPO##", grupo[0].NomeGrupo).Replace("##NOMEUSUARIO##", nomeUsuarioCadastro);
            html = html.Replace("##URLGRUPO##", "http://kart.afonsoft.com.br/" + grupo[0].UrlAcesso);

            EnviaEmail(emailAdmin, html, "KartRanking - Cadastro efetuado com sucesso.", "");
        }

        public static void EnviarEmailStatusPermissao(int idUsuario, int idGrupo, bool isAdmin)
        {
            var path = PathUtil.GetFullPathRoot() + @"\email\GrupoStatus.htm";
            string html;
            using (var sr = new StreamReader(path, true))
            {
                html = sr.ReadToEnd();
            }

            DataKartDataContext dk = new DataKartDataContext();

            var emailUsuario = dk.Usuarios
                .Where(x => x.idUsuario == idUsuario)
                .Select(x => x.Email)
                .SingleOrDefault();

            var nomeGrupo = dk.Kart_Grupos
                .Where(x => x.idGrupo == idGrupo)
                .Select(x => x.NomeGrupo)
                .SingleOrDefault();

            html = html.Replace("##NOMEGRUPO##", nomeGrupo)
                .Replace("##STATUS##",
                    isAdmin ? "Você agora é administrador do grupo" : "Você não é mais o administrador deste grupo");

            EnviaEmail(emailUsuario, html, "KartRanking - Associação ao grupo efetuado com sucesso.", "");
        }

        public static void EnviarEmailNoticias(int idGrupo, int idNoticia)
        {
            var dk = new DataKartDataContext();

            var infoNoticia =
                (from n in dk.Kart_Noticias_Grupos where (n.idGrupo == idGrupo) && (n.idNoticias == idNoticia) select n)
                    .FirstOrDefault();

            if (infoNoticia != null)
            {
                var grupo = from g in dk.Kart_Grupos
                    join gu in dk.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                    join u in dk.Usuarios on gu.idUsuario equals u.idUsuario
                    where (g.idGrupo == idGrupo)
                          && (gu.Aprovado == true)
                    select new {g.NomeGrupo, gu.idUsuario, u.Email};

                var nomeGrupo = (from g in grupo select g.NomeGrupo).FirstOrDefault();

                var path = PathUtil.GetFullPathRoot() + @"\email\GrupoNoticias.htm";
                string html;
                using (var sr = new StreamReader(path, true))
                {
                    html = sr.ReadToEnd();
                }
                html =
                    html.Replace("##NOMEGRUPO##", nomeGrupo)
                        .Replace("##URL##", "http://kart.afonsoft.com.br/Administrador/Noticias.aspx?id=" + idNoticia)
                        .Replace("##NOTICIA##", infoNoticia.Noticia);


                foreach (var u in grupo)
                    EnviaEmail(u.Email, html, "KartRanking - Nova noticia cadastrada.", "");
            }
        }

        public static void EnviarEmailVideos(int idGrupo, int idVideo)
        {
            var dk = new DataKartDataContext();

            var infoVideo =
                (from n in dk.Kart_Videos_Grupos where (n.idGrupo == idGrupo) && (n.idVideo == idVideo) select n)
                    .FirstOrDefault();

            if (infoVideo != null)
            {
                var grupo = (from g in dk.Kart_Grupos
                    join gu in dk.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                    join u in dk.Usuarios on gu.idUsuario equals u.idUsuario
                    where (g.idGrupo == idGrupo)
                          && (gu.Aprovado == true)
                    select new {g.NomeGrupo, gu.idUsuario, u.Email, g.UrlAcesso}).ToList();

                var nomeGrupo = (from g in grupo select g.NomeGrupo).FirstOrDefault();

                var path = PathUtil.GetFullPathRoot() + @"\email\GrupoVideos.htm";
                string html;
                using (var sr = new StreamReader(path, true))
                {
                    html = sr.ReadToEnd();
                }
                //http://kart.afonsoft.com.br/KartAmigos/videos
                html =
                    html.Replace("##NOMEGRUPO##", nomeGrupo)
                        .Replace("##URLVIDEO##", "http://kart.afonsoft.com.br/" + grupo[0].UrlAcesso + "/videos")
                        .Replace("##URLTUBE##", infoVideo.UrlVideo);


                foreach (var u in grupo)
                    EnviaEmail(u.Email, html, "KartRanking - Novo Vídeo cadastrado", "");
            }
        }

        public static void EnviarEmailAlbum(int idGrupo, int idAlbum)
        {
            var dk = new DataKartDataContext();

            var infoAlbum =
                (from n in dk.Kart_Album_Grupos where (n.idGrupo == idGrupo) && (n.idAlbum == idAlbum) select n)
                    .FirstOrDefault();

            if (infoAlbum != null)
            {
                var grupo = (from g in dk.Kart_Grupos
                    join gu in dk.Kart_Usuario_Grupos on g.idGrupo equals gu.idGrupo
                    join u in dk.Usuarios on gu.idUsuario equals u.idUsuario
                    where (g.idGrupo == idGrupo)
                          && (gu.Aprovado == true)
                    select new {g.NomeGrupo, gu.idUsuario, u.Email, g.UrlAcesso}).ToList();

                var nomeGrupo = (from g in grupo select g.NomeGrupo).FirstOrDefault();

                var path = PathUtil.GetFullPathRoot() + @"\email\GrupoFotos.htm";
                string html;
                using (var sr = new StreamReader(path, true))
                {
                    html = sr.ReadToEnd();
                }
                html =
                    html.Replace("##NOMEGRUPO##", nomeGrupo)
                        .Replace("##NOMEALBUM##", infoAlbum.NomeAlbum)
                        .Replace("##ID##", "http://kart.afonsoft.com.br/" + grupo[0].UrlAcesso + "/fotos");


                foreach (var u in grupo)
                    EnviaEmail(u.Email, html, "KartRanking - Nova foto cadastrada", "");
            }
        }

        public static void EnviarEmailRegraGrupo(int idUsuario, int idGrupo)
        {
            var path = PathUtil.GetFullPathRoot() + @"\email\GrupoRegraModificado.htm";
            string html;
            using (var sr = new StreamReader(path, true))
            {
                html = sr.ReadToEnd();
            }
            DataKartDataContext dk = new DataKartDataContext();

            var emailUsuario = dk.Usuarios
                .Where(x => x.idUsuario == idUsuario)
                .Select(x => x.Email)
                .SingleOrDefault();

            var grupo = dk.Kart_Grupos
                .SingleOrDefault(x => x.idGrupo == idGrupo);

            //http://kart.afonsoft.com.br/KartAmigos/informacoes
            if (grupo != null)
                html =
                    html.Replace("##NOMEGRUPO##", grupo.NomeGrupo)
                        .Replace("##SIGLAGRUPO##", grupo.Sigla)
                        .Replace("##URLAMIGAVEL##", "http://kart.afonsoft.com.br/" + grupo.UrlAcesso + "/informacoes");

            EnviaEmail(emailUsuario, html, "KartRanking - Regra do grupo modificado.", "");
        }
    }
}
