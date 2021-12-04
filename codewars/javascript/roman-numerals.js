// https://www.codewars.com/kata/51b66044bce5799a7f000003/train/javascript


let RomanNumerals = {
    table: Object.freeze({
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000,
    }),

    symbols: ['I', 'V', 'X', 'L', 'C', 'D', 'M'],
    
    toRoman: (number) => {
        if (number <= 0 || number > 4000) return null;
        
        let n = number;
        const s = RomanNumerals.symbols;
        
        let result = '';
        for (const power of [1, 2, 3, 4]) {
            const digit = n % (10);
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
            if (size >= value) {
                result += value;
            } else {
                result += value - (size * 2);
            }

            size = value;
        }
        
        return result;
    },
};

// test area
let a = [1,2,3,4,5,6,7,8,9,10,23,36,47,50,78,93,100,123,145,150, 250, 324, 458, 500, 876, 934, 1000, 1001, 1012, 2999, 3999];
for (const i of a) {
    const roman = RomanNumerals.toRoman(i);
    const number = RomanNumerals.fromRoman(roman);
    console.log(i, roman, number);
}
