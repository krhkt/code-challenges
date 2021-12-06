// https://www.codewars.com/kata/5541f58a944b85ce6d00006a

public static class Kata
{
    public static ulong[] productFib(ulong prod)
    {
        ulong fib1 = 0, fib2 = 1;

        while ((fib1 * fib2) < prod)
        {
            var fibAux = fib2;
            fib2 += fib1;
            fib1 = fibAux;
        }

        return new ulong[] { fib1, fib2, (fib1 * fib2) == prod ? 1ul : 0ul };
    }
}
