# Library functions via @include (gawk)
# Run: awk -f 03_include.awk /dev/null
#
# @include "file.awk" inserts another file inline.
# Files are searched in: current dir, AWKPATH, and /usr/share/awk

@include "lib.awk"

BEGIN {
    printf "sum(3,4) = %d\n", sum(3, 4)
    printf "double(7) = %d\n", double(7)
    printf "greet(\"Carlos\") → "; greet("Carlos")
}
