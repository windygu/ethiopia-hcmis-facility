using System;
using System.ComponentModel; 
using System.Collections;
using System.Globalization;

namespace CommCtrl
{
    public class EthDate
    {
        public int Year;
        public int Month;
        public int Day;

        public EthDate()
        {
            //Get today's date in the class
            Year = DateTime.Now.Year;
            Month = DateTime.Now.Month;
            Day = DateTime.Now.Day;

            GregorianToEthiopian(ref Year, ref Month, ref Day);
        }

        public EthDate(int year, int month, int day)
        {
            Year = year;
            Month = month;
            Day = day;
        }

        public EthDate(string ddMMyyyy)
        {
            ///Receives format like DD/MM/YYYY
            ///
            string[] dateArr;
            dateArr = ddMMyyyy.Split('/');
            Year = int.Parse(dateArr[0]);
            Month = int.Parse(dateArr[1]);
            Day = int.Parse(dateArr[2]);
        }

        public string ToDateString()
        {
            string date = Day.ToString() + "/" + Month.ToString() + "/" + Year.ToString();
            return date;
        }


        public void SetDate(int gregorianYear, int gregorianMonth, int gregorianDay)
        {
            ///Input is gregorian calendar.
            ///
            Year = gregorianYear;
            Month = gregorianMonth;
            Day = gregorianDay;
            GregorianToEthiopian(ref Year, ref Month, ref Day);
        }

     

        public string GetMonthName()
        {
            switch (Month)
            {
                case 1:
                    return "መስከረም";
                case 2:
                    return "ጥቅምት";
                case 3:
                    return "ህዳር";
                case 4:
                    return "ታህሳስ";
                case 5:
                    return "ጥር";
                case 6:
                    return "የካቲት";
                case 7:
                    return "መጋቢት";
                case 8:
                    return "ሚያዚያ";
                case 9:
                    return "ግንቦት";
                case 10:
                    return "ሰኔ";
                case 11:
                    return "ሐምለሌ";
                case 12:
                    return "ነሃሴ";
                case 13:
                    return "ጳጉሜ";
            }
            return null;
        }

        protected static int GetEthiopianDay(int gregorianYear, int gregorianMonth, int gregorianDay)
        {
            ///Just get the day in the Ethiopian Calandar.
            ///
            int ethDay = gregorianDay;
            GregorianToEthiopian(ref gregorianYear, ref gregorianMonth, ref ethDay);
            return ethDay;
        }

        protected static int GetEthiopianYear(int gregorianYear, int gregorianMonth)
        {
            ///Returns Ethiopian year as an output.
            ///Takes the gregorian date as input.
            ///
            return (gregorianMonth >= 9 && gregorianMonth <= 12) ? gregorianYear - 7 : gregorianYear - 8;
        }

        public bool CheckLeapYear()//int gregorianYear, int gregorianMonth)
        {
            //int yr = GetEthiopianYear(gregorianYear, gregorianMonth);

            if ((Year % 4) == 0 && (Year % 100) != 0)
                return true;

            return false;
        }

        protected static bool CheckLeapYear(int gregorianYear, int gregorianMonth)
        {
            int yr = GetEthiopianYear(gregorianYear, gregorianMonth);

            if ((yr % 4) == 0 && (yr % 100) != 0)
                return true;

            return false;
        }

        ///---------------------------------------------------------

        public static int EthiopianToFixed(int ethiopianYear, int ethiopianMonth, int ethiopianDay)
        {
            return ((((0xaeb + (0x16d * (ethiopianYear - 1))) + ((int)Math.Floor((double)(((double)ethiopianYear) / 4.0)))) + (30 * (ethiopianMonth - 1))) + ethiopianDay);
        }

        public static void FixedToEthiopian(int fixedDate, ref int year, ref int month, ref int day)
        {
            year = (int)Math.Floor((double)(((double)((4 * (fixedDate - 0xaec)) + 0x5b7)) / 1461.0));
            month = ((int)Math.Floor((double)(((double)(fixedDate - EthiopianToFixed(year, 1, 1))) / 30.0))) + 1;
            day = (fixedDate + 1) - EthiopianToFixed(year, month, 1);
        }

        public DayOfWeek EthiopianDayOfWeek(int ethiopianYear, int ethiopianMonth, int ethiopianDay)
        {
            ///The input is in the ethiopian calendar.

            int i = (Math.Abs(EthiopianToFixed(ethiopianYear, ethiopianMonth, 1)) % 7);
            switch (i)
            {
                case 0:
                    return DayOfWeek.Sunday;

                case 1:
                    return DayOfWeek.Monday;

                case 2:
                    return DayOfWeek.Tuesday;

                case 3:
                    return DayOfWeek.Wednesday;

                case 4:
                    return DayOfWeek.Thursday;

                case 5:
                    return DayOfWeek.Friday;

                case 6:
                    return DayOfWeek.Saturday;
            }
            return DayOfWeek.Sunday;
        }

