# FNR vs NR: per-file record number vs global record number
# Run: awk -f 02_fnr.awk /etc/hosts /etc/hostname
#
# NR keeps incrementing across files; FNR resets to 1 for each file.
# Use FNR == 1 to detect file boundaries.

BEGIN { printf "%-6s %-6s %-25s %s\n", "NR", "FNR", "FILENAME", "$0" }
{ printf "%6d %6d %-25s %s\n", NR, FNR, FILENAME, $0 }

# Common patterns:
{ total_lines[FILENAME]++ }
END { for (f in total_lines) printf "%3d %s\n", total_lines[f], f }
