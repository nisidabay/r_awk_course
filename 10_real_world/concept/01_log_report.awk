# Log file parsing: extract IP addresses, count by hour, find top-N
# Run: awk -f 01_log_report.awk /var/log/pacman.log
# Simulate Apache-style log: timestamp, IP, path, status, bytes

function hour(stamp) {
    # Extract HH from YYYY-MM-DDTHH:MM:SS±TZ
    return substr(stamp, 12, 2)
}
{
    # Count hits per hour
    count[hour($1)]++
    total++
}
END {
    printf "Total requests: %d\n\n", total
    printf "Hits per hour:\n"
    for (h in count)
        printf "  %s:00 → %d\n", h, count[h]
}
