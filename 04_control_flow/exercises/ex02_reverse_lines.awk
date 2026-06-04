# Exercise 2: print lines in reverse — store them, print at END
# Run: awk -f ex02_reverse_lines.awk /etc/hosts
{ lines[NR] = $0 }
END {
    for (i = NR; i >= 1; i--)
        print i, lines[i]
}
