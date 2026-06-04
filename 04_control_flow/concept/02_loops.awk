# while loop: execute block while condition is true
# Run: printf 'a b c d e\n' | awk -f 02_loops.awk -
{
    # while: manual index control
    i = 1
    while (i <= NF) {
        printf "[%d]=%s ", i, $i
        i++
    }
    print ""

    # for: same thing, C-style
    for (i = 1; i <= NF; i++)
        printf "(%s)", $i
    print ""

    # for-in: iterate over array indices — requires an array
    split("x y z", arr)  # create array from string
    for (key in arr)
        printf "%s=%s ", key, arr[key]
    print ""
}
