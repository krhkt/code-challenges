
// https://www.hackerrank.com/challenges/sherlock-and-anagrams/problem
const aCharCode = 97;

function sherlockAndAnagrams(s) {
    let totalAnagrams = 0;

    //substring size iteration
    for (let size = 1; size < s.length; size += 1) {
        //substring "head" slider
        for (let i = 0; i < (s.length - size); i += 1) {
            const headCounting = countingLetters(s, i, i + size);
            //console.log('head', s.substring(i, i + size), headCounting);
            // this is possible because the head sliding window always avoid
            // full length substrings
            let j = i + 1;
            const tailCounting = countingLetters(s, j, j + size);
            console.log('tail', s.substring(j, j + size), tailCounting);
            //substring "tail" slider
            for (;;) {
                if (compareSameLengthArrays(headCounting, tailCounting)) totalAnagrams += 1;

                j += 1;
                if (j > (s.length - size)) break;
                
                //sliding windows
                tailCounting[s.charCodeAt(j - 1) - aCharCode] -= 1;
                tailCounting[s.charCodeAt(j + size - 1) - aCharCode] += 1;

                //console.log('tail', s.substring(j, j + size), tailCounting);
            }
        }
    }

    return totalAnagrams;
}

const countingLetters = (text, start, end) => {
    const counting = Array(26).fill(0); //this is generally really slow in JS

    for (let i = start; i < end; i += 1) {
        const index = text.charCodeAt(i) - aCharCode;
        //if (counting[index] === undefined) counting[index] = 0;
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
//console.log(compareSameLengthArrays(count1, count2));

console.log(sherlockAndAnagrams('abba'));