// https://www.codewars.com/kata/526d84b98f428f14a60008da/train/javascript

// #region v2
// trying the v1 strategy with min-heap
function hamming(n) {
    const candidateSet = new Set();

    let candidate = 1;
    candidateSet.add(candidate);

    for (let i = 1; i <= n; i += 1) {
        candidate = Math.min(...candidateSet);

        candidateSet.add(candidate * 2);
        candidateSet.add(candidate * 3);
        candidateSet.add(candidate * 5);
        candidateSet.delete(candidate);
    }

    return candidate;
}
// #endregion

// #region v1
// using a simple set doesn't work. still timeout
function hamming(n) {
    //using set here since adding candidates by multiply all 3 numbers
    //can add repeat to the bag, making the nth count wrong.
    const candidateSet = new Set();

    let candidate = 1;
    candidateSet.add(candidate);

    for (let i = 1; i <= n; i += 1) {
        candidate = Math.min(...candidateSet);

        candidateSet.add(candidate * 2);
        candidateSet.add(candidate * 3);
        candidateSet.add(candidate * 5);
        candidateSet.delete(candidate);
    }

    return candidate;
}
// #endregion


// #region [v0 - memoizing aggressively doesn't work]
// better sticking with the nomemo solution
const isDivisible = (number, divisor) => number % divisor === 0;

const addToMemoWindow = (memo, number, result, windowSize) => {
    const memoSize = memo.length;

    if (memoSize <= windowSize) {
        memo[number] = result;
        memo.length += 1;
        return result;
    }

    const deleteCandidate = number - windowSize;
    while (!(deleteCandidate in memo)) {
        deleteCandidate += 1;
    }

    delete memo[deleteCandidate];
    memo[number] = result;
    return result;
};

const isHamming_memoSliding = (candidate, memo, windowSize) => {
    let remaining = candidate;
    while (isDivisible(remaining, 5)) {
        remaining /= 5;
        if (remaining in memo) {
            return addToMemoWindow(memo, candidate, memo[remaining], windowSize);
        }
    }

    while (isDivisible(remaining, 3)) {
        remaining /= 3;
        if (remaining in memo) {
            return addToMemoWindow(memo, candidate, memo[remaining], windowSize);
        }
    }

    while (isDivisible(remaining, 2)) {
        remaining /= 2;
        if (remaining in memo) {
            return addToMemoWindow(memo, candidate, memo[remaining], windowSize);
        }
    }
    if (remaining === 1) {
        return addToMemoWindow(memo, candidate, true, windowSize);
    }

    return addToMemoWindow(memo, candidate, false, windowSize);;
};


const isHamming_memoThreshold = (candidate, memo, threshold) => {
    let remaining = candidate;
    while (isDivisible(remaining, 5)) {
        remaining /= 5;
        if (remaining in memo) {
            if (candidate < threshold) {
                memo[candidate] = memo[remaining];
            }
            return memo[remaining];
        }
    }

    while (isDivisible(remaining, 3)) {
        remaining /= 3;
        if (remaining in memo) {
            if (candidate < threshold) {
                memo[candidate] = memo[remaining];
            }
            return memo[remaining];
        }
    }

    while (isDivisible(remaining, 2)) {
        remaining /= 2;
        if (remaining in memo) {
            if (candidate < threshold) {
                memo[candidate] = memo[remaining];
            }
            return memo[remaining];
        }
    }
    if (remaining === 1) {
        return (memo[candidate] = true);
    }

    if (candidate < threshold) {
        memo[candidate] = false;
    }
    return false;
};


const isHamming_memoSucess = (candidate, memo) => {
    let remaining = candidate;
    while (isDivisible(remaining, 5)) {
        remaining /= 5;
        if (remaining in memo) return (memo[candidate] = memo[remaining]);
    }

    while (isDivisible(remaining, 3)) {
        remaining /= 3;
        if (remaining in memo) return (memo[candidate] = memo[remaining]);
    }

    while (isDivisible(remaining, 2)) {
        remaining /= 2;
        if (remaining in memo) return (memo[candidate] = memo[remaining]);
    }
    if (remaining === 1) return (memo[candidate] = true);

    return false;
};

const isHamming_memoFailure = (candidate, memo) => {
    let remaining = candidate;
    while (isDivisible(remaining, 5)) {
        remaining /= 5;
        if (remaining in memo) return memo[remaining];
    }

    while (isDivisible(remaining, 3)) {
        remaining /= 3;
        if (remaining in memo) return memo[remaining];
    }

    while (isDivisible(remaining, 2)) {
        remaining /= 2;
        if (remaining in memo) return memo[remaining];
    }
    if (remaining === 1) return true;

    return memo[candidate] = false;
};


const isHamming_memoAll = (candidate, memo) => {
    let remaining = candidate;
    while (isDivisible(remaining, 5)) {
        remaining /= 5;
        if (remaining in memo) return (memo[candidate] = memo[remaining]);
    }

    while (isDivisible(remaining, 3)) {
        remaining /= 3;
        if (remaining in memo) return (memo[candidate] = memo[remaining]);
    }

    while (isDivisible(remaining, 2)) {
        remaining /= 2;
        if (remaining in memo) return (memo[candidate] = memo[remaining]);
    }
    if (remaining === 1) return (memo[candidate] = true);

    return (memo[candidate] = false);
};

const findNextHamming = (current, memo) => {
    let candidate = current;
    do {
        candidate = candidate + 1;
    } while (!isHamming_memoAll(candidate, memo));
    //} while (!isHamming_memoSliding(candidate, memo, 5000000));

    return candidate;
}

function hamming_v0(n) {
    const memo = {1: true, length: 1};
    let current = 1;

    for (let i = 2; i <= n; i += 1) {
        current = findNextHamming(current, memo);
        //console.log(i, current);
    }

    return current;
}

// with no memo, it works "fine" until around the 1500th number (6s)
// better with memo for 1000 and above
// 1700 is already above 12s (19.1s)
const isHamming = (number) =>{
    while (number % 5 === 0) number /= 5;
    while (number % 3 === 0) number /= 3;
    while (number % 2 === 0) number /= 2;
    return number === 1;
}

const hamming_nomemo = (n) => {
    let current = 1;

    for (let i = 2; i <= n; i += 1) {
        do current += 1;
        while (!isHamming(current));
    }

    return current;
}
// #endregion


// test area
const nth = 5000;
let startTime, endTime;

startTime = process.hrtime();
console.log(hamming(nth));
endTime = process.hrtime(startTime);
console.log(`execution time: ${(endTime[0] * 1e9 + endTime[1])/1e9} seconds`);

// startTime = process.hrtime();
// console.log(hamming_v0(nth));
// endTime = process.hrtime(startTime);
// console.log(`execution time: ${(endTime[0] * 1e9 + endTime[1])/1e9} seconds`);

// startTime = process.hrtime();
// console.log(hamming_nomemo(nth));
// endTime = process.hrtime(startTime);
// console.log(`execution time: ${(endTime[0] * 1e9 + endTime[1])/1e9} seconds`);

// memory usage
const used = process.memoryUsage().heapUsed / 1024 / 1024;
console.log(used.toFixed(2), 'MB');