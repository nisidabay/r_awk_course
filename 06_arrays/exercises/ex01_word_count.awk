# Exercise 1: count word frequency from stdin or file
# Run: awk -f ex01_word_count.awk concept/data/items.txt  (from 06_arrays/ directory)
{ for (i=1; i<=NF; i++) count[tolower($i)]++ }
END {
    for (w in count) printf "%3d %s\n", count[w], w
}
