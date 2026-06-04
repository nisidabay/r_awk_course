#!/usr/bin/awk -f
# extstats — aggregate file sizes by extension
# Usage: ls -la /usr/bin | awk -f extstats.awk -
# Groups: 06 arrays, 05 strings, 03 END

$1 ~ /^d/ || $1 ~ /^total/ { next }   # skip dirs and total line
{
    filename = $9
    if (match(filename, /\.([^.]+)$/, arr))
        ext = arr[1]
    else
        ext = "(none)"

    size = $5
    ext_size[ext] += size
    ext_count[ext]++
    total_size += size
    total_files++
}
END {
    printf "%-10s %8s %8s %7s\n", "Extension", "Files", "Bytes", "Pct"
    printf "%-10s %8s %8s %7s\n", "---------", "-----", "-----", "---"
    for (ext in ext_count) {
        pct = (total_size > 0 ? ext_size[ext] / total_size * 100 : 0)
        printf "%-10s %8d %8d %6.1f%%\n", ext, ext_count[ext], ext_size[ext], pct
    }
    printf "\nTotal: %d files, %d bytes\n", total_files, total_size
}
