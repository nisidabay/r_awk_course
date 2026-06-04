#!/usr/bin/awk -f
# colstats — compute min/max/avg/stdev for a numeric column
# Usage: awk -v col=2 -f colstats.awk numbers.txt
# Groups: 06 arrays, 04 control flow, 03 END

{ val[NR] = $col; sum += $col; sumsq += $col * $col; count++ }
END {
    if (count == 0) { print "No data"; exit }
    avg = sum / count
    variance = sumsq / count - avg * avg

    # Find min/max
    min = max = val[1]
    for (i = 2; i <= count; i++) {
        if (val[i] < min) min = val[i]
        if (val[i] > max) max = val[i]
    }

    printf "Column %d statistics:\n", col
    printf "  Count:  %d\n", count
    printf "  Min:    %.2f\n", min
    printf "  Max:    %.2f\n", max
    printf "  Sum:    %.2f\n", sum
    printf "  Avg:    %.2f\n", avg
    printf "  StdDev: %.2f\n", sqrt(variance)
}
