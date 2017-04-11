using System.Web.UI.WebControls;
using System.Data;

namespace KartRanking.Tools
{
    public static class ControlUtil
    {
        /// <summary>
        /// Selecionar um item de um DropDownList
        /// </summary>
        /// <param name="ddl">DropDownList</param>
        /// <param name="value">E o valor que se procura</param>
        public static void SelectByValue(ref DropDownList ddl, string value)
        {
            ListItem l = ddl.Items.FindByValue(value);
            int i = ddl.Items.IndexOf(l);
            ddl.SelectedIndex = i;
        }

        /// <summary>
        /// Selecionar um item de um DropDownList
        /// </summary>
        /// <param name="ddl">DropDownList</param>
        /// <param name="text">E o valor que se procura</param>
        public static void SelectByText(ref DropDownList ddl, string text)
        {
            var l = ddl.Items.FindByText(text);
            int i = ddl.Items.IndexOf(l);
            ddl.SelectedIndex = i;
        }

        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo<T>(DropDownList ddl, T obj, string value, string text)
        {
            PopulaCombo(ddl, obj, value, text, false);
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo<T>(DropDownList ddl, T obj, string value, string text, string textSelecione)
        {
            PopulaCombo(ddl, obj, value, text, true, textSelecione);
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo<T>(DropDownList ddl, T obj, string value, string text, bool exibirSelecione)
        {
            PopulaCombo(ddl, obj, value, text, exibirSelecione, "Selecione");
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo<T>(DropDownList ddl, T obj, string value, string text, bool exibirSelecione, string textSelecione)
        {
            ddl.DataSource = obj;
            ddl.DataValueField = value;
            ddl.DataTextField = text;
            ddl.DataBind();

            if (exibirSelecione)
                ddl.Items.Insert(0, new ListItem(textSelecione, "0", true));
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo(DropDownList ddl, DataSet ds, string value, string text)
        {
            PopulaCombo(ddl, ds.Tables[0], value, text);
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo(DropDownList ddl, DataSet ds, string value, string text, bool exibirSelecione)
        {
            PopulaCombo(ddl, ds.Tables[0], value, text, exibirSelecione);
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo(DropDownList ddl, DataTable dt, string value, string text)
        {
            PopulaCombo(ddl, dt, value, text, false);
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo(DropDownList ddl, DataTable dt, string value, string text, bool exibirSelecione)
        {
            DataView dv = dt.DefaultView;
            dv.Sort = text;

            ddl.DataSource = dv;
            ddl.DataValueField = value;
            ddl.DataTextField = text;
            ddl.DataBind();

            if (exibirSelecione)
                ddl.Items.Insert(0, new ListItem("Selecione", "0", true));
        }

        public static void PopulaComboUf(DropDownList ddl, string selecione)
        {
            if(!string.IsNullOrEmpty(selecione))
                ddl.Items.Add(new ListItem(selecione, "", true));

            ddl.Items.Add(new ListItem("AC - Acre", "AC", true));
            ddl.Items.Add(new ListItem("AL - Alagoas", "AL", true));
            ddl.Items.Add(new ListItem("AM - Amazonas", "AM", true));
            ddl.Items.Add(new ListItem("AP - Amapá", "AP", true));
            ddl.Items.Add(new ListItem("BA - Bahia", "BA", true));
            ddl.Items.Add(new ListItem("CE - Ceará", "CE", true));
            ddl.Items.Add(new ListItem("DF - Distrito Federal", "DF", true));
            ddl.Items.Add(new ListItem("ES - Espírito Santo", "ES", true));
            ddl.Items.Add(new ListItem("GO - Goiás", "GO", true));
            ddl.Items.Add(new ListItem("MA - Maranhão", "MA", true));
            ddl.Items.Add(new ListItem("MG - Minas Gerais", "MG", true));
            ddl.Items.Add(new ListItem("MS - Mato Grosso do Sul", "MS", true));
            ddl.Items.Add(new ListItem("MT - Mato Grosso", "MT", true));
            ddl.Items.Add(new ListItem("PA - Pará", "PA", true));
            ddl.Items.Add(new ListItem("PB - Paraíba", "PB", true));
            ddl.Items.Add(new ListItem("PE - Pernambuco", "PE", true));
            ddl.Items.Add(new ListItem("PI - Piauí", "PI", true));
            ddl.Items.Add(new ListItem("PR - Paraná", "PR", true));
            ddl.Items.Add(new ListItem("RJ - Rio de Janeiro", "RJ", true));
            ddl.Items.Add(new ListItem("RN - Rio Grande do Norte", "RN", true));
            ddl.Items.Add(new ListItem("RO - Rondônia", "RO", true));
            ddl.Items.Add(new ListItem("RR - Roraima", "RR", true));
            ddl.Items.Add(new ListItem("RS - Rio Grande do Sul", "RS", true));
            ddl.Items.Add(new ListItem("SC - Santa Catarina", "SC", true));
            ddl.Items.Add(new ListItem("SE - Sergipe", "SE", true));
            ddl.Items.Add(new ListItem("SP - São Paulo", "SP", true));
            ddl.Items.Add(new ListItem("TO - Tocantins", "TO", true));
            ddl.Items.Add(new ListItem("EX - Exterior", "EX", true));
        }
    }
}
