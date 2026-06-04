# Exercise 2: count lines like wc -l
# Run: awk -f ex02_line_count.awk /etc/hosts
END { print NR, "lines" }
