# Exercise 2: convert /etc/passwd to CSV
# Run: awk -F: -f ex02_passwd_to_csv.awk /etc/passwd
BEGIN { OFS = "," }
{ print $1, $3, $7 }
