# sprintf — format string, return it (don't print)
# Run: awk -f 06_sprintf.awk /etc/hostname
#
# printf prints to stdout; sprintf returns the formatted string
{
    label = sprintf("Host: %s — date: %s", $0, strftime("%Y-%m-%d"))
    print label
    printf "Uppercase: %s\n", toupper(label)
    printf "Lowercase: %s\n", tolower(label)
}
