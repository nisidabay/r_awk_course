# split(string, array, separator) — break string into pieces
# Run: awk -f 05_split.awk /etc/group
# Default separator is FS. Returns number of elements.

BEGIN { FS = ":" }
{
    # $4 is comma-separated member list
    n = split($4, members, ",")
    if (n > 1)
        printf "%-20s %d members: %s\n", $1, n, $4
    else if ($4 != "")
        printf "%-20s 1 member: %s\n", $1, $4
}

# split with no separator uses FS
{ split($0, flds); printf "%s has %d fields\n", $1, length(flds) }
