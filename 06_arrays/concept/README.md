# Group 06 — Arrays

AWK's associative arrays are the engine behind most real-world pipelines:
group, count, aggregate, report. No declaration, no type — just use a key.

## Quick Start

```bash
# Basic associative array
awk -f concept/01_associative.awk concept/data/scores.txt

# Aggregate: sum, count, avg
awk -f concept/02_aggregate.awk concept/data/scores.txt

# Delete: remove elements
awk -f concept/03_delete.awk concept/data/logins.txt

# Simulated stack/queue
awk -f concept/04_simulated.awk concept/data/items.txt

# Multidimensional: sub-arrays
awk -F: -f concept/05_multidim.awk /etc/passwd
```

## Learning Path

| File | Concept | Key Pattern |
|------|---------|-------------|
| `01_associative.awk` | `arr[key]++` | Auto-create on first reference |
| `02_aggregate.awk` | Sum + count per group | `total[$k]+=$v; count[$k]++` |
| `03_delete.awk` | `delete arr[key]` | Remove from `for-in` |
| `04_simulated.awk` | Stack/queue with index tracking | `stack[++top]` / `queue[++rear]` |
| `05_multidim.awk` | Sub-arrays | `arr[a][b]` → nested for-in |

## Exercises

```bash
# Word frequency
awk -f exercises/ex01_word_count.awk concept/data/items.txt

# Group users by shell
awk -F: -f exercises/ex02_shell_groups.awk /etc/passwd

# Find duplicate lines
awk -f exercises/ex03_duplicates.awk concept/data/scores.txt

# IP frequency percentages
awk -f exercises/ex04_ip_pct.awk concept/data/logins.txt
```

## Common Patterns

```awk
# Count per group
{ count[$1]++ }

# Sum per group
{ total[$1] += $2 }

# Average per group (END)
for (k in total) print k, total[k]/count[k]

# Most frequent
END { for (k in count) if (count[k] > max) { max = count[k]; winner = k } }

# Filter low-frequency
for (k in count) if (count[k] < 5) delete count[k]
```

## Now Build Your Own

Write an awk script that reads `/var/log/pacman.log` (or any log) and counts
the number of lines per day (`[YYYY-MM-DD]`). Print the top 5 days by count.

Run: `awk -f your_script.awk /var/log/pacman.log`
