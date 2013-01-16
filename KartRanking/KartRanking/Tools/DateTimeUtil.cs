using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KartRanking.Tools
{
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
}
