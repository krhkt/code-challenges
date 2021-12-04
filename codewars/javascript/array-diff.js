// https://www.codewars.com/kata/523f5d21c841566fde000009

function arrayDiff(a, b) {
  const result = [];
  
  for (let i = 0; i < a.length; i += 1) {
      if (b.indexOf(a[i]) !== -1) continue;
      result.push(a[i]);
  }
  
  return result;
}
