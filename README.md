# AWK Course — From Pattern-Action to Production Pipelines

A progressive, code-first curriculum for mastering AWK — the language that
has been shredding text for 40 years and still beats Python for one-liners.

No frameworks, no dependencies — just `/usr/bin/awk` and real data.

## Who This Is For

- You write shell scripts and grep/sed/cut chains that are getting unwieldy
- You want to process CSV/TSV/log files without importing pandas
- You've seen `awk '{print $1}'` and want to know what else it can do

## How It Works

Every concept file runs standalone — pipe data through it or pass a file:

```bash
echo "one two three" | awk -f concept/01_print_fields.awk -
# or
awk -f concept/01_print_fields.awk data.txt
```

Each group has:
- **concept/README.md** — quick-start table + learning path
- **concept/*.awk** — one concept per file, code-first, runnable with sample data inline
- **concept/data/** — sample CSV/TSV/log files for exercises
- **exercises.awk** — practice problems at the group level
- **project/** — a real pipeline script using those concepts

## The Path

Work through the numbered groups in order:

```bash
cd 01_basics/concept
cat README.md                    # see the map
awk -f 01_pattern_action.awk    # first concept
```

Then: `02_fields_delimiters` → `03_patterns` → `04_control_flow` →
`05_strings` → `06_arrays` → `07_variables` → `08_multifile` →
`09_functions` → `10_real_world`.

## Projects

`projects/` contains 10 standalone CLI tools built with pure AWK — system
monitors, file finders, log analyzers, and report generators. Everything
here was built to solve an actual problem on an Arch Linux machine.
See `projects/README.md` for a guided tour.

## Why AWK?

| Tool | Sweet spot |
|------|-----------|
| `grep` | Find lines matching a pattern |
| `sed` | Edit lines matching a pattern |
| `cut` | Extract columns by delimiter |
| **`awk`** | All of the above, plus math, aggregation, control flow |

AWK is the missing middle between shell pipelines and Python scripts.
It has variables, arrays, functions, and regular expressions — but
stays fast and single-purpose.

## Reading

`REFERENCES.md` — books, manuals, and online resources.
