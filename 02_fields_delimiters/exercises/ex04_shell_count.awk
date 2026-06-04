# Exercise 4: count unique shells from /etc/passwd
# Run: awk -F: -f ex04_shell_count.awk /etc/passwd
{ count[$NF]++ }
END {
    for (shell in count)
        printf "%-25s %d\n", shell, count[shell]
}
