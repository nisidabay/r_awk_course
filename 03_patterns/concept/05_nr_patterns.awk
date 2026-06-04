# NR-based filtering: every Nth line, first N, last N
#   NR % N == 0  → every Nth line
#   NR <= N      → first N lines (head)
#   In END, NR holds total count — no "last N" shortcut for large files

BEGIN { printf "=== First 3 lines ===\n" }
NR <= 3 { printf "  %2d: %s\n", NR, $0 }

# Every 3rd line (starting from line 3)
NR % 3 == 0 { printf "→ %2d: %s\n", NR, $0 }

# Print every line that's a multiple of 5 (5, 10, 15, ...)
NR % 5 == 0 { print "Multiple of 5:", NR, $0 }
