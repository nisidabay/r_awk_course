# next and exit: control loop flow
# Run: awk -f 03_next_exit.awk data/scores.txt
#   next   → skip to next line immediately
#   exit   → stop processing entirely (triggers END block)

# Skip header line
NR == 1 { next }

# Stop after first failing student
$2 < 60 {
    print "First fail:", $0
    exit
}

# Only reached if no exit was triggered
{ print "Pass:", $0 }
