// https://www.hackerrank.com/challenges/sherlock-and-anagrams/problem

const charIndex = (() => {
    const aCharCode = 'a'.charCodeAt(0);
    return (s, i) => s.charCodeAt(i) - aCharCode;
})();

function sherlockAndAnagrams(s) {
    let totalAnagrams = 0;

    //substring size iteration
    for (let size = 1; size < s.length; size += 1) {
        //substring "head" slider
        for (let i = 0; i < (s.length - size); i += 1) {
            const headCounting = countingLetters(s, i, i + size);

            // following line is possible because the head sliding window
            // always avoid full length substrings
            let j = i + 1;
            const tailCounting = countingLetters(s, j, j + size);
            console.log('tail', s.substring(j, j + size), tailCounting);
            //substring "tail" slider
            for (;;) {
                if (compareSameLengthArrays(headCounting, tailCounting)) totalAnagrams += 1;

                j += 1;
                if (j > (s.length - size)) break;
                
                //sliding counting window
                tailCounting[charIndex(s, j - 1)] -= 1;
                tailCounting[charIndex(s, j + size - 1)] += 1;
            }
        }
    }

    return totalAnagrams;
}

const countingLetters = (text, start, end) => {
    const counting = Array(26).fill(0); //this is generally really slow in JS

    for (let i = start; i < end; i += 1) {
        const index = charIndex(text, i);
        counting[index] += 1;
    }

    return counting;
};

const compareSameLengthArrays = (arr1, arr2) => {
    for (let i = 0; i < arr1.length; i += 1) {
        if (arr1[i] !== arr2[i]) return false;
    }
    return true;
};


// test area
console.log(sherlockAndAnagrams('abba'));