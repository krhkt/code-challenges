using System;
using System.Collections.Generic;
using System.Linq;

public static class Kata
{
    //not using linq
    //O(n)
    public static bool IsPangram(string str)
    {
        var set = new HashSet<char>();

        foreach (var c in str.ToLower())
        {
            //explicit check instead of !Char.IsLetter
            if (c < 'a' || c > 'z') continue;
            set.Add(c);
        }

        return set.Count == 26;
    }

    //easier to read
    //assuming distinct here is implemented using a HashSet
    //O(n)
    public static bool IsPangram_UsingLinq(string str) =>
        str.ToLower()           //n
        .Where(Char.IsLetter)   //n
        .Distinct()             //n
        .Count() == 26;         //n
}
