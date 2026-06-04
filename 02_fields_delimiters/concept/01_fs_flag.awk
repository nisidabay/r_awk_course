# FS: Field Separator — how awk splits each line into $1, $2, ...
# Default: any whitespace (spaces + tabs), leading/trailing stripped
#   echo "a  b   c" | awk '{print NF}'  →  3
#   awk -F: '{print $1, $NF}' /etc/passwd  → username + shell

# -F sets FS from the command line
BEGIN { printf "%-15s %s\n", "Username", "Shell"; print "--------" }
{ printf "%-15s %s\n", $1, $NF }
