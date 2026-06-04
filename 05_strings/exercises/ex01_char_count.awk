# Exercise 1: count character frequency per line
# Run: awk -f ex01_char_count.awk /etc/hosts
{ printf "%2d chars: %s\n", length($0), $0 }
