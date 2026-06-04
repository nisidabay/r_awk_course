# Exercise 4: compute frequency percentage of IPs
# Run: awk -f ex04_ip_pct.awk concept/data/logins.txt  (from 06_arrays/ directory)
{ ips[$1]++; total++ }
END {
    printf "%-15s %6s  %s\n", "IP", "Count", "Pct"
    for (ip in ips) printf "%-15s %5d  %5.1f%%\n", ip, ips[ip], ips[ip]/total*100
}
