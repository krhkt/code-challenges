// https://www.codewars.com/kata/52bb6539a4cf1b12d90005b7/train/javascript

//i -> vertical axis, (rows)
//j -> horizontal axis, (columns)
//pair (i, j) -> (rowIndex, columnIndex)

const fullPieceSet = {
    //cell x amount
    4: 1, //battleshipt
    3: 2, //cruisers
    2: 3, //destroyers
    1: 4, //submarines
};

//tile types
const WATER = 0;
const SHIP = 1;

//flags
const INVALID_SHIP = -1;

//directions
const DIR_HORIZONTAL = 1;
const DIR_VERTICAL = 0;


const getCellId = (i, j) => `${i}:${j}`;

const isSurroundedByEmptySpaces = (field, shipStartPosition, shipSize, shipDirection) => {
    const [hSize, vSize] = (shipDirection === DIR_HORIZONTAL) 
        ? [shipSize, 1]
        : [1, shipSize];

    const lowerI = shipStartPosition[0] - 1;
    const lowerJ = shipStartPosition[1] - 1;
    const upperI = lowerI + vSize + 1;
    const upperJ = lowerJ + hSize + 1;

    //checking horizontal border (moving along columns: j)
    for (let j = Math.max(lowerJ, 0); j <= Math.min(upperJ, field.length - 1); j += 1) {
        //top border
        if ((lowerI >= 0) && (field[lowerI][j] === SHIP)) return false;

        //bottom border
        if ((upperI < field.length) && field[upperI][j] === SHIP) return false;
    }

    //checking vertical borders (moving along rows: i)
    for (let i = lowerI + 1; i < upperI; i += 1) {
        //left border
        if ((lowerJ >= 0) && field[i][lowerJ] === SHIP) return false;

        //right border
        if ((upperJ < field.length) && field[i][upperJ] === SHIP) return false;
    }

    return true;
}

const visitedShipCells = new Set();

const identifyValidShip = (field, i, j) => {
    visitedShipCells.add(getCellId(i, j));

    let shipSize = 1;

    //try walking right
    let nextJ = j + 1;
    let direction = null;
    while ((nextJ < field.length) && (field[i][nextJ] === SHIP)) {
        shipSize += 1;
        direction = DIR_HORIZONTAL;
        visitedShipCells.add(getCellId(i, nextJ));
        nextJ += 1;
    }

    if (direction === null) {
        let nextI = i + 1;
        while ((nextI < field.length) && (field[nextI][j] === SHIP)) {
            direction = DIR_VERTICAL;
            shipSize += 1;
            visitedShipCells.add(getCellId(nextI, j));
            nextI += 1;
        }
    }
    
    if (!fullPieceSet.hasOwnProperty(shipSize)) return INVALID_SHIP;
    if (!isSurroundedByEmptySpaces(field, [i, j], shipSize, direction)) return INVALID_SHIP;

    return shipSize;
};

const hasEnoughPieces = (piecesInBoard) => Object.keys(piecesInBoard)
    .every(k => piecesInBoard[k] === fullPieceSet[k]);

function validateBattlefield(field) {
    const pieces = { 4: 0, 3: 0, 2: 0, 1: 0 };

    for (let i = 0; i < field.length; i += 1) {
        for (let j = 0; j < field.length; j += 1) {
            if (field[i][j] !== SHIP) continue;

            if (visitedShipCells.has(getCellId(i, j))) continue;

            const shipSize = identifyValidShip(field, i, j);

            if (shipSize === INVALID_SHIP) return false;

            pieces[shipSize] += 1;
        }
    }

    return hasEnoughPieces(pieces);
}


// TEST AREA
const fieldA = [
    [1, 0, 0, 0, 0, 1, 1, 0, 0, 0],
    [1, 0, 1, 0, 0, 0, 0, 0, 1, 0],
    [1, 0, 1, 0, 1, 1, 1, 0, 1, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
    [0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
    [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];

const fieldB = [
    [0, 0, 0],
    [0, 1, 0],
    [0, 0, 0],
];

const fieldC = [
    [1, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0],
];

//debugger;
//var result = isSurroundedByEmptySpaces(fieldC, [2, 0], 2, DIR_HORIZONTAL);
//var result = isSurroundedByEmptySpaces(fieldC, [0, 0], 4, DIR_VERTICAL);
//var result = isSurroundedByEmptySpaces(fieldA, [0, 0], 4, DIR_VERTICAL);
//console.log('isSurrounded by water:', result);

var validField = validateBattlefield(fieldA);
console.log(validField);