using System;
using System.Collections.Generic;
using System.Xml.Linq;
using System.IO;

namespace KartRanking.Tools
{
    public class SitemapUtil 
    {
        public void CreateSiteMap()
        {
            XNamespace ns = XNamespace.Get("http://www.sitemaps.org/schemas/sitemap/0.9");
            XElement urlset;
            XDocument siteMapDocument = new XDocument(urlset = new XElement(ns + "urlset"));
            foreach (Url links in CreateSiteMapNodes())
            {
                urlset.Add(new XElement
                (ns + "url",
                new XElement(ns + "loc", links.Loc),
                new XElement(ns + "lastmod", links.Lastmod.ToString("yyyy-MM-dd")),
                new XElement(ns + "changefreq", links.Changefreq),
                new XElement(ns + "priority", links.Priority)
                ));
            }

            siteMapDocument.Save($"{AppDomain.CurrentDomain.BaseDirectory}\\SiteMap.xml");
        }

        #region Members

        #endregion


        private string[] getDirectory(string path)
        {
            List<string> lstDir = new List<string> {path};
            string[] dirs = Directory.GetDirectories(path);   
            
            foreach(string dir in dirs)
                lstDir.AddRange(getDirectory(dir));

            lstDir.AddRange(dirs);
            return lstDir.ToArray();
        }

        private string[] GetFiles()
        {
            List<string> lstfiles = new List<string>();

            foreach (string dir in getDirectory(AppDomain.CurrentDomain.BaseDirectory))
            {
                lstfiles.AddRange(Directory.GetFiles(dir, "*.aspx"));
                //lstfiles.AddRange(Directory.GetFiles(dir, "*.html"));
                //lstfiles.AddRange(Directory.GetFiles(dir, "*.htm"));
            }

            return lstfiles.ToArray();
        }

        private List<Url> CreateSiteMapNodes()
        {
            List<Url> urls = new List<Url>();

            string[] files = GetFiles();

            string urlsite = "http://kart.afonsoft.com.br/";

            foreach (string file in files)
            {
                FileInfo info = new FileInfo(file);
                if (info.DirectoryName != null)
                {
                    var diretory = info.DirectoryName.Substring(info.DirectoryName.LastIndexOf("\\", StringComparison.Ordinal) + 1, info.DirectoryName.Length - info.DirectoryName.LastIndexOf("\\", StringComparison.Ordinal) - 1);

                    string urlfull;
                    if (diretory.ToLower() != "kartranking" && diretory.ToLower() != "kart" && diretory.ToLower() != "aspnet" && diretory.ToLower() != "test")
                        urlfull = urlsite + diretory + "/" + info.Name;
                    else
                        urlfull = urlsite + "/" + info.Name;

                    var u = new Url() { Lastmod = info.LastWriteTime, Priority = "0.5", Changefreq = "monthly", Loc = urlfull };
                    urls.Add(u);
                }
            }
            return urls;
        }

    }

    public class Url
    {
        public string Loc { get; set; }
        public DateTime Lastmod { get; set; }
        public string Changefreq { get; set; }
        public string Priority { get; set; }
    }
}