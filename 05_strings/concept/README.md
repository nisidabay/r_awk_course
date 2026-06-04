# Group 05 — Strings

AWK's string functions rival Python's for text processing: substitute, extract,
split, format. Master these and you can replace many one-shot Python scripts.

## Quick Start

```bash
# length: character count
awk -f concept/01_length.awk /etc/hosts

# substr: extract substrings
awk -f concept/02_substr.awk /etc/hosts

# gsub / sub: find-replace
printf 'the quick brown fox\nthe fox\n' | awk -f concept/03_gsub_sub.awk -

# match: regex position + capture
awk -F: -f concept/04_match.awk /etc/passwd

# split: break string into array
awk -f concept/05_split.awk /etc/group

# sprintf / toupper / tolower
echo localhost | awk -f concept/06_sprintf.awk -

# index: literal substring position
printf 'The QUICK brown fox\nQUICK fox\n' | awk -f concept/07_index.awk -
```

## Learning Path

| File | Concept | Key Pattern |
|------|---------|-------------|
| `01_length.awk` | `length()` | `length($0)` → char count |
| `02_substr.awk` | `substr(s,start,len)` | 1-based extraction |
| `03_gsub_sub.awk` | `gsub`/`sub` | Global vs first-match replace |
| `04_match.awk` | `match(s,re)` | Sets `RSTART`/`RLENGTH` |
| `05_split.awk` | `split(s,arr,sep)` | Break on delimiter |
| `06_sprintf.awk` | `sprintf`/`toupper`/`tolower` | Format + case |
| `07_index.awk` | `index(s,t)` | Literal substring search |

## Exercises

```bash
# Character counts per line
awk -f exercises/ex01_char_count.awk /etc/hosts

# Extract domain from email
awk -f exercises/ex02_extract_domain.awk concept/data/emails.txt

# Normalize whitespace
awk -f exercises/ex03_normalize_whitespace.awk /etc/ssh/sshd_config

# Word frequency counter
awk -f exercises/ex04_word_frequency.awk concept/data/sample.txt
```

## Common Patterns

```awk
# Clean whitespace: collapse to single spaces
{ gsub(/[[:space:]]+/, " "); sub(/^ /, "") }

# Extract text between markers
match($0, /\[(.+)\]/, arr) { print arr[1] }

# Case-insensitive contains
tolower($0) ~ /pattern/

# Count occurrences (replace returns count)
n = gsub(/x/, "", $0)   # n = how many x's removed

# Remove punctuation
gsub(/[^a-zA-Z0-9 ]/, "")
```

## Now Build Your Own

Write an awk script that reads a file and reports:
1. Total characters (sum of all `length($0)`)
2. Total words (sum of `NF`)
3. Average word length: `total_chars / total_words`

Run it on `concept/data/sample.txt`: `awk -f your_script.awk concept/data/sample.txt`
