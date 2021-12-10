
const openingBrackets = ['(', '[', '{'];
const closingBrackets = [')', ']', '}'];
const matchingBrackets = openingBrackets.reduce((table, opening, i) => {
    const closing = closingBrackets[i];
    table[closing] = opening;
    return table;
}, {});

const isOpening = (c) => {
    return openingBrackets.includes(c);
};

function isBalanced(s) {
    if (typeof s !== 'string') return false;

    const stack = [];
    for (const c of s) {
        //if there's an opening, it needs to be added to stack in order
        //to check a possible closing bracket later
        if (isOpening(c)) {
            stack.push(c);
            continue;
        }

        //if it's not an opening, then it's a closing. Meaning that
        //it has to close what is currently open on the top of the stack
        const relativeOpener = stack.pop();
        if (matchingBrackets[c] !== relativeOpener) {
            return false;
        }
    }

    //an empty stack means that all openings were matched 
    //against their relative closings
    return stack.length === 0;
}


console.log(isBalanced('{[()]}'));
console.log(isBalanced('{[(])}'));
console.log(isBalanced('{{[[(())]]}}'));