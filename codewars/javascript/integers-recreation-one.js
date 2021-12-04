// https://www.codewars.com/kata/55aa075506463dac6600010d

function calculateSumOfSquaredDivisors(num) {
    if (num === 1) return 1;

    const upperLimit = Math.trunc(num / 2);
    let sumSquaredDivisors = 1 + (num ** 2);

    for (let i = 2, j = upperLimit; i <= j; i += 1, j -= 1) {
        if (num % i === 0) sumSquaredDivisors += (i ** 2);
        if (i === j) continue;
        if (num % j === 0) sumSquaredDivisors += (j ** 2);
    }

    return sumSquaredDivisors;
}

function listSquared(m, n) {
    let pairs = [];

    for (let i = m; i <= n; i += 1) {
        const sumSquaredDivisors = calculateSumOfSquaredDivisors(i);
        const sumSquareRoot = sumSquaredDivisors ** (1 / 2);
        if (Math.trunc(sumSquareRoot) !== sumSquareRoot) continue;

        pairs.push([i, sumSquaredDivisors]);
    }

    return pairs;
}
