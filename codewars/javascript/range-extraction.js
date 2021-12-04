// https://www.codewars.com/kata/51ba717bb08c1cd60f00002f

function solution(list) {
    let listFormatted = [];

    let rangeStart = null;
    let rangeEnd = null;
    let next = null;
    for (let i = 0; i < list.length; i += 1) {
        const curr = list[i];
        next = list[i + 1];

        if (rangeStart === null) {
            rangeStart = curr;
            rangeEnd = curr;
        }

        if ((next === undefined) || (next > (curr + 1))) {
            //ranged values
            if ((rangeEnd - rangeStart) > 1) {
                listFormatted.push(`${rangeStart}-${rangeEnd}`);
            } else {
                listFormatted.push(rangeStart);
                if (rangeEnd !== rangeStart) listFormatted.push(rangeEnd);
            }
            rangeStart = next;
        }

        rangeEnd = next;
    }

    return listFormatted.join(',');
}


/*function solution(list){
  let listFormatted = [];
  
  let rangeStart = null;
  let rangeEnd = null;
  
  for (let i = 0; i < list.length; i += 1) {
    const item = list[i];
    
    if (rangeStart === null) {
      rangeStart = item;
      rangeEnd = item;
    }
    
    if (((i + 1) >= list.length) 
      || (list[i + 1] > (rangeEnd + 1))) {
      //next item is in another range, or the list is over
      if ((rangeEnd - rangeStart) > 1) {
        listFormatted.push(`${rangeStart}-${rangeEnd}`);
      } else {
        listFormatted.push(rangeStart);
        if (rangeEnd !== rangeStart) {
          listFormatted.push(rangeEnd);
        }
      }
      
      rangeStart = rangeEnd = null;
    } else {
      rangeEnd = item;
    }
  }
  
  return listFormatted.join(',');
}
*/
