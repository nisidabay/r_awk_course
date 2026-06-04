#!/usr/bin/awk -f
# wcstat — word count with percentage breakdown
# Usage: wcstat [file...]
# Groups: 07 variables, 03 BEGIN/END, 01 fields

{
    lines[FILENAME]++
    words[FILENAME] += NF
    chars[FILENAME] += length($0)
    total_files = 0   # will be set in END
}
END {
    printf "%-50s %8s %8s %8s\n", "File", "Lines", "Words", "Chars"
    printf "%-50s %8s %8s %8s\n", "----", "-----", "-----", "-----"

    total_l = total_w = total_c = 0
    n = 0
    for (f in lines) {
        total_l += lines[f]
        total_w += words[f]
        total_c += chars[f]
        n++
    }
    for (f in lines)
        printf "%-50s %8d %8d %8d (%5.1f%%)\n", f, lines[f], words[f], chars[f], lines[f] * 100.0 / total_l

    if (n > 1) {
        printf "%-50s %8d %8d %8d\n", "TOTAL", total_l, total_w, total_c
    }
}
