// https://www.codewars.com/kata/55c6126177c9441a570000cc

const getWeight = (numStr) => numStr.split('').reduce((acc, n) => acc + parseInt(n), 0);

const isGt = (a, b) => {
    const [numA, numB] = [getWeight(a), getWeight(b)];

    //(numA > numB) || (!(numA < numB) && a > b);
    //numA > numB || !(numA < numB && a <= b);
    return numA > numB ? true
        : numA < numB ? false
        : a > b;
};

const partition = (arr, lo, hi) => {
    const pivot = hi;

    let i = lo - 1;
    for (let j = lo; j < hi; j += 1) {
        if (isGt(arr[j], arr[pivot])) continue;

        i += 1;
        [arr[i], arr[j]] = [arr[j], arr[i]];
    }

    [arr[i + 1], arr[pivot]] = [arr[pivot], arr[i + 1]];

    return i + 1;
};

const qsort = (arr, lo, hi) => {
    if (lo >= hi) return;

    const pivotIndex = partition(arr, lo, hi);

    qsort(arr, lo, pivotIndex - 1);
    qsort(arr, pivotIndex + 1, hi);
};

const sort = (arr) => qsort(arr, 0, arr.length - 1);

function orderWeight(strng) {
    const weights = strng.trim().split(/[\s\t\n]+/);

    sort(weights);

    return weights.join(' ');
}
