"use strict";

function answer(wordLength, bigrams) {
    let lastBigram = null;
    let word = '';
    for (let i = 0; i < bigrams.length; i += 1) {
        const bigram = bigrams[i];
        if (lastBigram === null) {
            word += bigram;
            lastBigram = bigram;
            continue;
        }

        if (lastBigram[1] !== bigram[0]) {
            word += bigram;
        } else {
            word += bigram[1];
        }
        lastBigram = bigram;
    }

    if (word.length < wordLength) {
        word += 'a';
    }

    return word;
}

const totalTests = this.readline().split(" ");

for (let i = 0; i < totalTests; i += 1) {
    const wordLength = this.readline();
    const bigrams = this.readline().split(" ");
    const result = answer(wordLength, bigrams);
    this.print(result)
}