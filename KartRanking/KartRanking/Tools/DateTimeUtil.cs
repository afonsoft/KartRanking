using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KartRanking.Tools
{
    /// <summary>
    /// Classe para trabalhar com Datetime
    /// </summary>
    public static class DateTimeUtil
    {
        /// <summary>
        /// Retornar o valor em inteiro do tempo
        /// </summary>
        /// <param name="hor">00:00:000</param>
        /// <returns>Int</returns>
        public static int getIntFromHor(string hor)
        {
            string[] Hr = hor.Split(':');

            int hm = Convert.ToInt16(Hr[0]) * 60 * 60 * 1000;
            int Mm = Convert.ToInt16(Hr[1]) * 60 * 1000;
            int Sm = Convert.ToInt16(Hr[2]) * 1000;

            return hm + Mm + Sm;
        }
    }

    /// <summary>
    /// Classe para gerar chave unica.
    /// </summary>
    public static class UniqueKey
    {
        /// <summary>
        /// Gera uma chave unica utilizando o RNGCryptoServiceProvider
        /// </summary>
        public static string GetUniqueKey(int Size)
        {
            return GetUniqueKey(Size, true, true);
        }
        /// <summary>
        /// Gera uma chave unica utilizando o RNGCryptoServiceProvider
        /// </summary>
        public static string GetUniqueKey(int Size, bool OnlyUpper)
        {
            return GetUniqueKey(Size, OnlyUpper, false);
        }

        /// <summary>
        /// Gera uma chave unica utilizando o RNGCryptoServiceProvider
        /// </summary>
        public static string GetUniqueKey(int Size, bool OnlyUpper, bool RemoveZero)
        {
            //Remover o Zero 0 e o "O"
            string letters = "";
            if(OnlyUpper && RemoveZero)
                letters = "123456789ABCDEFGHIJKLMNPQRSTUVWXYZ";
            else if(!OnlyUpper && RemoveZero)
                letters = "123456789ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnpqrstuvwxyz";
            else if (OnlyUpper && !RemoveZero)
                letters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            else if (!OnlyUpper && !RemoveZero)
                letters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

            char[] chars = letters.ToCharArray(); 
            byte[] data = new byte[Size];
            System.Text.StringBuilder result = new System.Text.StringBuilder(Size);
            System.Security.Cryptography.RNGCryptoServiceProvider crypto = new System.Security.Cryptography.RNGCryptoServiceProvider();
            crypto.GetNonZeroBytes(data);
            foreach (byte b in data)
                result.Append(chars[b % (chars.Length - 1)]);

            return result.ToString().ToUpper();
        }
    }
}
