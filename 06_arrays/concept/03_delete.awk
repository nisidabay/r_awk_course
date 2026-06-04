# delete: remove an element or entire array
# Run: awk -f 03_delete.awk data/logins.txt
{
    ips[$1]++
}
END {
    print "=== All seen ==="
    for (ip in ips) printf "  %s: %d\n", ip, ips[ip]

    # Remove low-frequency entries (< 5)
    for (ip in ips)
        if (ips[ip] < 5) delete ips[ip]

    print "=== Frequent only (≥5) ==="
    for (ip in ips) printf "  %s: %d\n", ip, ips[ip]
}
