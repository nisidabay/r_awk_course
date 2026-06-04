# Group 08 — Multi-File Processing

Process multiple files: join data, compute set operations, skip files.
This is where AWK starts replacing Python scripts.

## Quick Start

```bash
# ARGIND: which file we're on
awk -f concept/01_argind.awk concept/data/*.txt

# nextfile: skip to the next file
awk -f concept/02_nextfile.awk concept/data/*.txt

# Join two files by key
awk -f concept/03_join.awk concept/data/users.txt concept/data/scores.txt
```

## Learning Path

| File | Concept | Key Pattern |
|------|---------|-------------|
| `01_argind.awk` | ARGIND | `ARGV[ARGIND]` = current filename |
| `02_nextfile.awk` | nextfile | Skip to next file immediately |
| `03_join.awk` | File join | `FILENAME == ARGV[1]` → store, `ARGV[2]` → lookup |

## Exercises

```bash
# Set difference: lines in file1 but not file2
awk -f exercises/ex01_set_diff.awk /etc/hosts /etc/hostname

# Zip two files line by line
awk -f exercises/ex02_zip.awk /etc/hosts /etc/hostname
```

## Common Patterns

```awk
# Detect which file is being read
FILENAME == ARGV[1] { ... }   # first file
FILENAME == ARGV[2] { ... }   # second file

# Process only first N files
FNR == 1 && ARGIND > N { exit }

# Join pattern: store first file, join on second
FNR == NR { map[$1] = $0; next }   # first file
{ print map[$1], $2 }              # second file
```

## Now Build Your Own

Write a script that reads two CSV files — `names.txt` (id,name) and
`scores.txt` (id,score) — and joins them to produce `name,score` output.
Skip any names without scores.

Create the files:
```bash
echo -e "1,Carlos\n2,Elena\n3,Ana" > names.txt
echo -e "2,95\n1,88\n3,72" > scores.txt
awk -f your_script.awk names.txt scores.txt
```
