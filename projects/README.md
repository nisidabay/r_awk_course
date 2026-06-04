# Projects — The AWK Toolbox

These aren't exercises. These are standalone CLI tools that replace shell pipelines
on a real Arch Linux machine. Every one of them solved a real problem with pure AWK.

## Where to Start

If you're new to these tools, try them in this order:

| # | Tool | Why first |
|---|---|---|
| 1 | `wcstat` | Simplest — multi-file `wc -l` with percentages (07 variables, 03 BEGIN/END) |
| 2 | `field_swapper` | One-liner — swap fields by index (01 fields, 02 OFS) |
| 3 | `shell_users` | Real data — classify users by shell (02 FS, 06 arrays) |
| 4 | `passwd_report` | Classify users as root/system/human (06 arrays, 04 control flow) |
| 5 | `colstats` | Statistics — min/max/avg/stddev (06 arrays, 04 control flow) |

## Tool → Concept Groups

| Tool | What it does | Concepts used |
|---|---|---|
| `colstats` | Column statistics (min/max/avg/stddev) | 04 (if/else), 06 (arrays), 03 (END) |
| `csvreport` | CSV → formatted table | 02 (FS/OFS), 05 (sprintf), 03 (BEGIN/END) |
| `dupefinder` | Duplicate files by checksum | 06 (arrays), 05 (match) |
| `extstats` | Aggregate file sizes by extension | 06 (arrays), 05 (split/match) |
| `field_swapper` | Swap/reorder fields | 01 (fields), 02 (OFS) |
| `logwatch` | Log events by hour (bar chart) | 06 (arrays), 05 (substr) |
| `passwd_report` | User classification | 02 (FS), 06 (arrays), 04 (if/else) |
| `shell_users` | Shell distribution | 02 (FS), 06 (arrays) |
| `topmem` | Top memory consumers | 06 (arrays), 05 (format), 03 (END) |
| `wcstat` | Word count with percentages | 07 (FNR/FILENAME), 03 (BEGIN/END) |

## By Concept Group

### 01 Basics & Fields
`field_swapper`

### 02 Fields & Delimiters
`csvreport`, `passwd_report`, `shell_users`

### 03 Patterns
`wcstat`, `csvreport`, `colstats`

### 04 Control Flow
`colstats`, `passwd_report`

### 05 Strings
`csvreport`, `dupefinder`, `extstats`, `logwatch`, `topmem`

### 06 Arrays
*Everything* uses arrays, but these lean heaviest:
`colstats`, `dupefinder`, `extstats`, `logwatch`, `passwd_report`, `shell_users`, `topmem`

### 07 Variables
`wcstat`

## Installation

All tools are single-file scripts with a shebang:

```bash
# Make executable
chmod +x projects/<tool>.awk

# Run directly
projects/<tool>.awk data.txt

# Or copy to PATH
cp projects/<tool>.awk ~/.local/bin/<tool>
```

Check the header comment in each file for exact usage.
