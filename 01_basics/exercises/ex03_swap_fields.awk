# Exercise 3: swap first and last field
# Run: echo "Mr. Carlos Nisida Bay" | awk -f ex03_swap_fields.awk -
{ first = $1; $1 = $NF; $NF = first; print }
