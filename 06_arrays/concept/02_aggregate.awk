# Aggregate: sum values, compute averages
# Run: awk -f 02_aggregate.awk data/scores.txt
{
    total[$1] += $2   # accumulate scores per name
    count[$1]++
    if ($2 > max[$1]) max[$1] = $2   # track max per name
}
END {
    printf "%-15s %5s %5s %6s\n", "Name", "Total", "Count", "Avg"
    printf "%-15s %5s %5s %6s\n", "----", "-----", "-----", "------"
    for (name in total)
        printf "%-15s %5d %5d %6.1f\n", name, total[name], count[name], total[name]/count[name]
}
