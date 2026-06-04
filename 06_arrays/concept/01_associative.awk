# Arrays: all associative (hash maps), 1-indexed by default
# Run: awk -f 01_associative.awk data/scores.txt
#   count["key"]++  → auto-creates the key if missing, starts at 0

{ count[$1]++ }   # how many times each name appears

END {
    print "=== Counts ==="
    for (name in count)
        printf "  %-15s %d\n", name, count[name]
}
