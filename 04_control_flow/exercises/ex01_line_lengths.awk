# Exercise 1: classify lines as short/medium/long
# Run: awk -f ex01_line_lengths.awk /etc/hosts
{
    len = length($0)
    if (len == 0)
        print "■ EMPTY"
    else if (len < 20)
        printf "▲ SHORT  (%2d) %s\n", len, $0
    else if (len < 60)
        printf "■ MEDIUM (%2d) %s\n", len, $0
    else
        printf "▼ LONG   (%2d) %s\n", len, $0
}
