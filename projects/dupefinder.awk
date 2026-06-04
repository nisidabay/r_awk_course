#!/usr/bin/awk -f
# dupefinder — find duplicate files by checksum
# Usage: md5sum * | awk -f dupefinder.awk -
# Groups: 06 arrays, 05 strings

{
    sum = $1
    sub(/^[^ ]+  /, "")   # remove md5sum prefix — path is rest
    filename = $0
    if (sum in seen) {
        if (!(sum in reported)) {
            printf "DUPE: %s\n", seen[sum]
            reported[sum] = 1
        }
        printf "DUPE: %s\n", filename
        dupes++
    } else {
        seen[sum] = filename
    }
}
END {
    if (dupes == 0) print "No duplicates found."
    else printf "\n%d duplicate files found.\n", dupes
}
