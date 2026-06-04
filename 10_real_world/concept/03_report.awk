# Report generator: format output for human consumption
# Run: awk -f 03_report.awk data/sales.csv
#
# Combine arrays, formatting, and aggregates into a clean report

BEGIN { FS = "," }
NR == 1 { next }

{
    rev = $3 * $4
    monthly[substr($1, 1, 7)] += rev    # YYYY-MM
    total_rev += rev
    count++
}

END {
    printf "==================\n"
    printf "  SALES REPORT\n"
    printf "==================\n\n"
    printf "Total transactions: %d\n", count
    printf "Total revenue:      $%.2f\n\n", total_rev

    printf "%-10s %12s\n", "Month", "Revenue"
    printf "%-10s %12s\n", "----------", "------------"
    for (m in monthly)
        printf "%-10s $%11.2f\n", m, monthly[m]
}
