# Exercise 3: stop after N matches — grep with limit
# Run: awk -f ex03_grep_limit.awk data/5letter_aa_words.txt
/^a.{4}$/ {            # 5-letter words starting with 'a'
    count++
    print count ":", $0
}
count >= 10 { exit }
