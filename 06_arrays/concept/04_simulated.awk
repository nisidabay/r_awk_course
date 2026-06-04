# Simulated arrays: split() creates numeric indices
# Run: awk -f 04_simulated.awk data/items.txt
#
# awk only has associative arrays, but split() creates
# 1-indexed integer keys, giving you list-like behavior.

{ split($0, arr, " "); n = length(arr) }

# Stack: add to "end" by tracking length
{ stack[++top] = $0 }

# Queue: dequeue from front
{
    queue[++rear] = $0
    if (front == 0) front = 1
}
END {
    print "=== Stack (LIFO) ==="
    for (i = top; i >= 1; i--) print "  ", stack[i]

    print "=== Queue (FIFO) ==="
    for (i = front; i <= rear; i++) print "  ", queue[i]
}
