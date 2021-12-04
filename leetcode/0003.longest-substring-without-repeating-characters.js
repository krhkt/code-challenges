// https://leetcode.com/problems/longest-substring-without-repeating-characters/
//
// Given a string s, find the length of the longest substring without repeating characters.

/**
 * @param {string} s
 * @return {number}
 */

const lengthOfLongestSubstring = (s) => {
    let visited = new Set();
    let substringStart = 0;
    let maxSubstringSize = 0;
    let currentSubstringSize = 0;
    for (let i = 0; i < s.length; i += 1) {
        if (visited.has(s[i])) {
            let currentStart;
            do {
                currentStart = substringStart;
                visited.delete(s[currentStart]);
                substringStart += 1;
            }
            while (s[currentStart] !== s[i]);

            currentSubstringSize = (i - substringStart);
        }

        currentSubstringSize += 1;
        visited.add(s[i]);
        if (currentSubstringSize > maxSubstringSize) maxSubstringSize = currentSubstringSize;
    }

    return maxSubstringSize;
};


const lengthOfLongestSubstringV0 = (s) => {
    let visited = new Map();
    let substringStart = 0;
    let maxSubstringSize = 0;
    let currentSubstringSize = 0;
    for (let i = 0; i < s.length; i += 1) {
        if (visited.has(s[i])) {
            const lastOccurrence = visited.get(s[i]);
            let count = 0;
            for (let j = substringStart; j <= lastOccurrence; j += 1) {
                visited.delete(s[j]);
                count += 1;
            }
            substringStart = lastOccurrence + 1;
            currentSubstringSize -= count;
        }

        currentSubstringSize += 1;
        visited.set(s[i], i);
        if (currentSubstringSize > maxSubstringSize) maxSubstringSize = currentSubstringSize;
    }

    return maxSubstringSize;
};
