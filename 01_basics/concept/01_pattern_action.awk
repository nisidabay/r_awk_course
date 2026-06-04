# AWK's core model: pattern { action }
#   pattern  → which lines to act on (if omitted: every line)
#   { action } → what to do with them (if omitted: print the whole line)
# Patterns and actions are both optional — but one must be present.

# Pattern only (action defaults to { print })
NF > 3

# Action only (pattern defaults to every line)
{ print $1, $2 }

# Both: print the first field of lines with more than 3 fields
NF > 3 { print "Row with", NF, "fields:", $0 }

# Multiple pattern-action pairs run in order on every line
{ count++ }
END { print count, "total lines" }

# awk reads each line, splits it into $1, $2, ... $NF
# $0 is the whole line, NF is the number of fields
