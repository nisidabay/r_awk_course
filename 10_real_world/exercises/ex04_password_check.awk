# Exercise 4: password strength checker — check rules
# Run: awk -f ex04_password_check.awk data/passwords.txt
{
    len = length($1)
    has_upper = ($0 ~ /[A-Z]/)
    has_lower = ($0 ~ /[a-z]/)
    has_digit = ($0 ~ /[0-9]/)
    has_special = ($0 ~ /[^a-zA-Z0-9]/)
    score = has_upper + has_lower + has_digit + has_special + (len >= 12)
    mark = score == 5 ? "STRONG" : score >= 3 ? "OK" : "WEAK"
    printf "%-20s %s\n", $1, mark
}
