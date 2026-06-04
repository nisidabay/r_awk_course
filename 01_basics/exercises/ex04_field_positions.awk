# Exercise 4: show fields with position numbers
# Run: echo "alpha beta gamma delta" | awk -f ex04_field_positions.awk -
{ for (i = 1; i <= NF; i++) printf "[%d]=%s ", i, $i; print "" }
