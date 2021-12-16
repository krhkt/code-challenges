// https://www.codewars.com/kata/5547929140907378f9000039

const shortcut = text => text.replace(/[aiueo]+/g, '');

//#region [no regex]
const isVowel = (() => {
    const vowels = 'aiueo';
    return (letter) => vowels.includes(letter);
})();
const shortcut_filter = (text) => text.split('').filter(e => !isVowel(e)).join('');
//#endregion

//#region [no lambda]
function shortcut_longversion(text) {
    const vowels = ['a', 'e', 'i', 'o', 'u'];
    let result = '';

    for (const letter of text) {
        if (vowels.includes(letter)) continue;

        result = result + letter;
    }

    return result;
}
//#endregion