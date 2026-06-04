#!/usr/bin/awk -f
# topmem — show the top N memory-hungry processes
# Usage: ps aux | topmem [N=10]
# Groups: 06 arrays, 05 strings, 04 control flow, 03 END

NR == 1 { next }          # skip ps header
{
    rss = $6 / 1024        # KB → MB
    if (rss < 1) next
    proc_rss[$2] = rss     # $2 = PID, $11 = command
    proc_cmd[$2] = $11
    if (++count >= 100) next
}
END {
    n = count
    printf "Top %d by memory:\n\n", n
    printf "  %6s  %8s  %-40s\n", "PID", "MB", "Command"
    printf "  %6s  %8s  %-40s\n", "------", "--------", "-------"
    # Sort by RSS descending (crude: build sorted array)
    for (pid in proc_rss) {
        val = proc_rss[pid]
        idx = 1
        while (idx <= n && sorted[idx, "val"] > val)
            idx++
        for (j = n; j >= idx; j--) {
            sorted[j+1, "pid"]  = sorted[j, "pid"]
            sorted[j+1, "val"]  = sorted[j, "val"]
        }
        sorted[idx, "pid"] = pid
        sorted[idx, "val"] = val
    }
    for (i = 1; i <= n; i++)
        printf "  %6s  %8.1f  %-40s\n", sorted[i, "pid"], sorted[i, "val"], proc_cmd[sorted[i, "pid"]]

    printf "\nTotal: %.1f MB across %d processes\n", total, count
}
