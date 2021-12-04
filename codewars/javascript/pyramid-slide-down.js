// https://www.codewars.com/kata/551f23362ff852e2ab000037

function longestSlideDown(pyramid) {
    if (pyramid.length === 0) return 0;
    
    const bottomLevel = pyramid.length - 1;
    const bottomLevelSize = pyramid[bottomLevel].length;
    let bestPathSums = new Array(bottomLevelSize).fill(0);
    
    for (let l = bottomLevel; l >= 0; l -= 1) {
        const level = pyramid[l];

        for (let i = 0; i < level.length; i += 1) {
            bestPathSums[i] += level[i];
        }

        for (let i = 0; i < level.length - 1; i += 1) {
            const highestOfPair = Math.max(bestPathSums[i], bestPathSums[i + 1]);
            
            bestPathSums[i] = highestOfPair;
        }
    }
    
    return bestPathSums[0];
}