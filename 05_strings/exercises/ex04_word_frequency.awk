# Exercise 4: count word frequency
# Run: awk -f ex04_word_frequency.awk data/sample.txt
{
    for (i = 1; i <= NF; i++) {
        word = tolower($i)
        gsub(/[^a-z0-9]/, "", word)  # strip punctuation
        if (word != "") count[word]++
    }
}
END {
    for (w in count)
        printf "%3d %s\n", count[w], w
}
