# ENVIRON: access environment variables
# Run: awk -f 04_environ.awk /dev/null
#
# Read-only hash of the process environment.
BEGIN {
    printf "%-20s %s\n", "HOME", ENVIRON["HOME"]
    printf "%-20s %s\n", "USER", ENVIRON["USER"]
    printf "%-20s %s\n", "SHELL", ENVIRON["SHELL"]
    printf "%-20s %s\n", "EDITOR", ENVIRON["EDITOR"]
    printf "%-20s %s\n", "LANG", ENVIRON["LANG"]
    print ""

    # Filter by prefix: show all LANG-related vars
    for (var in ENVIRON)
        if (var ~ /^LANG/) printf "%s=%s\n", var, ENVIRON[var]
}
