# Range patterns: /start/,/end/ — inclusive
# Run: printf 'header\nbody1\n## START\na\nb\n## END\nfooter\n' | awk -f 03_range_patterns.awk -
#
# Prints every line from the first match of /start/ through the first
# match of /end/ (both inclusive). Stays false until it sees /start/
# then stays true until it sees /end/.

/^## START/,/^## END/

# Equivalent flag-based approach:
# /^## START/   { in_block = 1 }
# in_block      { print }
# /^## END/     { in_block = 0 }
