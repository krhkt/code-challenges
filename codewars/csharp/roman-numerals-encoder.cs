// https://www.codewars.com/kata/51b62bf6a9c58071c600001b

using System;
using System.Collections;
using System.Collections.Specialized;

public class RomanConvert
{
    // using OrderedDictionary here because the Dictionary
    // data struct does NOT guarantee order. OrderedDictionary doesn't
    // have generics, that's why it's necessary to convert the Value to number
   private static readonly OrderedDictionary RomanNumerals =
    new OrderedDictionary
    {
        { "M", 1000 },
        { "CM", 900 },
        { "D", 500 },
        { "CD", 400 },
        { "C", 100 },
        { "XC", 90 },
        { "L", 50 },
        { "XL", 40 },
        { "X", 10 },
        { "IX", 9  },
        { "V", 5 },
        { "IV", 4 },
        { "I", 1 },
    };

    public static string Solution(int n)
    {
        if (n <= 0 || n > 3999) return "";

        var roman = "";
        foreach (DictionaryEntry de in RomanNumerals)
        {
            var value = Convert.ToInt32(de.Value);
            if (value > n) continue;
            while (n >= value)
            {
                roman += de.Key;
                n -= value;
            }
        }

        return roman;
    }
}