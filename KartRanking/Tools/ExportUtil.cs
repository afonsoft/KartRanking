using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace KartRanking.Tools
{
    public static class ExportUtil
    {
        /// <summary>
        /// Exportar um objeto para o excel
        /// </summary>
        public static void Export(string fileName, DataTable dt)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ContentEncoding = Encoding.Unicode;

            HttpContext.Current.Response.AddHeader("content-disposition", $"attachment; filename={fileName}");
            HttpContext.Current.Response.ContentType = "application/Ms-Excel";

            StringBuilder sb = new StringBuilder();
            //Add Header    
            for (int count = 0; count < dt.Columns.Count; count++)
            {
                if (dt.Columns[count] != null)
                    sb.Append(dt.Columns[count].ColumnName);
                if (count < dt.Columns.Count - 1)
                {
                    sb.Append(";");
                }
            }
            HttpContext.Current.Response.Write(sb + "\n");
            HttpContext.Current.Response.Flush();
            //Append Data

            for (int count = 0; count < dt.Rows.Count; count++)
            {
                sb = new StringBuilder();
                for (int col = 0; col <= dt.Columns.Count - 1; col++)
                {
                    if (!string.IsNullOrEmpty(dt.Rows[count][col].ToString()))
                        sb.Append(dt.Rows[count][col].ToString().Replace(";", " "));
                    sb.Append(";");
                }

                HttpContext.Current.Response.Write(sb + "\n");
                HttpContext.Current.Response.Flush();
            }
            //dr.Dispose();

            HttpContext.Current.Response.End();
        }

        /// <summary>
        /// Exportar um objeto para o excel
        /// </summary>
        public static void Export<T>(string fileName, IEnumerable<T> obj)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ContentEncoding = Encoding.Unicode;

            HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            HttpContext.Current.Response.ContentType = "application/vnd.xls";

            if (obj == null)
                return;

            var enumerable = obj as T[] ?? obj.ToArray();
            Type type = enumerable.ToArray()[0].GetType();

            StringBuilder sb = new StringBuilder();

            //Add Header  
            for (int count = 0; count < type.GetProperties().Length; count++)
            {
                System.Reflection.PropertyInfo property = type.GetProperties()[count];
                if (!string.IsNullOrEmpty(property.Name))
                {
                    sb.Append(property.Name);

                    if (count < type.GetProperties().Length - 1)
                    {
                        sb.Append(";");
                    }
                }
            }

            HttpContext.Current.Response.Write(sb + "\n");
            HttpContext.Current.Response.Flush();

            //Append Data
            foreach (T t in enumerable)
            {
                //Varrendo item por item do objeto
                type = t.GetType();

                sb = new StringBuilder();

                for (int count = 0; count < type.GetProperties().Length; count++)
                {
                    System.Reflection.PropertyInfo property = type.GetProperties()[count];

                    if (!string.IsNullOrEmpty(property.Name))
                    {
                        object value = type.InvokeMember(property.Name, System.Reflection.BindingFlags.GetProperty, null, t, new object[0]);

                        if (!string.IsNullOrEmpty(value?.ToString()))
                        {
                            value = value.ToString().Trim();
                            sb.Append(value.ToString().Replace(";", " "));
                        }
                        sb.Append(";");
                    }

                }

                HttpContext.Current.Response.Write(sb + "\n");
                HttpContext.Current.Response.Flush();
            }

            HttpContext.Current.Response.End();
        }

        /// <summary>
        /// Exportar um objeto para o excel
        /// </summary>
        public static void Export(string fileName, DataView dv)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ContentEncoding = Encoding.Unicode;

            HttpContext.Current.Response.AddHeader("content-disposition", $"attachment; filename={fileName}");
            HttpContext.Current.Response.ContentType = "application/vnd.xls";

            var dt = dv.ToTable();

            StringBuilder sb = new StringBuilder();
            //Add Header    
            for (int count = 0; count < dt.Columns.Count; count++)
            {
                if (dt.Columns[count] != null)
                    sb.Append(dt.Columns[count].ColumnName);
                if (count < dt.Columns.Count - 1)
                {
                    sb.Append(";");
                }
            }
            HttpContext.Current.Response.Write(sb + "\n");
            HttpContext.Current.Response.Flush();
            //Append Data

            for (int count = 0; count < dt.Rows.Count; count++)
            {
                sb = new StringBuilder();
                for (int col = 0; col <= dt.Columns.Count - 1; col++)
                {
                    if (!string.IsNullOrEmpty(dt.Rows[count][col].ToString()))
                        sb.Append(dt.Rows[count][col].ToString().Replace(";", " "));
                    sb.Append(";");
                }

                HttpContext.Current.Response.Write(sb + "\n");
                HttpContext.Current.Response.Flush();
            }
            //dr.Dispose();

            HttpContext.Current.Response.End();
        }

        /// <summary>
        /// Exportar um objeto para o excel
        /// </summary>
        public static void Export(string fileName, IDataReader dr)
        {

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ContentEncoding = Encoding.Unicode;

            HttpContext.Current.Response.AddHeader("content-disposition", $"attachment; filename={fileName}");
            HttpContext.Current.Response.ContentType = "application/vnd.xls";

            StringBuilder sb = new StringBuilder();
            //Add Header          

            for (int count = 0; count < dr.FieldCount; count++)
            {
                if (dr.GetName(count) != null)
                    sb.Append(dr.GetName(count));
                if (count < dr.FieldCount - 1)
                {
                    sb.Append(";");
                }
            }
            HttpContext.Current.Response.Write(sb + "\n");
            HttpContext.Current.Response.Flush();
            //Append Data

            while (dr.Read())
            {
                sb = new StringBuilder();

                for (int col = 0; col < dr.FieldCount - 1; col++)
                {
                    if (!dr.IsDBNull(col))
                        sb.Append(dr.GetValue(col).ToString().Replace(";", " "));

                    sb.Append(";");
                }
                if (!dr.IsDBNull(dr.FieldCount - 1))
                    sb.Append(dr.GetValue(dr.FieldCount - 1).ToString().Replace(";", " "));
                HttpContext.Current.Response.Write(sb + "\n");
                HttpContext.Current.Response.Flush();
            }
            dr.Dispose();

            HttpContext.Current.Response.End();
        }

        /// <summary>
        /// Exportar um objeto para o excel
        /// </summary>
        public static void Export(string fileName, DataSet ds)
        {
            if (ds.Tables.Count > 0)
                Export(fileName, ds.Tables[0]);
        }

        /// <summary>
        /// Exportar um objeto para o excel
        /// </summary>
        public static void Export(string fileName, GridView gv)
        {

            if (gv == null)
                return;

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ContentEncoding = Encoding.Unicode;

            HttpContext.Current.Response.AddHeader("content-disposition", $"attachment; filename={fileName}");
            HttpContext.Current.Response.ContentType = "application/ms-excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gv.RenderControl(htw);
            //  render the htmlwriter into the response
            HttpContext.Current.Response.Write(sw.ToString());
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
    }
}