# CONVFMT and OFMT: number formatting
# Run: awk -f 05_number_format.awk /dev/null
#
# CONVFMT = conversion format (number → string): default "%.6g"
# OFMT    = print format (print number → string): default "%.6g"

BEGIN {
    x = 100 / 3     # 33.3333...
    print "Default:", x

    OFMT = "%.2f"
    print "OFMT=%.2f:", x

    CONVFMT = "%.0f"
    print "CONVFMT=%.0f:", x ""

    # RS: Record Separator (normally newline)
    # RS = ""    → paragraph mode: blank-line separated
    # RS = "\n"  → single newline (default)
    print ""

    # RT: Record Terminator (gawk) — the actual separator matched
}
