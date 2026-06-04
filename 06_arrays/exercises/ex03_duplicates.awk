# Exercise 3: find duplicate lines in a file
# Run: awk -f ex03_duplicates.awk concept/data/scores.txt  (from 06_arrays/ directory)
{ lines[$0]++ }
END {
    for (line in lines)
        if (lines[line] > 1)
            printf "×%d  %s\n", lines[line], line
}
