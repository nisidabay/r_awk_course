# Exercise 3: compute factorial (recursive)
# Run: awk -f ex03_factorial.awk data/numbers.txt
function factorial(n) {
    if (n <= 1) return 1
    return n * factorial(n - 1)
}
{ printf "%d! = %d\n", $1, factorial($1) }
