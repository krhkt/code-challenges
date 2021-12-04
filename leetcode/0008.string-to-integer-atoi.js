// https://leetcode.com/problems/string-to-integer-atoi/

/**
 * @param {string} str
 * @return {number}
 */


//#region [ fowards reading ]
const myAtoi = (() => {
  const MAX_INT = 2147483647;
  const MIN_INT = -2147483648;

  const modes = {
    initial: 0,
    leadingWhiteSpaces: 1,
    sign: 2,
    numbers: 3,
    trailingCharacters: 4,
  };

  const zeroCharCode = '0'.charCodeAt(0);
  const nineCharCode = zeroCharCode + 9;

  return (str) => {
    let currentMode = modes.initial;

    let signMultiplier = 1;
    let accumulator = 0;
    for (const chr of str) {
      if ((currentMode < modes.numbers) && (chr === ' ')) {
        if (currentMode === modes.sign) return 0;

        if (currentMode < modes.leadingWhiteSpaces) {
          currentMode = modes.leadingWhiteSpaces;
        }
        continue;
      }

      if ((chr === '-') || (chr === '+')) {
        if (currentMode === modes.sign) return 0;

        if (currentMode < modes.sign) {
          currentMode = modes.sign;
          if (chr === '-') signMultiplier = -1;
        } else {
          currentMode = modes.trailingCharacters;
        }

        continue;
      }

      const charCode = chr.charCodeAt(0);
      if ((charCode >= zeroCharCode) && (charCode <= nineCharCode)) {
        if (currentMode < modes.numbers) currentMode = modes.numbers
        else if (currentMode > modes.numbers) continue;

        const num = charCode - zeroCharCode;
        accumulator *= 10;
        accumulator += num;

        //checking boundaries
        const currentNumber = accumulator * signMultiplier;
        if (currentNumber > MAX_INT) return MAX_INT;
        if (currentNumber < MIN_INT) return MIN_INT;
        continue;
      }

      //all other characters fall here
      if (currentMode < modes.numbers) return 0;

      if (currentMode === modes.numbers) {
        currentMode = modes.trailingCharacters;
      }
    }

    return accumulator * signMultiplier;
  };
})();
//#endregion


//#region [ abusing language built-in functions ]
const myAtoiBuiltIn = function (str) {
  const num = parseInt(str);
  const MAX_INT = 2147483647;
  const MIN_INT = -2147483648;
  
  if (isNaN(num)) return 0;
  if (num > MAX_INT) return MAX_INT;
  if (num < MIN_INT) return MIN_INT;
  
  return num;
};
//#endregion


// test area

console.log(myAtoi('    42 as;ldkfja ;dlkfj 8jo83uofj'));