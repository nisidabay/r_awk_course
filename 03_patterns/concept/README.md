# Group 03 — Patterns

AWK patterns decide WHICH lines to process. The real power is composing them:
`/error/ && NR > 100`, `/^## START/,/^## END/`, `NR % 10 == 0`.

## Quick Start

```bash
# BEGIN/END: header and footer
printf '10\n20\n30\n' | awk -f concept/01_begin_end.awk -

# Regex match: show bash/zsh users only
awk -F: -f concept/02_regex_match.awk /etc/passwd

# Range: extract marked blocks
printf '## START\na\nb\n## END\n' | awk -f concept/03_range_patterns.awk -

# Boolean: AND/OR/NOT
seq 1 10 | awk -f concept/04_boolean_patterns.awk -

# NR-based: every 3rd, 5th, first 3
printf 'line1\nline2\n…\nline8\n' | awk -f concept/05_nr_patterns.awk -
```

## Learning Path

| File | Concept | Key Pattern |
|------|---------|-------------|
| `01_begin_end.awk` | BEGIN / END | Run once before/after all input |
| `02_regex_match.awk` | `~` / `!~` | Match fields or whole line |
| `03_range_patterns.awk` | `/start/,/end/` | Inclusive line range |
| `04_boolean_patterns.awk` | `&&` / `||` / `!` | Compose conditions |
| `05_nr_patterns.awk` | NR-based | First N, every Nth, last N |

## Exercises

```bash
# Count non-blank, non-comment lines
awk -f exercises/ex01_noncomment_lines.awk /etc/hosts

# Show file header structure
awk -f exercises/ex02_file_header.awk /etc/group

# Extract function signatures from source
awk -f exercises/ex03_function_sigs.awk ~/r_awk_course/01_basics/concept/*.awk

# Every 10th line from a large file
awk -f exercises/ex04_every_nth.awk /usr/share/dict/words
```

## Common Patterns

```awk
# Skip comments and blank lines
NF > 0 && !/^#/

# Lines 10-20 of a file
NR >= 10 && NR <= 20

# Every 5th line
NR % 5 == 0

# From marker to end of file
/^START/,0

# Grep for errors (case-insensitive)
tolower($0) ~ /error|fail|fatal/
```

## Now Build Your Own

Write an awk script that:
1. Counts total lines in the file
2. Counts comment lines (starting with `#`)
3. Shows the fraction: `N comment lines / M total lines = X%`

Run it on `~/.bashrc` or any config file: `awk -f your_script.awk ~/.bashrc`
