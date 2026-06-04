# Multi-file processing: ARGIND and nextfile
# Run: awk -f 01_argind.awk data/*.txt
#
# ARGIND is gawk's index into ARGV (0-based, but starts at 1 for first file)
# ARGV[ARGIND] gives the current filename

FNR == 1 {
    printf "\n=== File %d: %s ===\n", ARGIND, FILENAME
}
{ printf "  %d: %s\n", FNR, $0 }
