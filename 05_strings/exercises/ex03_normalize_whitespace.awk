# Exercise 3: normalize whitespace — collapse all whitespace to single spaces
# Run: awk -f ex03_normalize_whitespace.awk /etc/ssh/sshd_config
{ gsub(/[[:space:]]+/, " "); sub(/^ /, ""); print }
