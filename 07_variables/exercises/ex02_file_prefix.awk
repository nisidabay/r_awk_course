# Exercise 2: add file path prefix to every line
# Run: awk -f ex02_file_prefix.awk /etc/hosts /etc/hostname
# Equivalent to: grep -H '' file1 file2
{ printf "%s:%d:%s\n", FILENAME, FNR, $0 }
