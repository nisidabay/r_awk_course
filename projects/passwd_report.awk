#!/usr/bin/awk -f
# passwd_report — classify users: root, system, human
# Usage: awk -F: -f passwd_report.awk /etc/passwd
# Groups: 06 arrays, 04 control flow, 02 FS

{
    uid = $3 + 0   # force numeric
    if (uid == 0)
        type = "root"
    else if (uid < 1000)
        type = "system"
    else
        type = "human"

    users[type] = users[type] "  " $1
    count[type]++
    shells[$NF]++
    if (uid < 1000 || uid == 0) system_count++
    else human_count++
}
END {
    printf "=== User Classification ===\n\n"
    printf "Root:\n%s\n\n", users["root"]
    printf "System (%d):\n%s\n\n", count["system"], users["system"]
    printf "Human (%d):\n%s\n\n", count["human"], users["human"]

    printf "=== Most Common Shells ===\n"
    for (s in shells) {
        if (shells[s] > 1)
            printf "  %3d  %s\n", shells[s], s
    }
}
