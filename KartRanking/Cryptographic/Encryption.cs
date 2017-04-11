using System;
using System.Text;
using System.Security.Cryptography;

namespace KartRanking.Cryptographic
{
    public class Encryption
    {
        /// <summary>
        /// Criptografar uma string
        /// </summary>
        /// <param name="texto">String a ser criptografar</param>
        /// <returns>String Criptografar</returns>
        public String Criptografar(String texto)
        {
            return Criptografar(texto, "AbCdEfGh");
        }
        /// <summary>
        /// Criptografar uma string
        /// </summary>
        /// <param name="texto">String a ser criptografar</param>
        /// <param name="chaveCriptografia">Chave usada para criptografar Min/Max 8 caracter</param>
        /// <returns>String Criptografar</returns>
        public String Criptografar(String texto, String chaveCriptografia)
        {
            TripleDES tdes = TripleDES.Create();
            tdes.Key = Encoding.ASCII.GetBytes("passwordDR0wSS@P6660juht");
            tdes.IV = Encoding.ASCII.GetBytes(chaveCriptografia);
            byte[] data = Encoding.ASCII.GetBytes(texto);
            tdes.Mode = CipherMode.CBC;
            tdes.Padding = PaddingMode.Zeros;
            ICryptoTransform ict = tdes.CreateEncryptor();
            var enc = ict.TransformFinalBlock(data, 0, data.Length);
            return ByteArrayToString(enc);

        }

        /// <summary>
        /// Descriptografar uma string
        /// </summary>
        /// <param name="texto">String Criptografar</param>
        /// <returns>String desriptografar</returns>
        public String Descriptografar(String texto)
        {
            return Descriptografar(texto, "AbCdEfGh");
        }
        /// <summary>
        /// Descriptografar uma string
        /// </summary>
        /// <param name="texto">String Criptografar</param>
        /// <param name="chaveCriptografia">Chave usada para Descriptografar Min/Max 8 caracter</param>
        /// <returns>String desriptografar</returns>
        public String Descriptografar(String texto, String chaveCriptografia)
        {
            TripleDES tripleDes = TripleDES.Create();
            tripleDes.IV = Encoding.ASCII.GetBytes(chaveCriptografia);
            tripleDes.Key = Encoding.ASCII.GetBytes("passwordDR0wSS@P6660juht");
            tripleDes.Mode = CipherMode.CBC;
            tripleDes.Padding = PaddingMode.Zeros;
            ICryptoTransform crypto = tripleDes.CreateDecryptor();
            byte[] decodedInput = StringToByteArray(texto);
            byte[] decryptedBytes = crypto.TransformFinalBlock(decodedInput, 0, decodedInput.Length);
            return Encoding.ASCII.GetString(decryptedBytes);
        }

        public byte[] StringToByteArray(string hex)
        {
            int numberChars = hex.Length;
            byte[] bytes = new byte[numberChars / 2];
            for (int i = 0; i < numberChars; i += 2)
                bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
            return bytes;
        }

        public string ByteArrayToString(byte[] bin)
        {
            string hex = BitConverter.ToString(bin);
            return hex.Replace("-", "");
        }
    }
}