        public static int GregorianToFixed(int gregorianYear, int gregorianMonth, int gregorianDay)
        {
            return (((((((0x16d * (gregorianYear - 1)) + ((int)Math.Floor((double)(((double)(gregorianYear - 1)) / 4.0)))) - ((int)Math.Floor((double)(((double)(gregorianYear - 1)) / 100.0)))) + ((int)Math.Floor((double)(((double)(gregorianYear - 1)) / 400.0)))) + ((int)Math.Floor((double)(((double)((0x16f * gregorianMonth) - 0x16a)) / 12.0)))) + ((gregorianMonth <= 2) ? 0 : (CheckLeapYear(gregorianYear, gregorianMonth) ? -1 : -2))) + gregorianDay);
        }

        public static void GregorianToEthiopian(ref int gregorianYear, ref int gregorianMonth, ref int gregorianDay)
        {
            FixedToEthiopian(GregorianToFixed(gregorianYear, gregorianMonth, gregorianDay), ref gregorianYear, ref gregorianMonth, ref gregorianDay);
        }

        public static string GregorianToEthiopian(DateTime gregorianDate)
        {
            if (gregorianDate == null)
                return "";
            int gregorianYear, gregorianMonth, gregorianDay;
            gregorianYear = gregorianDate.Year;
            gregorianMonth = gregorianDate.Month;
            gregorianDay = gregorianDate.Day;

            FixedToEthiopian(GregorianToFixed(gregorianYear, gregorianMonth, gregorianDay), ref gregorianYear, ref gregorianMonth, ref gregorianDay);
            return gregorianDay + "/" + gregorianMonth + "/" + gregorianYear; //by now the date is ethiopian
        }


        public static int GregorianToEthiopian(int hour)
        {
            return (((0x18 + hour) - 6) % 0x18);
        }

        public DayOfWeek GetDayOfWeek()//DateTime time)
        {
            //int year = time.Year;
            //int month = time.Month;
            //int day = time.Day;
            //GregorianToEthiopian(ref year, ref month, ref day);
            return EthiopianDayOfWeek(Year, Month, Day);
        }

        public int GetDayOfWeekInt()//DateTime time)
        {
            //int year = time.Year;
            //int month = time.Month;
            //int day = time.Day;

            //GregorianToEthiopian(ref year, ref month, ref day);
            return (int)EthiopianDayOfWeek(Year, Month, Day);
        }

        public static int EthiopianToGregorian(int hour)
        {
            return (((0x18 + hour) + 6) % 0x18);
        }

        public static void EthiopianToGregorian(ref int year, ref int month, ref int day)
        {
            FixedToGregorian(EthiopianToFixed(year, month, day), ref year, ref month, ref day);
        }

        public static DateTime EthiopianToGregorian(string ethiopianDateDDMMYYYY)
        {
            string[] dateParts = ethiopianDateDDMMYYYY.Split('/');
            int day = int.Parse(dateParts[0]);
            int month = int.Parse(dateParts[1]);
            int year = int.Parse(dateParts[2]);

            FixedToGregorian(EthiopianToFixed(year, month, day), ref year, ref month, ref day);
            DateTime dt = new DateTime(year, month, day);
            return dt;
        }

        private static void FixedToGregorian(int fixedDate, ref int year, ref int month, ref int day)
        {
            GregorianCalendar gregorianCalendar = new GregorianCalendar();
            year = GregorianYearFromFixed(fixedDate);
            int num2 = fixedDate - GregorianToFixed(year, 1, 1);
            int num = (fixedDate < GregorianToFixed(year, 3, 1)) ? 0 : (gregorianCalendar.IsLeapYear(year) ? 1 : 2);
            month = (int)Math.Floor((double)(((double)((12 * (num2 + num)) + 0x175)) / 367.0));
            day = (fixedDate - GregorianToFixed(year, month, 1)) + 1;
        }

        private static int GregorianYearFromFixed(int fixedDate)
        {
            int num = fixedDate - 1;
            int num2 = (int)Math.Floor((double)(((double)num) / 146097.0));
            int num3 = num % 0x23ab1;
            int num4 = (int)Math.Floor((double)(((double)num3) / 36524.0));
            int num5 = num3 % 0x8eac;
            int num6 = (int)Math.Floor((double)(((double)num5) / 1461.0));
            int num7 = num5 % 0x5b5;
            int num8 = (int)Math.Floor((double)(((double)num7) / 365.0));
            int num9 = (((400 * num2) + (100 * num4)) + (4 * num6)) + num8;
            return (((num4 == 4) || (num8 == 4)) ? num9 : (num9 + 1));
        }

    }

    }


					
		

		

