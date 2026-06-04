# gsub / sub — global and first-match substitution
# Run: printf 'the quick brown fox\nthe fox\n' | awk -f 03_gsub_sub.awk -
#
# gsub(regex, replacement, target) → global replace, returns count
# sub(regex, replacement, target)  → first match only
# If target is omitted, $0 is used

# gsub: replace ALL
{ orig = $0; n = gsub(/the/, "THE"); printf "→ %s  (%d replacements)\n", $0, n }

# sub: replace FIRST only
{ $0 = orig; n = sub(/the/, "THE"); printf "→ %s  (%d replacement)\n", $0, n }

# Clean whitespace
{ $0 = orig; gsub(/[[:space:]]+/, " "); print "  Cleaned:", $0 }
