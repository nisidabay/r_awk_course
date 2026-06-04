# BEGIN and END: special patterns that run exactly once
# Run: printf '10\n20\n30\n' | awk -f 01_begin_end.awk -
#   BEGIN { ... }  → runs before any input line is read
#   END { ... }    → runs after the last line is processed

BEGIN { print "=== User Report ===" }
{ count++; total += $1 }   # assume first field is numeric
END {
    print "---"
    if (count > 0)
        printf "%d lines, total: %d, avg: %.1f\n", count, total, total/count
    else
        print "0 lines, no data"
}
