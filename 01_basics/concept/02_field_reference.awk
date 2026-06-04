# Fields: $1, $2, ..., $NF, $0
#   $0 = the whole input line (before any splitting)
#   $1 = first field, $2 = second, etc.
#   $NF = last field (NF is the field count)
#   $(NF-1) = second-to-last field

# Print fields in reverse order
{ for (i = NF; i >= 1; i--) printf "%s%s", $i, (i > 1 ? " " : "\n") }

# Print the last field, then the first
{ print "Last:", $NF, "— First:", $1 }

# Rebuild $0 from fields — awk resplits when you assign to a field
{ temp = $0; $1 = "[" $1 "]"; print "Modified:", $0; $0 = temp }
