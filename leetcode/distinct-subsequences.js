// https://leetcode.com/problems/distinct-subsequences/

/**
 * @param {string} s
 * @param {string} t
 * @return {number}
 */
const numDistinct = function(s, t) {
    const searchSubsequence = (si = 0, ti = 0, acc = 0) => {
        if (ti >= t.length) return acc;
        
        const isLast = ((ti + 1) === t.length);
        for (let i = si; i < s.length; i += 1) {
            if (s[i] === t[ti]) {
                if (isLast) acc += 1;
                else acc += searchSubsequence(i + 1, ti + 1);
            }
        }

        return acc;
    };

    return searchSubsequence();
};

const numDistinctWithMemoize = function(s, t) {
    const memo = {};
    const searchSubsequence = (si = 0, ti = 0) => {
        const key = si + ':' + ti;
        if (memo.hasOwnProperty(key)) return memo[key];

        let acc = 0;
        if (ti >= t.length) return acc;
        
        const isLast = ((ti + 1) === t.length);
        for (let i = si; i < s.length; i += 1) {
            if (s[i] === t[ti]) {
                if (isLast) {
                    acc += 1;
                } else {
                    acc += searchSubsequence(i + 1, ti + 1);
                }
            }
        }

        memo[key] = acc;

        return acc;
    };

    return searchSubsequence();
};

//"adbdadeecadeadeccaeaabdabdbcdabddddabcaaadbabaaedeeddeaeebcdeabcaaaeeaeeabcddcebddebeebedaecccbdcbcedbdaeaedcdebeecdaaedaacadbdccabddaddacdddc"
//"bcddceeeebecbc"

const numDistinctNonRecursive = function(text, sequence) {
    const lastMatchIndexes = [];

    let stopIndex = text.length - sequence.length;
    let si = 0;
    let ti = 0;
    let acc = 0;
    for (;;) {
        if (text[ti] === sequence[si]) {
            if (si + 1 >= sequence.length) {
                acc += 1;
            } else {
                lastMatchIndexes.push(ti);
                si += 1;
            }
        }

        if (ti + 1 >= text.length) {
            si -= 1;
            ti = lastMatchIndexes.pop() + 1;

            if ((si <= 0) && (ti > stopIndex)) break;
        } else {
            ti += 1;
        }
    }

    return acc;
};

const numDistinctWithTable = function(text, sequence) {
    if (!text.length || !sequence.length) return 0;

    const occurrenceTable = [];
    const stopIndex = text.length - sequence.length;
    for (let i = 0; i < sequence.length; i += 1) {
        let sequenceLetter = sequence[i];
        occurrenceTable[i] = [];
        for (let j = i; j <= (stopIndex + i); j += 1) {
            if (sequenceLetter === text[j]) {
                occurrenceTable[i].push(j);
            }
        }

        if (occurrenceTable[i].length === 0) return 0;
    }

    const indexTable = [];
    let acc = 0;
    for (let i = 0; i < occurrenceTable[0].length; i += 1) {
        indexTable[0] = i;
        for (let j = 1; occurrenceTable.length; j += 1) {
            indexTable[j] = i;
        }
    }

    return occurrenceTable;
};

const numDistinctFromcpp = (text, sequence) => {
    const textLength = text.length;
    const seqLength = sequence.length;

    const dp = [];
    dp[0] = 1;
    for (let i = 1; i <= seqLength; i += 1) dp[i] = 0;

    for (let i = 0; i < textLength; i += 1) {
        for (let j = seqLength - 1; j >= 0; j -= 1) {
            if (text[i] === sequence[j]){
                dp[j+1] += dp[j];
            }
        }
    }
    return dp[seqLength];
};


const numDistinctBottomUp = (text, sequence) => {

};