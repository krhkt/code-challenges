// https://www.codewars.com/kata/515bb423de843ea99400000a

// TODO: complete this object/class

// The constructor takes in an array of items and a integer indicating how many
// items fit within a single page
function PaginationHelper(collection, itemsPerPage) {
    this.items = collection;
    this.itemsPerPage = itemsPerPage;
}
  
// returns the number of items within the entire collection
PaginationHelper.prototype.itemCount = function() {
    return this.items.length; 
}

// returns the number of pages
PaginationHelper.prototype.pageCount = function() {
    return Math.ceil(this.items.length / this.itemsPerPage);
}

// returns the number of items on the current page. page_index is zero based.
// this method should return -1 for pageIndex values that are out of range
PaginationHelper.prototype.pageItemCount = function(pageIndex) {
    if ((typeof pageIndex !== 'number') || (pageIndex < 0)) return -1;

    const remainingItems = this.items.length - (pageIndex * this.itemsPerPage);
    if (remainingItems <= 0) return -1;
    
    return Math.min(remainingItems, this.itemsPerPage);

    //note to future me:
    // the return of this method could be
    //  return Math.min(
    //       Math.max(-1, remainingItems),
    //       this.itemsPerPage
    //  );
    // but it's not as readable as explicitly testing for the "fail" case before hand
}

// determines what page an item is on. Zero based indexes
// this method should return -1 for itemIndex values that are out of range
PaginationHelper.prototype.pageIndex = function(itemIndex) {
    if ((this.items.length <= itemIndex) || (itemIndex < 0)) return -1;

    return Math.trunc(itemIndex / this.itemsPerPage);
}