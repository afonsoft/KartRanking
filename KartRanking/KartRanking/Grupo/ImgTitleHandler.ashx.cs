using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Drawing;
using KartRanking.Tools;
using KartRanking.BaseDados;
using System.Drawing.Imaging;
using System.Drawing.Text;

namespace KartRanking.Grupo
{
    [WebService(Namespace = "http://kart.afonsoft.com.br/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class ImgTitleHandler : IHttpHandler
    {

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                context.Response.Clear();
                Image image = null;
                //Color cor = (Color)System.Drawing.ColorTranslator.FromHtml("#a31f1f");
                Color cor = (Color)System.Drawing.ColorTranslator.FromHtml("#fecc5f");
                PrivateFontCollection myFonts;

                FontFamily family = LoadFontFamily(PathUtil.GetFullPathRoot() + @"\Fonts\28dayslater-webfont.ttf", out myFonts);
                Font theFont = new Font(family, 48.0f);

                if (!String.IsNullOrEmpty(context.Request.QueryString["text"]))
                {
                    string Text = context.Request.QueryString["text"];
                    string f = context.Request.QueryString["f"];
                    if(!string.IsNullOrEmpty(f))
                        theFont = new Font(family, float.Parse(f));
                    image = DrawText(Text, theFont, cor, Color.Transparent);
                }
                else
                {
                    image = DrawText("Sem Nome", theFont, cor, Color.Transparent);
                }



                // Of course set this to whatever your format is of the image
                context.Response.ContentType = "image/png";
                // Save the image to the OutputStream
                image.Save(context.Response.OutputStream, ImageFormat.Png);
            }
            catch (Exception ex)
            {
                LogErro.Log.Logar(ex, null);
            }
        }


        private FontFamily LoadFontFamily(string fileName, out PrivateFontCollection _myFonts)
        {
            //IN MEMORY _myFonts point to the myFonts created in the load event 11 lines up.
            _myFonts = new PrivateFontCollection();//here is where we assing memory space to myFonts
            _myFonts.AddFontFile(fileName);//we add the full path of the ttf file
            return _myFonts.Families[0];//returns the family object as usual.
        }

        private Image DrawText(String text, Font font, Color textColor, Color backColor)
        {
            //first, create a dummy bitmap just to get a graphics object
            Image img = new Bitmap(1, 1);
            Graphics drawing = Graphics.FromImage(img);

            //measure the string to see how big the image needs to be
            SizeF textSize = drawing.MeasureString(text, font);

            //free up the dummy image and old graphics object
            img.Dispose();
            drawing.Dispose();

            //create a new image of the right size
            img = new Bitmap((int)textSize.Width, (int)textSize.Height);

            drawing = Graphics.FromImage(img);

            //paint the background
            drawing.Clear(backColor);

            //create a brush for the text
            Brush textBrush = new SolidBrush(textColor);

            drawing.DrawString(text, font, textBrush, 0, 0);
            
            drawing.Save();

            textBrush.Dispose();
            drawing.Dispose();

            return img;

        }
    }
}