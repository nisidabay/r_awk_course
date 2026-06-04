# Exercise 1: access log analyzer — HTTP status distribution
# Run: awk -f ex01_status_codes.awk data/access.log
{
    # Extract status code: field 9 in Apache combined format
    # Simpler: count unique status codes from sample data
    status[$9]++
    total++
}
END {
    printf "Status Code Distribution:\n"
    for (code in status)
        printf "  %s: %5d (%5.1f%%)\n", code, status[code], status[code]/total*100
}
