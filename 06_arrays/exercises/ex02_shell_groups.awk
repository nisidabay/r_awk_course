# Exercise 2: group by shell type — count users per shell
# Run: awk -F: -f ex02_shell_groups.awk /etc/passwd
{ shells[$NF]++ }
END {
    for (s in shells) printf "%3d  %s\n", shells[s], s
}
