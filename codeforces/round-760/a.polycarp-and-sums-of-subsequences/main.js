// https://codeforces.com/contest/1618/problem/0
"use strict";

function answer(s) {
    const arr = s.split(' ');
    const maxSum = arr[arr.length - 1];
    const minA = arr[0];
    const minB = arr[1];
    const lastElement = maxSum - minA - minB;
    return [minA, minB, lastElement].join(' ');
}

const totalTests = this.readline().split(" ");

for (let i = 0; i < totalTests; i += 1) {
    const s = this.readline();
    this.print(answer(s))
}
