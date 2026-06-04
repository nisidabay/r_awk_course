# CSV aggregation: group by column, compute stats
# Run: awk -F, -f 02_csv_stats.awk data/sales.csv
# Simulate: date,product,quantity,price

NR > 1 {
    revenue = $3 * $4
    cat_rev[$2] += revenue
    cat_qty[$2] += $3
}
END {
    printf "%-15s %10s %10s %10s\n", "Product", "Revenue", "Quantity", "Avg Price"
    printf "%-15s %10s %10s %10s\n", "-------", "-------", "--------", "---------"
    for (p in cat_rev)
        printf "%-15s %10.2f %10d %10.2f\n", p, cat_rev[p], cat_qty[p], cat_rev[p]/cat_qty[p]
}
