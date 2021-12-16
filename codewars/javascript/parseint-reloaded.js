// https://www.codewars.com/kata/525c7c5ab6aecef16e0001a5/train/javascript

const numbersLookup = {
    zero: 0,      ten: 10,
    one: 1,       eleven: 11,
    two: 2,       twelve: 12,       twenty: 20,
    three: 3,     thirteen: 13,     thirty: 30,
    four: 4,      fourteen: 14,     forty: 40,
    five: 5,      fifteen: 15,      fifty: 50,
    six: 6,       sixteen: 16,      sixty: 60,
    seven: 7,     seventeen: 17,    seventy: 70,
    eight: 8,     eighteen: 18,     eighty: 80,
    nine: 9,      nineteen: 19,     ninety: 90,
};
const tenthsLookup = {
    hundred: 100,
    thousand: 1_000,
    million: 1_000_000,
}

function parseInt(word) {
    const components = word.split(/[\s-]/);

    return components
        .filter(component => component !== 'and')
        .reduce((acc, name) => {
            if (name in numbersLookup) return acc += numbersLookup[name];

            const remainder = acc % tenthsLookup[name];
            return acc + (tenthsLookup[name] * remainder) - remainder;
        }, 0);
}

//#region v0
const numberNamesLookup = {
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
    'ten': 10,
    'eleven': 11,
    'twelve': 12,
    'thirteen': 13,
    'fourteen': 14,
    'fifteen': 15,
    'sixteen': 16,
    'seventeen': 17,
    'eighteen': 18,
    'nineteen': 19,
    'twenty': 20,
    'thirty': 30,
    'forty': 40,
    'fifty': 50,
    'sixty': 60,
    'seventy': 70,
    'eighty': 80,
    'ninety': 90,
    'hundred': 100,
    'thousand': 1_000,
    'million': 1_000_000,
};
function parseInt_v0(word) {
    const components = word.split(/[\s-]/);
    const numberComponents = components
        .filter(component => component !== 'and')
        .map(numberName => numberNamesLookup[numberName.toLowerCase()]);

    let result = 0;
    let acc = 0;
    for (const component of numberComponents) {
        if (result > 0 && result < component) {
            result = (result + acc) * component;
            acc = 0;
            continue;
        }
        
        if (acc === 0) {
            acc = component;
            continue;
        }

        if (acc < component) {
            result += acc * component;
            acc = 0;
            continue;
        }

        acc += component;
    }

    return result + acc;
}
//#endregion


// test area
const testCases = [
    'seven hundred eighty-three thousand nine hundred and nineteen',
    'two hundred forty-six',
    'seven hundred thousand',
];

for (const testCase of testCases) {
    console.log(parseInt(testCase));
}