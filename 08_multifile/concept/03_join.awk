# Join: combine data from two files by a key field
# Run: awk -f 03_join.awk data/users.txt data/scores.txt
#
# Strategy: read file1, store in array. Then read file2, look up each key.

FILENAME == ARGV[1] {
    # First file: store
    users[$1] = $2
    next
}
FILENAME == ARGV[2] {
    # Second file: join
    printf "%-15s %-20s %s\n", $1, users[$1], $2
}
