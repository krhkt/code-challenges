// https://www.codewars.com/kata/525f4206b73515bffb000b21/train/javascript

function add(a, b) {
    const zeroCharCode = '0'.charCodeAt(0);
    const lengthierLength = Math.max(a.length, b.length);

    let carry = 0;
    let result = [];
    for (let i = 1; i <= lengthierLength; i += 1) {
        const aIndex = a.length - i;
        const aComponent = (aIndex >= 0) ? a.charCodeAt(aIndex) - zeroCharCode : 0;
        const bIndex = b.length - i;
        const bComponent = (bIndex >= 0) ? b.charCodeAt(bIndex) - zeroCharCode : 0;
        //the ternary operators above could've been replaced with
        // b.charCodeAt(-1) - zeroCharCode || 0
        // since NaN is a falsy value and would default to zero
        // however, that means a call to charCodeAt even when note necessary
        // and the comparison would still have to happen regardless

        let partialResult = aComponent + bComponent + carry;
        if (partialResult >= 10) {
            carry = 1;
            partialResult -= 10;
        } else carry = 0;

        //no idea if doing this addition + fromCharCOde is faster than just letting
        //the engine convert num to str itself (most likely what I'm doing is slower),
        //but I'm self imposing a limitation that I can't use direct type conversions
        //for this problem
        result.unshift(String.fromCharCode(partialResult + zeroCharCode));
    }
    if (carry) result.unshift('1');

    return result.join('');
}


// test area
console.log(add("888", "222"));
