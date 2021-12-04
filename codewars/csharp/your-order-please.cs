using System;
using System.Linq;

public static class Kata
{
    //cheating by using LINQ here for my non-linq solution -.-
    private static int FindIndex(string word) => 
        int.Parse(word.First(char.IsNumber).ToString());

    public static string Order(string text)
    {
        if (string.IsNullOrWhiteSpace(text)) return text;

        var words = text.Split(' ');
        var rearrangedWords = new string[words.Length];

        foreach (var word in words)
        {
            var i = FindIndex(word);
            rearrangedWords[i - 1] = word;
        }

        return string.Join(' ', rearrangedWords);
    }

    public static string Order_Lambda(string text) =>
        string.Join(' ', text.Split(' ').OrderBy(w => w.FirstOrDefault(char.IsDigit)));
    
    public static string Order_Linq(string text) =>
        string.Join(' ',
            from word in text.Split(' ')
            orderby word.FirstOrDefault(char.IsDigit)
            select word
        );
}

