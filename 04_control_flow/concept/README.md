# Group 04 — Control Flow

AWK has full C-style control flow: conditionals, loops, and flow control.
Use it when pattern-action pairs alone aren't expressive enough.

## Quick Start

```bash
# if/else: score grading
printf '85\n45\n60\n' | awk -f concept/01_if_else.awk -

# Loops: while, for, for-in
printf 'a b c d e\n' | awk -f concept/02_loops.awk -

# next/exit: skip or stop
awk -f concept/03_next_exit.awk concept/data/scores.txt
```

## Learning Path

| File | Concept | Key Pattern |
|------|---------|-------------|
| `01_if_else.awk` | if/else if/else | C-style cascading conditions |
| `02_loops.awk` | while, for, for-in | while vs for vs array iteration |
| `03_next_exit.awk` | next, exit | Skip lines or halt processing |

## Exercises

```bash
# Classify lines by length
awk -f exercises/ex01_line_lengths.awk /etc/hosts

# Print lines in reverse
awk -f exercises/ex02_reverse_lines.awk /etc/hosts

# Stop after 10 matches
awk -f exercises/ex03_grep_limit.awk concept/data/5letter_aa_words.txt

# Histogram of scores
cd concept && awk -f ../exercises/ex04_histogram.awk data/scores.txt
```

## Common Patterns

```awk
# if/else
if (condition) { action } else { other }

# while: manual iteration
i = 1; while (i <= NF) { ...; i++ }

# for: C-style iteration
for (i = 1; i <= NF; i++) { ... }

# for-in: array keys
for (key in array) { print key, array[key] }

# next: skip to next line
NR == 1 { next }  # skip header

# exit: stop processing (triggers END)
count >= 10 { exit }
```

## Now Build Your Own

Write an awk script that reads `/etc/passwd` and classifies accounts:
- `root` for UID 0
- `system` for UID 1–999
- `human` for UID ≥ 1000

Print a summary at the end: counts for each category.

Run it: `awk -F: -f your_script.awk /etc/passwd`
