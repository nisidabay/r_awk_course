# Exercise 1: count lines excluding blank lines and comments (#)
# Run: awk -f ex01_line_count.awk /etc/hosts
NF > 0 && !/^#/
END { print "---" ; print "Non-blank, non-comment:", NR " total", NF ? "N/A" : "" }
