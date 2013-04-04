using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.IO;

namespace KartRanking.Tools
{
    public class SitemapUtil 
    {

        private readonly object _siteMapLock = new object();
        private SiteMapNode _siteMapRoot;

        public void createSiteMap()
        {
            XNamespace ns = XNamespace.Get("http://www.sitemaps.org/schemas/sitemap/0.9");
            XElement urlset = null;
            XDocument siteMapDocument = new XDocument(urlset = new XElement(ns + "urlset"));
            foreach (url links in CreateSiteMapNodes())
            {
                urlset.Add(new XElement
                (ns + "url",
                new XElement(ns + "loc", links.loc),
                new XElement(ns + "lastmod", links.lastmod.ToString("yyyy-MM-dd")),
                new XElement(ns + "changefreq", links.changefreq),
                new XElement(ns + "priority", links.priority)
                ));
            }

            siteMapDocument.Save(String.Format("{0}\\{1}", AppDomain.CurrentDomain.BaseDirectory, "SiteMap.xml"));
        }

        #region Members

        #endregion


        private string[] getDirectory(string path)
        {
            List<string> lstDir = new List<string>();
            string[] dirs = Directory.GetDirectories(path);   
            
            foreach(string dir in dirs)
                lstDir.AddRange(getDirectory(dir));

            lstDir.AddRange(dirs);
            return lstDir.ToArray();
        }

        private string[] getFiles()
        {
            List<string> lstfiles = new List<string>();

            foreach (string dir in getDirectory(AppDomain.CurrentDomain.BaseDirectory))
                lstfiles.AddRange(Directory.GetFiles(dir, "*.aspx"));

            return lstfiles.ToArray();
        }

        private List<url> CreateSiteMapNodes()
        {
            List<url> urls = new List<url>();

            string[] files = getFiles();

            url u = null;

            string diretory = "";
            string urlfull = "";
            string urlsite = "http://kart.afonsoft.com.br/";

            foreach (string file in files)
            {
                FileInfo info = new FileInfo(file);
                diretory = info.DirectoryName.Substring(info.DirectoryName.LastIndexOf("\\") + 1, info.DirectoryName.Length - info.DirectoryName.LastIndexOf("\\") - 1);
                
                if (diretory.ToLower() != "KartRanking")
                    urlfull = urlsite + diretory + "/" + info.Name;
                else
                    urlfull = urlsite + "/" + info.Name;

                u = new url() { lastmod = info.LastWriteTime, priority = "0.5", changefreq = "monthly", loc = urlfull };
                urls.Add(u);
            }
            return urls;
        }

    }

    public class url
    {
        public string loc { get; set; }
        public DateTime lastmod { get; set; }
        public string changefreq { get; set; }
        public string priority { get; set; }
    }
}