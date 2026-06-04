# Exercise 2: show file header — first line + blank line + data start
# Run: awk -f ex02_file_header.awk /etc/group
BEGIN { print "=== FILE HEADER ===" }
NR == 1 { printf "First line: %s\n", $0 }
/^$/ { print "---blank---" }
NR <= 5   { printf "%2d: %s\n", NR, $0 }
END { print "---END---" }
