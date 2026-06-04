# Exercise 4: number of files argument
# Run: awk -f ex04_how_many_files.awk *.awk /etc/hosts
BEGIN {
    print "Files to process:", ARGC - 1
    for (i = 1; i < ARGC; i++) printf "  %d: %s\n", i, ARGV[i]
}
