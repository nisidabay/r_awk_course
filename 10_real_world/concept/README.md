# Group 10 — Real-World Pipelines

Production-ready one-liners and scripts: log analysis, CSV aggregation,
system monitoring. This is where everything comes together.

## Quick Start

```bash
# Log analysis
awk -f concept/01_log_report.awk /var/log/pacman.log

# CSV aggregation
awk -F, -f concept/02_csv_stats.awk concept/data/sales.csv

# Report generator
awk -F, -f concept/03_report.awk concept/data/sales.csv

# Top memory processes
ps aux | awk -f concept/04_top_memory.awk -
```

## Learning Path

| File | Concept | Skills Used |
|------|---------|------------|
| `01_log_report.awk` | Hour buckets | Arrays, substr, END |
| `02_csv_stats.awk` | Group + aggregate | FS, arrays, format |
| `03_report.awk` | Multi-section report | BEGIN/END, sprintf |
| `04_top_memory.awk` | Process monitoring | Filter, rank, format |

## Exercises

```bash
# HTTP status code distribution
awk -f exercises/ex01_status_codes.awk concept/data/access.log

# Summarize file sizes by extension
ls -la /usr/bin | awk -f exercises/ex02_du_summary.awk -

# Column statistics: min/max/avg/stddev
awk -f exercises/ex03_column_stats.awk concept/data/stats.txt

# Password strength checker
awk -f exercises/ex04_password_check.awk concept/data/passwords.txt
```

## Common Patterns

```awk
# Group by column
{ count[$1]++ }

# Aggregate by key
{ total[$1] += $2 }

# Filter + rank
$3 > 0 { data[$1] = $3 }
END { for (k in data) ... }

# Report format
BEGIN { printf header }
END { printf total }

# Pipe input
some_command | awk '{ ... }'
```

## Now Build Your Own

Write a "log watch" script that:
1. Reads `/var/log/pacman.log`
2. Counts package operations by type (installed, upgraded, removed)
3. Shows the top 10 most-upgraded packages

The log format: `[YYYY-MM-DDTHH:MM:SS+TZ] [ALPM] (operation) package`

Run it: `awk -f your_script.awk /var/log/pacman.log`
