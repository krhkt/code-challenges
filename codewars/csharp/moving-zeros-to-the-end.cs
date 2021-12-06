// https://www.codewars.com/kata/52597aa56021e91c93000cb0/train/csharp

public class Kata
{
    // in-place solution
    public static int[] MoveZeroes(int[] arr)
    {
        var index = 0;
        foreach (var e in arr) 
        {
            if (e == 0) continue;

            arr[index] = e;
            index += 1;
        }

        for (; index < arr.Length; index += 1) arr[index] = 0;

        return arr;
    }


    // v1 mindless
    public static int[] MoveZeroes_v1(int[] arr)
    {
        var numberOfZeros = 0;
        var index = 0;
        foreach (var e in arr) 
        {
            if (e == 0) 
            {
                numberOfZeros += 1;
                continue;
            }

            arr[index] = e;
            index += 1;
        }

        for (var i = arr.Length - numberOfZeros; i < arr.Length; i += 1)
        {
            arr[i] = 0;
        }

        return arr;
    }
}