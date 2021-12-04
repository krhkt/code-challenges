// https://www.codewars.com/kata/5412509bd436bd33920011bc

function maskify(cc) {
  const textIndex = cc.length - 4;
  
  let mask = '';
  for (let i = 0; i < cc.length; i += 1) {
    mask += (i >= textIndex) ? cc[i] : '#';
  }
  
  return mask;
}
