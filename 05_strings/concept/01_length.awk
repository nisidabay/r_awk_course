# length() — count characters in a string
# Run: awk -f 01_length.awk /etc/hosts

# strlen() is synonymous with length() in gawk
{ printf "%3d: %s\n", length($0), $0 }

# length() with no arg defaults to length($0)
{ line_len = length(); if (line_len > 50) print NR ": long line" }
