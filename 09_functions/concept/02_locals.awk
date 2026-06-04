# Local variables: extra parameters = local (no 'local' keyword)
# Run: awk -f 02_locals.awk /dev/null
#
# Any parameter not passed by the caller is initialized to "" or 0.
# Convention: list locals after regular params, separated by lots of spaces.

function sum_of_squares(numbers, count,    i, total) {
    # 'i' and 'total' are local — they shadow global variables
    for (i = 1; i <= count; i++)
        total += numbers[i] * numbers[i]
    return total
}

function print_header(text,    len) {
    len = length(text)
    for (i = 1; i <= len + 4; i++) printf "="
    printf "\n= %s =\n", text
    for (i = 1; i <= len + 4; i++) printf "="
    print ""
}

BEGIN {
    # Demonstrate local vars with array
    arr[1] = 3; arr[2] = 4; arr[3] = 5
    n = 3

    val = sum_of_squares(arr, n)
    printf "Sum of squares (3,4,5): %d\n", val

    print_header("Report Card")
    # i and total from function don't leak
}
