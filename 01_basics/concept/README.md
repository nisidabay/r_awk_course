# Group 01 — Pattern-Action, Print, Fields

AWK's fundamental execution model: pattern-action pairs run on every input line.

## Quick Start

```bash
# The core model
printf 'a b c d e\nx y\n' | awk -f concept/01_pattern_action.awk -

# Field references: $1, $NF, $0
printf 'alpha beta gamma delta\none two three\n' | awk -f concept/02_field_reference.awk -

# print vs printf
printf 'Carlos 35\nElena 28\n' | awk -f concept/03_print_variants.awk -

# NF and NR: field count and record number
printf 'a b c\nx y z w\n10 20\n' | awk -f concept/04_nf_nr.awk -
```

## Learning Path

| File | Concept | Key Pattern |
|------|---------|-------------|
| `01_pattern_action.awk` | pattern { action } | `NF > 3 { print }`, `{ count++ } END { ... }` |
| `02_field_reference.awk` | $1, $NF, $0 | `$NF` = last field, `$0` = whole line |
| `03_print_variants.awk` | print vs printf | Comma inserts OFS, no-comma concatenates |
| `04_nf_nr.awk` | NF, NR | `NF` = field count, `NR` = lines seen so far |

## Exercises

```bash
# Print second field
printf 'Filesystem Size Used\n/dev/sda1 100G 50G\n' | awk -f exercises/ex01_second_field.awk -

# Line count
awk -f exercises/ex02_line_count.awk /etc/hosts

# Swap first and last field
echo "Mr. Carlos Nisida Bay" | awk -f exercises/ex03_swap_fields.awk -

# Field positions
echo "alpha beta gamma delta" | awk -f exercises/ex04_field_positions.awk -
```

## Common Patterns

```awk
# Print specific fields
{ print $1, $3 }

# Print line with line number
{ print NR ":", $0 }

# Print last field
{ print $NF }

# Count lines
END { print NR, "lines" }
```

## Now Build Your Own

Write an awk script that reads `/etc/passwd` and prints each user's
username (`$1`, split on `:`) and shell (`$NF`), skipping system accounts
with `/sbin/nologin` or `/bin/false`.

Run it: `awk -F: -f your_script.awk /etc/passwd`
