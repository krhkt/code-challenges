// https://www.codewars.com/kata/5264d2b162488dc400000001

const spinWords = (string) => 
  string.split(' ')
  .map(word => (word.length >= 5)
    ? Array.from(word).reverse().join('')
    : word)
  .join(' ');
