// https://www.codewars.com/kata/54e6533c92449cc251001667

var uniqueInOrder = (iterable) => {
  if (typeof iterable === 'string') iterable = iterable.split('');
  
  let currentElement = '';
  return iterable.filter(e => {
    if (currentElement !== e) {
      currentElement = e;
      return true;
    }
    return false;
  });
};
