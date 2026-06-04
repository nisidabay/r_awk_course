# Exercise 1: print second field of each line
# Run: printf 'Filesystem Size Used\n/dev/sda1 100G 50G\n' | awk -f ex01_second_field.awk -
NR > 1 { print $2 }
