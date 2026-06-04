# Exercise 3: calculate column statistics — min/max/avg/stdev
# Run: awk -f ex03_column_stats.awk data/stats.txt
{
    sum += $1
    sumsq += $1 * $1
    if (NR == 1 || $1 < min) min = $1
    if (NR == 1 || $1 > max) max = $1
    count++
}
END {
    avg = sum / count
    variance = sumsq / count - avg * avg
    printf "Count:   %d\n", count
    printf "Min:     %.2f\n", min
    printf "Max:     %.2f\n", max
    printf "Avg:     %.2f\n", avg
    printf "StdDev:  %.2f\n", sqrt(variance)
}
