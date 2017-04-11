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
            string applicationPath = HttpContext.Current.Request.ApplicationPath;
            System.Text.StringBuilder pathToReturn = new System.Text.StringBuilder(applicationPath);
            
            if (applicationPath != null && (!pathWithoutRoot.StartsWith("/") && !applicationPath.EndsWith("/")))
                pathToReturn.Append("/");
            
            pathToReturn.Append(pathWithoutRoot);
            
            return pathToReturn.ToString();
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