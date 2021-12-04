// https://leetcode.com/problems/distinct-subsequences/submissions/

//best one
//#region [ O(n^2)]
const longestPalindrome = (s) => {
    let longest = {
        size: 0,
        range: [0, 1]
    };
    
    for (let i = 0; i < s.length; i += 1) {
        const oddRange = longestPalindromeIndexedCentered(s, i);
        const evenRange = longestPalindromeIndexedCentered(s, i, true);
        
        const oddLength = oddRange[1] - oddRange[0];
        const evenLength = evenRange[1] - evenRange[0];
        
        let currentLongest = (oddLength > evenLength)
            ? {size: oddLength, range: oddRange}
            : {size: evenLength, range: evenRange}
        
        if (currentLongest.size > longest.size) {
            longest = currentLongest;
        }
    }
    
    return s.substring(...longest.range);
};

//returns the longest s substring indexes 
//that is palidrome and centered in i
const longestPalindromeIndexedCentered = (s, i, isEvenLength) => {
    if (i >= s.length) return null;
    
    let start = i;
    let end = i;
    
    if (isEvenLength) {
        end += 1;
        if (s[start] !== s[end]) {
            return [start, end];
        }
    }
    
    while ((start >= 0) && (end < s.length)) {
        if (s[start] !== s[end]) break;
            
        start -= 1;
        end += 1;
    }
    
    return [start + 1, end];
};
//#endregion


//2nd best
//#region [dynamic programming]
// for some reason, this is way slower than the non dynprog solution
const longestPalindromDynProg = (s) => {
    const memo = new Array(s.length);
    const longest = {
        size: 0,
        range: [],
    };

    //filling the matrix
    for (let i = 0; i < memo.length; i += 1) {
        memo[i] = new Array(i).fill(null);
    }

    //calculate all palindromes
    for (let l = 0; l < s.length; l += 1) {
        for (let start = 0; start < (s.length - l); start += 1) {
            const end = start + l;

            if (s[start] !== s[end]) {
                memo[end][start] = false;
                continue;
            }

            //inner palindrome check
            let isInnerSubstringPalindrome = true;
            const [innerStart, innerEnd] = [start + 1, end - 1];
            if (innerStart <= innerEnd && innerEnd > 0) {
                isInnerSubstringPalindrome = memo[innerEnd][innerStart];
            }

            memo[end][start] = isInnerSubstringPalindrome;
            if (isInnerSubstringPalindrome) {
                const size = end + 1 - start;
                if (size > longest.size) {
                    longest.size = size;
                    longest.range = [start, end + 1];
                }
            }
        }
    }
    
    return s.substring(...longest.range);
};
//#endregion


//worst
//#region brute force ( O(n^3))
const longestPalindromeBruteForce = function(s) {
    let longestPalindrome = '';
    for (let i = 0; i < s.length; i += 1) {
        let backwards = '';
        let forward = '';
        for (let j = i; j >= 0; j -= 1) {
            backwards += s[j];
            forward = s[j] + forward;
            
            if (backwards !== forward) continue;
                
            if (longestPalindrome.length < forward.length) {
                longestPalindrome = forward;
            }
        }
    }
    
    return longestPalindrome;
};
//#endregion


// tests
console.log(longestPalindromDynProg('ababba'));