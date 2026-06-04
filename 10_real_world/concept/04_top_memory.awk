# System monitoring: top-N memory consumers from ps aux
# Run: ps aux | awk -f 04_top_memory.awk -
#
# Extract RSS (6th field), convert to MB, show top 5

NR == 1 { next }   # skip header
{
    rss = $6 / 1024   # KB → MB
    if (rss > 0) {
        proc_rss[$11] = rss       # $11 = command name
        total_rss += rss
        count++
    }
}
END {
    count = 0
    printf "Top 5 by memory:\n"
    for (p in proc_rss) {
        size = proc_rss[p]
        rank[count++] = sprintf("%s %.1f", p, size)
    }
    n = (count > 5 ? 5 : count)
    for (i = 0; i < n; i++)
        printf "  %s MB\n", rank[i]
    printf "\nTotal: %.1f MB across %d processes\n", total_rss, count
}
