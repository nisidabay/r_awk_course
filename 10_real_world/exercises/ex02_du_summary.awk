# Exercise 2: du-like — summarize file sizes in a directory
# Run: ls -la /usr/bin | awk -f ex02_du_summary.awk -
{
    # Skip directories and total line
    $1 ~ /^d/ || $1 ~ /^total/ { next }
    size = $5
    ext = "no_ext"
    if (match($NF, /\.([^.]+)$/, arr)) ext = arr[1]
    sum[ext] += size
    count[ext]++
}
END {
    printf "%-10s %10s %8s\n", "Ext", "Total", "Count"
    for (e in sum)
        printf "%-10s %10d %8d\n", e, sum[e], count[e]
}
