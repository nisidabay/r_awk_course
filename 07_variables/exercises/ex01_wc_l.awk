# Exercise 1: wc -l emulation — count lines per file
# Run: awk -f ex01_wc_l.awk /etc/hosts /etc/hostname
FNR == 1 && NR > 1 { printf "%3d %s\n", lines, prev_file }
{ lines = FNR; prev_file = FILENAME }
END { printf "%3d %s\n", lines, FILENAME }
