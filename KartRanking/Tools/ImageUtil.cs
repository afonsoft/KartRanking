using System;
using System.IO;
using System.Drawing;

namespace KartRanking.Tools
{
    public static class ImageUtil
    {
        /// <summary>
        /// ResizeImage
        /// </summary>
        public static Image ResizeImage(Image fullsizeImage, int newWidth, int maxHeight, bool onlyResizeIfWider)
        {
            // Prevent using images internal thumbnail
            fullsizeImage.RotateFlip(RotateFlipType.Rotate180FlipNone);
            fullsizeImage.RotateFlip(RotateFlipType.Rotate180FlipNone);

            if (onlyResizeIfWider)
            {
                if (fullsizeImage.Width <= newWidth)
                    newWidth = fullsizeImage.Width;
            }
            int newHeight = fullsizeImage.Height * newWidth / fullsizeImage.Width;

            if (newHeight > maxHeight)
            {
                // Resize with height instead
                newWidth = fullsizeImage.Width * maxHeight / fullsizeImage.Height;
                newHeight = maxHeight;
            }
            var newImage = fullsizeImage.GetThumbnailImage(newWidth, newHeight, null, IntPtr.Zero);
            // Clear handle to original file so that we can overwrite it if necessary
            fullsizeImage.Dispose();
            // Save resized picture
            return newImage;
        }
        /// <summary>
        /// FileToImage
        /// </summary>
        public static Image FileToImage( string imagePath )
        {
            return ByteArrayToImage( ImageToBinary( imagePath ) );
        }
        /// <summary>
        /// ImageToBinary
        /// </summary>
        public static byte[] ImageToBinary(string imagePath)
        {
            if ( !File.Exists( imagePath ) )
                throw new FileNotFoundException( "Arquivo não localizado!", imagePath );

            FileStream fileStream = new FileStream(imagePath, FileMode.Open, FileAccess.Read);
            byte[] buffer = new byte[fileStream.Length];
            fileStream.Read(buffer, 0, (int)fileStream.Length);
            fileStream.Close();
            return buffer;
        }
        /// <summary>
        /// ImageToBinary
        /// </summary>
        public static byte[] ImageToBinary(Image imageIn)
        {
            MemoryStream ms = new MemoryStream();
            imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            return ms.ToArray();
        }
        /// <summary>
        /// byteArrayToImage
        /// </summary>
        public static Image ByteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            Image returnImage = Image.FromStream(ms);
            return returnImage;
        }
        /// <summary>
        /// BinaryToImage
        /// </summary>
        public static Image BinaryToImage(System.Data.Linq.Binary binaryData)
        {
            if (binaryData == null) return null;

            byte[] buffer = binaryData.ToArray();
            MemoryStream memStream = new MemoryStream();
            memStream.Write(buffer, 0, buffer.Length);
            return Image.FromStream(memStream);
        }
    }
}
