// https://www.codewars.com/kata/517abf86da9663f1d2000003

const toCamelCase = (str) =>
    str
    .split(/-|_/)
    .map((word, i) => 
        (word.length > 0 && i > 0) 
        ? word[0].toUpperCase() + word.substring(1)
        : word
    ).join('');