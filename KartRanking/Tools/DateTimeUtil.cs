using System;

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
        public static int GetIntFromHor(string hor)
        {
            string[] hr = hor.Split(':');

            int hm = Convert.ToInt16(hr[0]) * 60 * 60 * 1000;
            int mm = Convert.ToInt16(hr[1]) * 60 * 1000;
            int sm = Convert.ToInt16(hr[2]) * 1000;

            return hm + mm + sm;
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
        public static string GetUniqueKey(int size)
        {
            return GetUniqueKey(size, true, true);
        }
        /// <summary>
        /// Gera uma chave unica utilizando o RNGCryptoServiceProvider
        /// </summary>
        public static string GetUniqueKey(int size, bool onlyUpper)
        {
            return GetUniqueKey(size, onlyUpper, false);
        }

        /// <summary>
        /// Gera uma chave unica utilizando o RNGCryptoServiceProvider
        /// </summary>
        public static string GetUniqueKey(int size, bool onlyUpper, bool removeZero)
        {
            //Remover o Zero 0 e o "O"
            string letters;
            if(onlyUpper && removeZero)
                letters = "123456789ABCDEFGHIJKLMNPQRSTUVWXYZ";
            else if(!onlyUpper && removeZero)
                letters = "123456789ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnpqrstuvwxyz";
            else if (onlyUpper)
                letters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            else letters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

            char[] chars = letters.ToCharArray(); 
            byte[] data = new byte[size];
            System.Text.StringBuilder result = new System.Text.StringBuilder(size);
            System.Security.Cryptography.RNGCryptoServiceProvider crypto = new System.Security.Cryptography.RNGCryptoServiceProvider();
            crypto.GetNonZeroBytes(data);
            foreach (byte b in data)
                result.Append(chars[b % (chars.Length - 1)]);

            return result.ToString().ToUpper();
        }
    }
}
