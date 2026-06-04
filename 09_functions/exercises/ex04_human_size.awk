# Exercise 4: format human-readable file size
# Run: awk -f ex04_human_size.awk data/sizes.txt
function human_size(bytes,    units, i) {
    split("B KB MB GB TB", units, " ")
    for (i = 1; bytes >= 1024 && i < 5; i++)
        bytes /= 1024
    return sprintf("%.1f %s", bytes, units[i])
}
{ printf "%8d → %s\n", $1, human_size($1) }
