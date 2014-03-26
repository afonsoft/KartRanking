using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

        public GenericXmlSerializer()
        {
        }

        /// <summary>
        /// Serializar um objeto em arquivo
        /// </summary>
        public void Serialize(T obj, string Path)
        {
            using (System.IO.StreamWriter oStreamWriter = new System.IO.StreamWriter(Path))
            {
                System.Xml.Serialization.XmlSerializer oXmlSerializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
                oXmlSerializer.Serialize(oStreamWriter, obj);
                oStreamWriter.Close();
            }
        }
        /// <summary>
        /// Serializar um objeto e retornar uma string
        /// </summary>
        public String Serialize(T obj)
        {
            String XmlizedString = null;
            using (MemoryStream memoryStream = new MemoryStream())
            {
                System.Xml.Serialization.XmlSerializer oXmlSerializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
                XmlTextWriter xmlTextWriter = new XmlTextWriter(memoryStream, Encoding.UTF8);
                oXmlSerializer.Serialize(xmlTextWriter, obj);
                XmlizedString = UTF8ByteArrayToString(memoryStream.ToArray());
                memoryStream.Close();
            }
            return XmlizedString;
        }

        /// <summary>
        /// deserializar uma string em objeto
        /// </summary>
        public T Deserialize(string pXmlizedString)
        {
            T obj;
            System.Xml.Serialization.XmlSerializer oXmlSerializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
            using (MemoryStream memoryStream = new MemoryStream(StringToUTF8ByteArray(pXmlizedString)))
            {
                obj = (T)oXmlSerializer.Deserialize(memoryStream);
                memoryStream.Close();
            }
            return obj;
        }

        /// <summary>
        /// deserializar uma arquivo em objeto
        /// </summary>
        public T Deserialize(FileInfo Path)
        {
            T obj;
            System.Xml.Serialization.XmlSerializer oXmlSerializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
            using (System.IO.StreamReader oStreamReader = new System.IO.StreamReader(Path.FullName))
            {
                obj = (T)oXmlSerializer.Deserialize(oStreamReader);
                oStreamReader.Close();
            }
            return obj;
        }

        public String UTF8ByteArrayToString(Byte[] characters)
        {

            UTF8Encoding encoding = new UTF8Encoding();
            String constructedString = encoding.GetString(characters);
            return (constructedString);
        }

        public Byte[] StringToUTF8ByteArray(String pXmlString)
        {
            UTF8Encoding encoding = new UTF8Encoding();
            Byte[] byteArray = encoding.GetBytes(pXmlString);
            return byteArray;
        }
    }
}
