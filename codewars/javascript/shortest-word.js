// https://www.codewars.com/kata/57cebe1dc6fdc20c57000ac9

const findShort = (s) => 
  s.split(' ')
  .reduce((shortestLength, word) => {
    if (word.length === 0) return shortestLength;
    if (word.length < shortestLength) return word.length;
    return shortestLength;
  }, Infinity);
