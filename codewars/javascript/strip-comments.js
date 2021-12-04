// https://www.codewars.com/kata/51c8e37cee245da6b40000bd

//not using a regexp here, because of
//special characters like $ and backslashing chars 
//assumes that no w or d could be used as markers
const solution = (input, markers) =>
    input.split('\n')
    .map(line => {
        let cleanLine = '';
        for (let i = 0; i < line.length; i += 1) {
            if (markers.indexOf(line[i]) !== -1) break;
            
            cleanLine += line[i];
        }
        
        return cleanLine.trim();
    }).join('\n');
