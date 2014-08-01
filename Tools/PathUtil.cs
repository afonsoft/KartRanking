using System;
using System.Web;

namespace KartRanking.Tools
{
    public static class PathUtil
    {
        /// <summary>
        /// GetPathFromRoot
        /// </summary>
        public static string GetPathFromRoot(string pathWithoutRoot)
        {
            string _ApplicationPath = HttpContext.Current.Request.ApplicationPath;
            System.Text.StringBuilder _PathToReturn = new System.Text.StringBuilder(_ApplicationPath);
            
            if (!pathWithoutRoot.StartsWith("/") && !_ApplicationPath.EndsWith("/"))
                _PathToReturn.Append("/");
            
            _PathToReturn.Append(pathWithoutRoot);
            
            return _PathToReturn.ToString();
        }

        /// <summary>
        /// GetFullPathApplication
        /// </summary>
        public static string GetFullPathApplication()
        {
            string appPath = HttpContext.Current.Request.ApplicationPath;
            return HttpContext.Current.Request.MapPath(appPath);
        }

        /// <summary>
        /// GetFullPathRoot
        /// </summary>
        public static string GetFullPathRoot()
        {
            return HttpContext.Current.Request.MapPath("~/");
        }

        /// <summary>
        /// PhysicalApplicationPath
        /// </summary>
        public static string PhysicalApplicationPath()
        {
            return HttpContext.Current.Request.PhysicalApplicationPath;
        }
    }
}