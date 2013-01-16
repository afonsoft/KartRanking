using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
        /// <param name="value">E o valor que se procura</param>
        public static void SelectByText(ref DropDownList ddl, string text)
        {
            System.Web.UI.WebControls.ListItem l = ddl.Items.FindByText(text);
            int i = ddl.Items.IndexOf(l);
            ddl.SelectedIndex = i;
        }

        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo<T>(DropDownList DDL, T obj, string Value, string Text)
        {
            PopulaCombo(DDL, obj, Value, Text, false);
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo<T>(DropDownList DDL, T obj, string Value, string Text, string TextSelecione)
        {
            PopulaCombo(DDL, obj, Value, Text, true, TextSelecione);
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo<T>(DropDownList DDL, T obj, string Value, string Text, bool ExibirSelecione)
        {
            PopulaCombo(DDL, obj, Value, Text, ExibirSelecione, "Selecione");
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo<T>(DropDownList DDL, T obj, string Value, string Text, bool ExibirSelecione, string TextSelecione)
        {
            DDL.DataSource = obj;
            DDL.DataValueField = Value;
            DDL.DataTextField = Text;
            DDL.DataBind();

            if (ExibirSelecione)
                DDL.Items.Insert(0, new System.Web.UI.WebControls.ListItem(TextSelecione, "0", true));
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo(DropDownList DDL, DataSet DS, string Value, string Text)
        {
            PopulaCombo(DDL, DS.Tables[0], Value, Text);
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo(DropDownList DDL, DataSet DS, string Value, string Text, bool ExibirSelecione)
        {
            PopulaCombo(DDL, DS.Tables[0], Value, Text, ExibirSelecione);
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo(DropDownList DDL, DataTable DT, string Value, string Text)
        {
            PopulaCombo(DDL, DT, Value, Text, false);
        }
        /// <summary>
        /// Popular o DropDownList pelo objeto
        /// </summary>
        public static void PopulaCombo(DropDownList DDL, DataTable DT, string Value, string Text, bool ExibirSelecione)
        {
            System.Data.DataView DV = DT.DefaultView;
            DV.Sort = Text;

            DDL.DataSource = DV;
            DDL.DataValueField = Value;
            DDL.DataTextField = Text;
            DDL.DataBind();

            if (ExibirSelecione)
                DDL.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Selecione", "0", true));
        }

        public static void PopulaComboUF(DropDownList DDL, string Selecione)
        {
            if(!string.IsNullOrEmpty(Selecione))
                DDL.Items.Add(new ListItem(Selecione, "", true));

            DDL.Items.Add(new ListItem("AC - Acre", "AC", true));
            DDL.Items.Add(new ListItem("AL - Alagoas", "AL", true));
            DDL.Items.Add(new ListItem("AM - Amazonas", "AM", true));
            DDL.Items.Add(new ListItem("AP - Amapá", "AP", true));
            DDL.Items.Add(new ListItem("BA - Bahia", "BA", true));
            DDL.Items.Add(new ListItem("CE - Ceará", "CE", true));
            DDL.Items.Add(new ListItem("DF - Distrito Federal", "DF", true));
            DDL.Items.Add(new ListItem("ES - Espírito Santo", "ES", true));
            DDL.Items.Add(new ListItem("GO - Goiás", "GO", true));
            DDL.Items.Add(new ListItem("MA - Maranhão", "MA", true));
            DDL.Items.Add(new ListItem("MG - Minas Gerais", "MG", true));
            DDL.Items.Add(new ListItem("MS - Mato Grosso do Sul", "MS", true));
            DDL.Items.Add(new ListItem("MT - Mato Grosso", "MT", true));
            DDL.Items.Add(new ListItem("PA - Pará", "PA", true));
            DDL.Items.Add(new ListItem("PB - Paraíba", "PB", true));
            DDL.Items.Add(new ListItem("PE - Pernambuco", "PE", true));
            DDL.Items.Add(new ListItem("PI - Piauí", "PI", true));
            DDL.Items.Add(new ListItem("PR - Paraná", "PR", true));
            DDL.Items.Add(new ListItem("RJ - Rio de Janeiro", "RJ", true));
            DDL.Items.Add(new ListItem("RN - Rio Grande do Norte", "RN", true));
            DDL.Items.Add(new ListItem("RO - Rondônia", "RO", true));
            DDL.Items.Add(new ListItem("RR - Roraima", "RR", true));
            DDL.Items.Add(new ListItem("RS - Rio Grande do Sul", "RS", true));
            DDL.Items.Add(new ListItem("SC - Santa Catarina", "SC", true));
            DDL.Items.Add(new ListItem("SE - Sergipe", "SE", true));
            DDL.Items.Add(new ListItem("SP - São Paulo", "SP", true));
            DDL.Items.Add(new ListItem("TO - Tocantins", "TO", true));
            DDL.Items.Add(new ListItem("EX - Exterior", "EX", true));
        }
    }
}
