# Exercise 4: show every 10th line from a large file
# Run: awk -f ex04_every_nth.awk /usr/share/dict/words
NR % 10 == 0
