# Exercise 1: compare two files — find lines in file1 but not file2
# Run: awk -f ex01_set_diff.awk /etc/hosts /etc/hostname
FILENAME == ARGV[1] { seen[$0] = 1; next }
FILENAME == ARGV[2] { delete seen[$0] }    # remove common lines
END { for (line in seen) print "Only in first:", line }
