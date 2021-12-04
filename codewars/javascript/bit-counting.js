// https://www.codewars.com/kata/526571aae218b8ee490006f4

const countBits = function(n) {
    //shifting bits and counting if the resulting number is odd
    //because that means that the number to be shifted out is a 1
    
    let total1s = 0;
    while (n > 0) {
        if (n % 2 === 1) total1s += 1;

        n = Math.trunc(n / 2);
    }

    return total1s;
};