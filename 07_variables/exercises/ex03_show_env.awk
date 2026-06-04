# Exercise 3: config reader — read settings from env
# Run: awk -f ex03_show_env.awk /dev/null
BEGIN {
    printf "%-20s %s\n", "Variable", "Value"
    printf "%-20s %s\n", "--------", "-----"
    printf "%-20s %s\n", "USER", ENVIRON["USER"]
    printf "%-20s %s\n", "HOME", ENVIRON["HOME"]
    printf "%-20s %s\n", "SHELL", ENVIRON["SHELL"]
    printf "%-20s %s\n", "PWD", ENVIRON["PWD"]
}
