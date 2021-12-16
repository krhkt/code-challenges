// https://www.codewars.com/kata/55f9b48403f6b87a7c0000bd

function paperwork(totalClassmates, totalPages) {
    if (totalClassmates < 0) return 0;
    if (totalPages < 0) return 0;

    return totalClassmates * totalPages;
}

