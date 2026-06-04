# Group 07 — Built-in Variables

AWK's built-in variables control I/O behavior and give you access to the
runtime environment. The most important: NR, FNR, FILENAME, ENVIRON.

## Quick Start

```bash
# FILENAME labels
awk -f concept/01_filename.awk /etc/hosts /etc/hostname

# FNR vs NR
awk -f concept/02_fnr.awk /etc/hosts /etc/hostname

# ARGC and ARGV
awk -v greeting="Hola" -f concept/03_argc_argv.awk one two three

# ENVIRON
awk -f concept/04_environ.awk /dev/null

# Number formatting
awk -f concept/05_number_format.awk /dev/null
```

## Learning Path

| File | Concept | Key Pattern |
|------|---------|-------------|
| `01_filename.awk` | FILENAME | `FNR == 1` → new file |
| `02_fnr.awk` | FNR vs NR | FNR resets per file; NR is global |
| `03_argc_argv.awk` | ARGC/ARGV | Arguments after `--` |
| `04_environ.awk` | ENVIRON | `ENVIRON["VAR"]` = value |
| `05_number_format.awk` | OFMT/CONVFMT | Default `%.6g` |

## Exercises

```bash
# wc -l across files
awk -f exercises/ex01_wc_l.awk /etc/hosts /etc/hostname

# Prefix lines with filename
awk -f exercises/ex02_file_prefix.awk /etc/hosts /etc/hostname

# Show environment
awk -f exercises/ex03_show_env.awk /dev/null

# Count how many files
awk -f exercises/ex04_how_many_files.awk *.awk /etc/hosts
```

## Common Patterns

```awk
# Detect file boundary
FNR == 1 { printf "=== %s ===\n", FILENAME }

# Per-file line count
{ count[FILENAME]++ }

# Access env vars
ENVIRON["HOME"], ENVIRON["USER"]

# Change precision
OFMT = "%.2f"   # two decimal places

# Total files to process
ARGC - 1
```

## Now Build Your Own

Write a script that processes multiple log files and prefixes each line with
the basename of the file (strip the path). Use `split(FILENAME, parts, "/")`
to get just the filename.

Run: `awk -f your_script.awk /var/log/*.log`
