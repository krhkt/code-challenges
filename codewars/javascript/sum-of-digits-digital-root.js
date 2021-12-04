// https://www.codewars.com/kata/541c8630095125aba6000c00

function digital_root(n) {
  const nString = n.toString();
  
  let sum = 0;
  for (let i = 0; i < nString.length; i += 1) {
    sum += (+nString[i]);
  }
  
  if (sum.toString().length > 1) {
    return digital_root(sum);
  }
  
  return sum;
}
