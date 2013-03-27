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
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.Unicode;

            HttpContext.Current.Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", fileName));
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
            HttpContext.Current.Response.Write(sb.ToString() + "\n");
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

                HttpContext.Current.Response.Write(sb.ToString() + "\n");
                HttpContext.Current.Response.Flush();
            }
            //dr.Dispose();

            HttpContext.Current.Response.End();
        }

        /// <summary>
        /// Exportar um objeto para o excel
        /// </summary>
        public static void Export<T>(string fileName, IEnumerable<T> Obj)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.Unicode;

            HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            HttpContext.Current.Response.ContentType = "application/vnd.xls";

            if (Obj == null)
                return;

            Type type = Obj.ToArray()[0].GetType();

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

            HttpContext.Current.Response.Write(sb.ToString() + "\n");
            HttpContext.Current.Response.Flush();

            //Append Data
            foreach (T t in Obj)
            {
                //Varrendo item por item do objeto
                type = t.GetType();

                sb = new StringBuilder();

                for (int count = 0; count < type.GetProperties().Length; count++)
                {
                    System.Reflection.PropertyInfo property = type.GetProperties()[count];

                    if (!string.IsNullOrEmpty(property.Name))
                    {
                        object Value = type.InvokeMember(property.Name, System.Reflection.BindingFlags.GetProperty, null, t, new object[0]);

                        if (Value != null && !string.IsNullOrEmpty(Value.ToString()))
                        {
                            Value = Value.ToString().Trim();
                            sb.Append(Value.ToString().Replace(";", " "));
                        }
                        sb.Append(";");
                    }

                }

                HttpContext.Current.Response.Write(sb.ToString() + "\n");
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
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.Unicode;

            HttpContext.Current.Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", fileName));
            HttpContext.Current.Response.ContentType = "application/vnd.xls";

            System.Data.DataTable dt = dv.ToTable();

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
            HttpContext.Current.Response.Write(sb.ToString() + "\n");
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

                HttpContext.Current.Response.Write(sb.ToString() + "\n");
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
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.Unicode;

            HttpContext.Current.Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", fileName));
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
            HttpContext.Current.Response.Write(sb.ToString() + "\n");
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
                HttpContext.Current.Response.Write(sb.ToString() + "\n");
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
        public static void Export(string fileName, System.Web.UI.WebControls.GridView gv)
        {

            if (gv == null)
                return;

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.Unicode;

            HttpContext.Current.Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", fileName));
            HttpContext.Current.Response.ContentType = "application/ms-excel";

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {
                    gv.RenderControl(htw);
                    //  render the htmlwriter into the response
                    HttpContext.Current.Response.Write(sw.ToString());
                    HttpContext.Current.Response.Flush();
                    HttpContext.Current.Response.End();
                }
            }
        }

        /// <summary>
        /// Replace any of the contained controls with literals
        /// </summary>
        private static void PrepareControlForExport(System.Web.UI.Control control)
        {
            for (int i = 0; i < control.Controls.Count; i++)
            {
                System.Web.UI.Control current = control.Controls[i];
                if (current is LinkButton)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl(((LinkButton)current).Text));
                }
                else if (current is ImageButton)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl(((ImageButton)current).AlternateText));
                }
                else if (current is HyperLink)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl(((HyperLink)current).Text));
                }
                else if (current is DropDownList)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl(((DropDownList)current).SelectedItem.Text));
                }
                else if (current is CheckBox)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl(((CheckBox)current).Checked ? "True" : "False"));
                }

                if (current.HasControls())
                {
                    PrepareControlForExport(current);
                }
            }
        }
    }
}