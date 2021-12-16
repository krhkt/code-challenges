"use strict";

function answer(_, nums) {
    for (const d of nums) {
        let lastWasDivisible = null;
        let isBeautiful = true;
        for (let i = 0; i < nums.length; i += 1) {
            const target = nums[i];
            const isDivisible = (target % d) === 0;
            if (lastWasDivisible === isDivisible) {
                isBeautiful = false;
                break;
            }

            lastWasDivisible = isDivisible;
        }

        if (isBeautiful) return d;
    }

    return 0;
}

const totalTests = this.readline().split(" ");

for (let i = 0; i < totalTests; i += 1) {
    const length = +this.readline();
    const nums = this.readline().split(" ").map(e => +e);
    const result = answer(length, nums);
    this.print(result)
}