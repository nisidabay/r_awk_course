# Group 02 — Fields & Delimiters

Control how AWK splits input and formats output. Default whitespace splitting
works for 80% of cases; `-F`, `FS`, `OFS`, and `FPAT` handle the rest.

## Quick Start

```bash
# -F: for colon-delimited files
awk -F: -f concept/01_fs_flag.awk /etc/passwd

# BEGIN { FS } works the same as -F
awk -F: -f concept/02_fs_in_script.awk /etc/passwd

# OFS: control what print inserts between fields
printf 'one two three\n' | awk -f concept/03_ofs.awk -

# FS as regex: split on multiple delimiters
awk -f concept/04_regex_fs.awk concept/data/mixed.csv

# FPAT: define field content (gawk) for quoted CSV
printf '"San Francisco, CA",CA,94102\nAustin,TX,73301\n' | awk -f concept/05_csv_quoting.awk -
```

## Learning Path

| File | Concept | Key Pattern |
|------|---------|-------------|
| `01_fs_flag.awk` | `-F` flag | `-F:` → split on colon |
| `02_fs_in_script.awk` | BEGIN { FS } | Same as -F, must be set before first line |
| `03_ofs.awk` | OFS | Output separator — field assign → rebuilds $0 |
| `04_regex_fs.awk` | FS as regex | `[,:]` → split on comma or colon |
| `05_csv_quoting.awk` | FPAT | `([^,]+)|("[^"]+")` → field content, not separator |

## Exercises

```bash
# Print username, UID, home dir
awk -F: -f exercises/ex01_passwd_fields.awk /etc/passwd

# Convert /etc/passwd to CSV
awk -F: -f exercises/ex02_passwd_to_csv.awk /etc/passwd

# TSV → pipe-delimited
awk -f exercises/ex03_tabs_to_pipe.awk data/tsv_sample.tsv

# Count unique shells
awk -F: -f exercises/ex04_shell_count.awk /etc/passwd
```

## Common Patterns

```awk
# Quick passwd field extraction
awk -F: '{ print $1, $3, $7 }' /etc/passwd

# Convert colon to CSV
awk 'BEGIN { FS=":"; OFS="," } { print $1, $3, $7 }' /etc/passwd

# Split on comma, output with tabs
awk 'BEGIN { FS=","; OFS="\t" } { print }' data.csv

# Handle CSV quoting (gawk)
gawk 'BEGIN { FPAT = "([^,]+)|(\"[^\"]+\")" } { print $1, $2 }' data.csv
```

## Now Build Your Own

Write an awk script that reads `/etc/group` and prints the group name
and member count. Use `-F:` — group is `$1`, members are `$4` (comma-separated).

Run it: `awk -F: -f your_script.awk /etc/group`

Bonus: sort output by member count (pipe to `sort -t: -k2 -rn`).
