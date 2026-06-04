#!/usr/bin/awk -f
# csvreport — convert CSV to formatted table
# Usage: awk -F, -f csvreport.awk data.csv
# Groups: 02 delimiters, 05 strings, 03 BEGIN/END

NR == 1 {
    # Read header
    cols = NF
    for (i = 1; i <= NF; i++) {
        header[i] = $i
        maxlen[i] = length($i)
    }
    next
}
{
    for (i = 1; i <= NF; i++) {
        data[NR, i] = $i
        if (length($i) > maxlen[i]) maxlen[i] = length($i)
    }
}
END {
    # Top border
    printf "+"
    for (i = 1; i <= cols; i++) {
        for (j = 1; j <= maxlen[i] + 2; j++) printf "-"
        printf "+"
    }
    print ""

    # Header
    printf "|"
    for (i = 1; i <= cols; i++)
        printf " %-" maxlen[i] "s |", header[i]
    print ""

    # Separator
    printf "+"
    for (i = 1; i <= cols; i++) {
        for (j = 1; j <= maxlen[i] + 2; j++) printf "-"
        printf "+"
    }
    print ""

    # Data rows
    for (row = 2; row <= NR; row++) {
        printf "|"
        for (i = 1; i <= cols; i++)
            printf " %-" maxlen[i] "s |", data[row, i]
        print ""
    }

    # Bottom border
    printf "+"
    for (i = 1; i <= cols; i++) {
        for (j = 1; j <= maxlen[i] + 2; j++) printf "-"
        printf "+"
    }
    print ""
}
