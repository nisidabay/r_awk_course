# Setting FS in BEGIN vs -F flag
#   -F:   sets FS before any line is read
#   BEGIN { FS = ":" }  → sets it before reading, same effect
#   Setting FS after BEGIN → first line already split with old FS!

# -F sets FS before your script runs — safe, always correct
# This script expects: awk -F: -f 02_fs_in_script.awk /etc/passwd
NR <= 3 { print $1, $NF }

# Alternate: set FS inside BEGIN block
# BEGIN { FS = ":" }
# { print $1, $NF }
