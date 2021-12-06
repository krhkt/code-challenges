// https://www.codewars.com/kata/556deca17c58da83c00002db/train/csharp

public class Xbonacci
{
    public double[] Tribonacci(double[] signature, int n)
    {
        var sequence = new double[n];

        double fib1 = signature[0],
            fib2 = signature[1],
            fib3 = signature[2];

        for (var i = 0; i < n; i += 1)
        {
            sequence[i] = fib1;
            (fib1, fib2, fib3) = (fib2, fib3, fib1 + fib2 + fib3);
        }

        return sequence;
    }
}