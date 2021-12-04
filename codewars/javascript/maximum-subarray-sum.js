// https://www.codewars.com/kata/54521e9ec8e60bc4de000d6c

const maxSequence = (arr) => {
    let bestSum = 0;
    let currentSum = 0;
    
    for (let i = 0; i < arr.length; i += 1) {
        currentSum += arr[i];

        if (currentSum < 0) currentSum = 0;
        if (currentSum > bestSum) bestSum = currentSum;
    }

    return bestSum;
};

/* (not smart at all!) -.-
var maxSequence = function(arr){
    let subSums = [];
    let activeSums = [];
    
    for (let i = 0; i < arr.length; i += 1) {
      if (arr[i] < 0) {
        subSums = [...subSums, ...activeSums];
      }
      
      activeSums = activeSums.map(sum => sum + arr[i]);
  
      
      if (arr[i] > 0) activeSums.push(arr[i]);
    }
    
    subSums = [...subSums, ...activeSums];
    
    if (subSums.length === 0) return 0;
    
    return Math.max(0, ...subSums);
}
*/
