# nextfile: skip to the next file immediately
# Run: awk -f 02_nextfile.awk data/*.txt
#
# After nextfile, awk stops processing the current file and moves to the next.
# Useful for "first match and move on" or "file too short, skip it."

NR == 1 { print "Processing only files with 3+ lines..." }
FNR == 1 && NR > 1 { prev_lines = FNR - 1 }   # FNR for PREVIOUS file
FNR == 3 { nextfile }   # skip files with < 3 lines before line 3
{ print FILENAME ":" FNR, $0 }
