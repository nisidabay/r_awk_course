#!/usr/bin/awk -f
# logwatch — count pacman log events by hour
# Usage: awk -f logwatch.awk /var/log/pacman.log
# Groups: 06 arrays, 05 strings

# Format: [YYYY-MM-DDTHH:MM:SS+TZ] ...
{ hour = substr($1, 12, 2); hour_count[hour]++; total++ }
END {
    printf "=== Pacman Activity ===\n"
    printf "Total events: %d\n\n", total
    for (h = 0; h <= 23; h++) {
        key = sprintf("%02d", h)
        if (hour_count[key] > 0)
            printf "  %02d:00  %5d  %s\n", h, hour_count[key], bar(hour_count[key], 50)
    }
}
function bar(n, max,   s, i) {
    width = int(n / (total > 0 ? total : 1) * max)
    for (i = 1; i <= width; i++) s = s "█"
    return s
}
