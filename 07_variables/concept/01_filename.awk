# FILENAME: current input filename
# Run: awk -f 01_filename.awk /etc/hosts /etc/hostname
#
# FILENAME changes as awk processes each file on the command line.
# Use it to label output by source.

FNR == 1 { printf "\n=== %s ===\n", FILENAME }
{ print }
