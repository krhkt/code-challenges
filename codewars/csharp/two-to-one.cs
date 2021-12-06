// https://www.codewars.com/kata/5656b6906de340bd1b0000ac

using System.Linq;

public class TwoToOne 
{
  
  public static string Longest(string s1, string s2) => 
    string.Join("", (s1 + s2).Distinct().OrderBy(c => c));
}
