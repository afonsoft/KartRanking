using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Imaging;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace KartRanking.Administrador
{
    /********************************************************
    * CRIADO POR: AFONSO DUTRA NOGUEIRA FILHO (AFONSOFT)   *
    * DATA: 26-03-2014                                     *
    * E-MAIL: afonsoft@outlook.com.br                      *
    * ******************************************************
    * ALTERAÇÕES:                                          *
    *                                                      *
    ********************************************************/
    public partial class Captcha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();

            Font font;
            Random random = new Random();
            string s = "";
            for (int i = 0; i < 5; i++)
            {
                s = s + random.Next(10).ToString();
            }
            Bitmap bitmap = new Bitmap(130, 25, PixelFormat.Format32bppArgb);
            Graphics g = Graphics.FromImage(bitmap);
            g.SmoothingMode = SmoothingMode.HighQuality;
            Rectangle rect = new Rectangle(0, 0, 130, 25);
            HatchBrush hatchBrush = new HatchBrush(HatchStyle.SmallConfetti, Color.LightGray, Color.White);
            g.FillRectangle(hatchBrush, rect);
            float fontSize = rect.Height + 15;

            do
            {
                fontSize--;
                font = new Font(FontFamily.GenericSerif.Name, fontSize, FontStyle.Regular);
            }

            while (g.MeasureString(s, font).Width >= rect.Width);

            StringFormat format = new StringFormat
            {
                Alignment = StringAlignment.Center,
                LineAlignment = StringAlignment.Center
            };
            GraphicsPath path = new GraphicsPath();
            path.AddString(s, font.FontFamily, (int)font.Style, font.Size + 3, rect, format);
            float v = 4f;
            PointF[] points = new PointF[] { new PointF(((float)random.Next(rect.Width)) / v, ((float)random.Next(rect.Height)) / v), new PointF(rect.Width - (((float)random.Next(rect.Width)) / v), ((float)random.Next(rect.Height)) / v), new PointF(((float)random.Next(rect.Width)) / v, rect.Height - (((float)random.Next(rect.Height)) / v)), new PointF(rect.Width - (((float)random.Next(rect.Width)) / v), rect.Height - (((float)random.Next(rect.Height)) / v)) };
            Matrix matrix = new Matrix();
            matrix.Translate(0f, 0f);
            path.Warp(points, rect, matrix, WarpMode.Perspective, 0f);
            hatchBrush = new HatchBrush(HatchStyle.LargeConfetti, Color.LightGray, Color.Black);
            g.FillPath(hatchBrush, path);
            int m = Math.Max(rect.Width, rect.Height);
            for (int i = 0; i < ((int)(((float)(rect.Width * rect.Height)) / 30f)); i++)
            {
                int x = random.Next(rect.Width);
                int y = random.Next(rect.Height);
                int w = random.Next(m / 50);
                int h = random.Next(m / 50);
                g.FillEllipse(hatchBrush, x, y, w, h);
            }
            this.Session["CaptchaImageText"] = s;
            this.ViewState["CaptchaImageText"] = s;
            font.Dispose();
            hatchBrush.Dispose();
            g.Dispose();
            base.Response.ContentType = "image/GIF";
            bitmap.Save(base.Response.OutputStream, ImageFormat.Gif);
            bitmap.Dispose();
        }
    }
}
