# print vs printf: default vs controlled output
#   print $1, $2   → fields separated by OFS (default: space), ends with ORS (newline)
#   printf          → C-style format control, no automatic newline

# Default: print adds OFS between args, ORS at end
{ print "Field 1:", $1, "| Field 2:", $2 }

# printf: exactly what you ask for — you control spacing
{ printf "%-15s | %s\n", $1, $2 }

# print with no args prints $0
{ print }   # same as { print $0 }

# Comma vs space: comma inserts OFS, space concatenates
{ print $1 $2, $1, $2 }   # first two concatenated, then spaced normally
