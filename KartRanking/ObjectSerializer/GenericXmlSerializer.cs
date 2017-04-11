using System;
using System.Xml;
using System.IO;
using System.Text;

namespace KartRanking.ObjectSerializer
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
    public class GenericXmlSerializer<T>
    {
        /// <summary>
        /// Serializar um objeto em arquivo
        /// </summary>
        public void Serialize(T obj, string path)
        {
            using (var oStreamWriter = new StreamWriter(path))
            {
                System.Xml.Serialization.XmlSerializer oXmlSerializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
                oXmlSerializer.Serialize(oStreamWriter, obj);
                //oStreamWriter.Close();
            }
        }
        /// <summary>
        /// Serializar um objeto e retornar uma string
        /// </summary>
        public String Serialize(T obj)
        {
            String xmlizedString;
            using (MemoryStream memoryStream = new MemoryStream())
            {
                System.Xml.Serialization.XmlSerializer oXmlSerializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
                XmlTextWriter xmlTextWriter = new XmlTextWriter(memoryStream, Encoding.UTF8);
                oXmlSerializer.Serialize(xmlTextWriter, obj);
                xmlizedString = Utf8ByteArrayToString(memoryStream.ToArray());
                //memoryStream.Close();
            }
            return xmlizedString;
        }

        /// <summary>
        /// deserializar uma string em objeto
        /// </summary>
        public T Deserialize(string pXmlizedString)
        {
            T obj;
            System.Xml.Serialization.XmlSerializer oXmlSerializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
            using (MemoryStream memoryStream = new MemoryStream(StringToUtf8ByteArray(pXmlizedString)))
            {
                obj = (T)oXmlSerializer.Deserialize(memoryStream);
                //memoryStream.Close();
            }
            return obj;
        }

        /// <summary>
        /// deserializar uma arquivo em objeto
        /// </summary>
        public T Deserialize(FileInfo path)
        {
            T obj;
            System.Xml.Serialization.XmlSerializer oXmlSerializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
            using (var oStreamReader = new StreamReader(path.FullName))
            {
                obj = (T)oXmlSerializer.Deserialize(oStreamReader);
                //oStreamReader.Close();
            }
            return obj;
        }

        public String Utf8ByteArrayToString(Byte[] characters)
        {

            UTF8Encoding encoding = new UTF8Encoding();
            String constructedString = encoding.GetString(characters);
            return (constructedString);
        }

        public Byte[] StringToUtf8ByteArray(String pXmlString)
        {
            UTF8Encoding encoding = new UTF8Encoding();
            Byte[] byteArray = encoding.GetBytes(pXmlString);
            return byteArray;
        }
    }
}
