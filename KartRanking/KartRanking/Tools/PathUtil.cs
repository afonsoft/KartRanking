using System;
using System.Web;

namespace KartRanking.Tools
{
    public static class PathUtil
    {
        public static string GetPathFromRoot(string pathWithoutRoot)
        {
            string _ApplicationPath = HttpContext.Current.Request.ApplicationPath;
            System.Text.StringBuilder _PathToReturn = new System.Text.StringBuilder(_ApplicationPath);
            
            if (!pathWithoutRoot.StartsWith("/") && !_ApplicationPath.EndsWith("/"))
                _PathToReturn.Append("/");
            
            _PathToReturn.Append(pathWithoutRoot);
            
            return _PathToReturn.ToString();
        }

        public static string GetFullPathApplication()
        {
            string appPath = HttpContext.Current.Request.ApplicationPath;
            return HttpContext.Current.Request.MapPath(appPath);
        }

        public static string GetFullPathRoot()
        {
            return HttpContext.Current.Request.MapPath("~/");
        }

        public static string PhysicalApplicationPath()
        {
            return HttpContext.Current.Request.PhysicalApplicationPath;
        }
    }
}