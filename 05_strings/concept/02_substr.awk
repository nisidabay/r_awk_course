# substr(s, start, len) — extract a substring
# Run: awk -f 02_substr.awk /etc/hosts
#
# Index is 1-based. If len is omitted, goes to end of string.

# First 10 chars of each line
{ printf "%.10s...  %s\n", $0, (length($0) > 10 ? substr($0, 11) : "" ) }

# Extract extension, remove path prefix
{ ext = substr($0, length($0) - 3) }   # last 4 chars
# But really — check for dot:
{
    dot = index($0, ".")
    if (dot > 0)
        printf "ext=%s\n", substr($0, dot)
}
