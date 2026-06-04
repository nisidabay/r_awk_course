# Boolean patterns: &&, ||, !
# Run: seq 1 10 | awk -f 04_boolean_patterns.awk -
#
# Multiple patterns can match the same line — ALL fire.
# That's why you might see duplicates — awk is a filter, not if/else.

# Lines 3–7 that DON'T start with '3'
NR >= 3 && NR <= 7 && $0 !~ /^3/

# Equivalent to:
# NR >= 3 && NR <= 7 && !($0 ~ /^3/)
