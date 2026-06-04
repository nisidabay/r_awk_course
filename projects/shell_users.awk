#!/usr/bin/awk -f
# shell_users — show which users use which shell
# Usage: awk -F: -f shell_users.awk /etc/passwd
# Groups: 02 FS, 06 arrays

{
    shells[$NF]++
    user_shells[$NF] = user_shells[$NF] " " $1
}
END {
    printf "=== Shell Distribution ===\n\n"
    n = asorti(shells, sorted_shells, "@val_num_desc")
    for (i = 1; i <= n; i++) {
        shell = sorted_shells[i]
        printf "%3d  %s\n", shells[shell], shell
        if (shells[shell] <= 10)
            printf "     Users:%s\n\n", user_shells[shell]
    }
}
