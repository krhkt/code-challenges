// https://www.codewars.com/kata/546f922b54af40e1e90001da

function alphabetPosition(text) {
    const baseCharCode = 'a'.charCodeAt(0);
    const finalCharCode = 'z'.charCodeAt(0);
    let translated = [];

    for (const c of text) {
        const charCode = c.toLowerCase().charCodeAt(0);

        if (charCode < baseCharCode) continue;
        if (charCode > finalCharCode) continue;

        translated.push(charCode + 1 - baseCharCode);
    }

    return translated.join(' ');
}