// https://www.codewars.com/kata/54b42f9314d9229fd6000d9c

function duplicateEncode(word){
  const duplicateTable = {};
  
  for (let i = 0; i < word.length; i += 1) {
    const char = word[i].toLowerCase();
    switch (duplicateTable[char]) {
      case undefined: 
        duplicateTable[char] = false;
        break;
      case false:
        duplicateTable[char] = true;
        break;
    }
  }
  
  let result = '';
  for (let i = 0; i < word.length; i += 1) {
    const char = word[i].toLowerCase();
    result += (duplicateTable[char]) ? ')' : '(';
  }
  
  return result;
}