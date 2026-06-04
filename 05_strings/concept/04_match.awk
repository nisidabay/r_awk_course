# match(s, regex) — find position of regex match
# Run: awk -F: -f 04_match.awk /etc/passwd
# Returns position (1-based) of the match, sets RSTART + RLENGTH
# Returns 0 if no match

# Extract the home directory from /etc/passwd ($6)
{
    if (match($6, /^\/home\//)) {
        user = substr($6, RSTART, RLENGTH - 1)  # strip trailing /
        printf "Human user: %s\n", $1
    } else {
        printf "System user: %s\n", $1
    }
}
