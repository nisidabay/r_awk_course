# Group 09 — Functions

User functions let you bundle repetitive logic, write reusable libraries,
and structure larger AWK programs. The trick: all extra parameters are local.

## Quick Start

```bash
# Basic function: grade calculation
awk -f concept/01_basic_function.awk /etc/passwd   # (uses BEGIN only)

# Local variables: extra params = local
awk -f concept/02_locals.awk /dev/null

# Library include: @include "lib.awk"
awk -f concept/03_include.awk /dev/null
```

## Learning Path

| File | Concept | Key Pattern |
|------|---------|-------------|
| `01_basic_function.awk` | `function name(params)` | Return value with `return` |
| `02_locals.awk` | Local variables | Extra params are local scope |
| `03_include.awk` | `@include` | Load from file or `AWKPATH` |
| `lib.awk` | Shared library | Reusable utility functions |

## Exercises

```bash
# Median of three
awk -f exercises/ex01_median.awk data/numbers.txt

# Title case each line
awk -f exercises/ex02_titlecase.awk data/sample.txt

# Factorial
awk -f exercises/ex03_factorial.awk data/numbers.txt

# Human-readable file sizes
awk -f exercises/ex04_human_size.awk data/sizes.txt
```

## Common Patterns

```awk
# Define: function name(params,    locals)
function sum(a, b,    total) { ... return total }

# Recursive: self-call with base case
function factorial(n) { return n <= 1 ? 1 : n * factorial(n-1) }

# Library: @include "lib.awk"
# AWKPATH = .:/usr/share/awk  (search path)

# Utility: human-readable bytes
function human(n) { ... return sprintf("%.1f %s", n, unit) }
```

## Now Build Your Own

Write a reusable library `math.awk` with `gcd(a,b)` and `lcm(a,b)` functions.
Then write a script that reads pairs of numbers and prints both.

```bash
# Create library
cat > math.awk << 'EOF'
function gcd(a, b) { ... }
function lcm(a, b) { return a / gcd(a, b) * b }
EOF

# Use it
echo '12 18' | awk -f math.awk -f <(echo '{ print gcd($1, $2), lcm($1, $2) }') -
```
