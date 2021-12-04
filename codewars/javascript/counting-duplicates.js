// https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1

function duplicateCount(text) {
  const duplicates = new Map();
  let count = 0;

  for (const char of text) {
    const key = char.toLowerCase();
    if (!duplicates.has(key)) {
      duplicates.set(key, false);
      continue;
    }

    if (duplicates.get(key)) continue;

    count += 1;
    duplicates.set(key, true);
  }

  return count;
}

//#region [ other versions ]
const duplicateCount_lambda = (text) =>
  Array.from(text.toLowerCase()).reduce(
    (memo, char) => {
      memo[char] = char in memo ? memo[char] + 1 : 1;
      if (memo[char] === 2) memo.count += 1;
      return memo;
    },
    { count: 0 }
  ).count;

function duplicateCount_noMap(text) {
  const duplicates = {};
  let count = 0;

  for (const char of text) {
    const key = char.toLowerCase();
    if (!(key in duplicates)) {
      duplicates[key] = false;
      continue;
    }

    if (duplicates[key]) continue;

    count += 1;
    duplicates[key] = true;
  }

  return count;
}

// ecma5
function duplicateCount_e5(text) {
  var duplicates = {},
    count = 0,
    i,
    key;

  for (i = 0; i < text.length; i += 1) {
    key = text[i].toLowerCase();
    if (!duplicates.hasOwnProperty(key)) {
      duplicates[key] = false;
      continue;
    }

    if (duplicates[key]) continue;

    count += 1;
    duplicates[key] = true;
  }

  return count;
}
//#endregion
