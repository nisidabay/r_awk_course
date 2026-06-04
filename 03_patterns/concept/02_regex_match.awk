# Regex patterns: match with // and ~
# Run: awk -F: -f 02_regex_match.awk /etc/passwd
#   /regex/   → shorthand for $0 ~ /regex/
#   $1 ~ /pat/ → field-specific match
#   $1 !~ /pat/ → field does NOT match

$NF ~ /\/(bash|zsh)$/ { printf "✅ %-15s %s\n", $1, $NF }

# Skip comments and blank lines
/^\s*#/ || NF == 0 { next }

# Print lines containing "error" (case-insensitive)
tolower($0) ~ /error/
