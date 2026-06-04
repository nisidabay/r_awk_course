# Exercise 4: compute a histogram of score ranges
# Run: awk -f ex04_histogram.awk data/scores.txt  (cd to concept/ first)
{
    if      ($2 >= 90) { a90++;  bar_90  = bar_90  "█" }
    else if ($2 >= 70) { a70++;  bar_70  = bar_70  "█" }
    else if ($2 >= 50) { a50++;  bar_50  = bar_50  "█" }
    else                 { a_fail++; bar_fail = bar_fail "█" }
}
END {
    print "90-100:", bar_90,  a90
    print "70-89:",  bar_70,  a70
    print "50-69:",  bar_50,  a50
    print "  <50:",   bar_fail, a_fail
}
