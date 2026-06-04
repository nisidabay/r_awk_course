# ARGC and ARGV: program arguments (like C)
# Run: awk -v greeting="Hola" -f 03_argc_argv.awk one two three
#
# ARGV[0]  = "awk"
# ARGV[1]  = first non-flag argument
# ARGC     = length of ARGV

BEGIN {
    print "=== ARGV ==="
    for (i = 0; i < ARGC; i++)
        printf "  [%d] %s\n", i, ARGV[i]

    print "\n=== Options ==="
    # awk's own flags (-f, -F, -v) are stripped — you only see script + files
}
