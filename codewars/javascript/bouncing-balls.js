// https://www.codewars.com/kata/5544c7a5cb454edb3c000047

function bouncingBall(h,  bounce,  window) {
    if (h < 0 || bounce <= 0 || bounce >= 1 || window >= h || window <= 0) return -1;
    
    let maxHeight = h;
    let visibleBounces = 0;
    while (maxHeight > window) {
        visibleBounces += 1;
        maxHeight *= bounce;
    }
    
    return (visibleBounces * 2) - 1;
}
