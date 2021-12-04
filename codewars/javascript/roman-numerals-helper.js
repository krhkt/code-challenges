// https://www.codewars.com/kata/51b66044bce5799a7f000003

let RomanNumerals = {
    table: {
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000,
    },

    symbols: ['I', 'V', 'X', 'L', 'C', 'D', 'M'],
    
    toRoman: (number) => {
        if (number <= 0 || number > 4000) return null;

        let n = number;
        const s = RomanNumerals.symbols;

        let result = '';
        for (const power of [1, 2, 3, 4]) {
            const digit = n % 10;
            const i = power * 2;
            const [lo, mid, hi] = [s[i - 2], s[i - 1], s[i]];

            if (digit < 4) result = lo.repeat(digit) + result;
            else if (digit === 4) result = lo + mid + result;
            else if (digit > 8) result = lo + hi + result;
            else result = mid + lo.repeat(digit - 5) + result;

            n = Math.trunc(n / 10);
            if (n <= 0) break;
        }

        return result;
    },

    fromRoman: (roman) => {
        let result = 0;

        let size = Infinity;
        for (const letter of roman) {
            const value = RomanNumerals.table[letter];

            if (size >= value) result += value;
            else result += value - (size * 2);

            size = value;
        }
        
        return result;
    },
};
