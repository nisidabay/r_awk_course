# Exercise 2: merge sorted files line by line
# Run: awk -f ex02_zip.awk /etc/hosts /etc/hostname
{
    if (FILENAME == ARGV[1])
        left[FNR] = $0
    else
        printf "%s | %s\n", left[FNR], $0
}
