using System;
using System.Collections.Generic;
using System.Linq;

namespace GIS_test_duplicates
{
    class Result
    {
        public static void Duplicates(List<int> arr)
        {
            arr.Sort();

            Dictionary<int, int> res = new Dictionary<int, int>();

            int n = 0;

            while (n < arr.Count - 1)
            {

                if (arr[n] == arr[n + 1])
                {
                    res.Add(arr[n], 1);

                        while (arr[n] == arr[n + 1])
                        {
                            res[arr[n]]++;
                            n++;
                            if (n + 1 >= arr.Count) 
                            break;
                        }
                }

                n++;
            }

            Console.WriteLine();
            foreach (KeyValuePair<int, int> pair in res)
                Console.WriteLine("Значение: " + pair.Key + " Кол-во: " + pair.Value);
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            List<string> array = Console.ReadLine().Split(',', StringSplitOptions.RemoveEmptyEntries).ToList();

            List<int> list = new List<int>();

            foreach (string s in array)
                list.Add(Convert.ToInt32(s));

            Result.Duplicates(list);
        }
    }
}
