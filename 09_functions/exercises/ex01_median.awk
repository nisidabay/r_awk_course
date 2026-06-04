# Exercise 1: median-of-three function
# Run: awk -f ex01_median.awk data/numbers.txt
function median(a, b, c,    tmp) {
    if (a > b) { tmp = a; a = b; b = tmp }
    if (b > c) { tmp = b; b = c; c = tmp }
    if (a > b) { tmp = a; a = b; b = tmp }
    return b
}
{ printf "median(%d,%d,%d) = %d\n", $1, $2, $3, median($1, $2, $3) }
