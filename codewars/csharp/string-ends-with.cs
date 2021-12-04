public class Kata
{
    public static bool Solution(string str, string ending) => str.EndsWith(ending);

    public static bool HandWrittenSolution(string text, string ending)
    {
        var index = text.Length - ending.Length;
        if (index < 0) return false;

        foreach (var c in ending)
        {
            if (text[index] != c) return false;
            index += 1;
        }

        return true;
    }
}