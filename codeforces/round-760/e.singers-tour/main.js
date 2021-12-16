"use strict";

//TODO:
//  create the singer matrix NxN
//  calculate the inverse
//  if it's not possible print NO
//  multiply the inverse by the cities array
//  print YES and the result of the multiplication
function answer(cities) {
    
}

const totalTests = this.readline().split(' ');

for (let i = 0; i < totalTests; i += 1) {
    const length = +this.readline();
    const nums = this.readline().split(' ').map(e => +e);
    const result = answer(nums, k);
    this.print(result.toString());
}
