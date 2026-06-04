# Exercise 2: extract domain from email addresses
# Run: awk -f ex02_extract_domain.awk data/emails.txt
# data/emails.txt: one email per line
{
    if (match($0, /@(.+)/, arr))
        printf "%-25s → %s\n", $0, arr[1]
    else
        printf "%-25s → (no domain)\n", $0
}
