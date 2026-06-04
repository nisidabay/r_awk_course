# Exercise 3: extract function signatures from source: lines matching
#   func → ) {  (AWK-style) or  →) {  (C-style)
# Run: awk -f ex03_function_sigs.awk ~/r_awk_course/01_basics/concept/*.awk
/\<function\>/ || /\)\s*\{/ { printf "%4d: %s\n", NR, $0 }
