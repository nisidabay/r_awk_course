# Exercise 1: print username, UID, and home dir from /etc/passwd
# Run: awk -F: -f ex01_passwd_fields.awk /etc/passwd
{ printf "%-15s UID=%4s HOME=%s\n", $1, $3, $6 }
