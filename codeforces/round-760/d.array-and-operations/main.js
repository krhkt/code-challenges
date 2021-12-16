"use strict";

function answer(nums, k) {
    let score = 0;
    
    nums.sort((a, b) => a - b);
    
    const l = nums.length;
    for (let i = 0; i < k; i += 1) {
        score += Math.floor(
            nums[l - 1 - k - i] / nums[l - 1 - i]
        );
    }
        
    let remaining = 0;
    for (let i = 0; i < (nums.length - (k * 2)); i += 1) {
        remaining += nums[i];
    }

    return score + remaining;
}

const totalTests = this.readline().split(' ');

for (let i = 0; i < totalTests; i += 1) {
    const k = +this.readline().split(' ')[1];
    const nums = this.readline().split(' ').map(e => +e);
    const result = answer(nums, k);
    this.print(result.toString());
}
