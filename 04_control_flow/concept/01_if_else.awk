# if/else: awk supports standard C-style conditionals
# Run: printf '85\n45\n60\n' | awk -f 01_if_else.awk -
{
    if      ($1 >= 90) { print "A"                   }
    else if ($1 >= 80) { print "B"                   }
    else if ($1 >= 70) { print "C"                   }
    else                 { print "F"                   }
    # No curly braces for single-statement branches:
    if ($1 < 50) print "⚠️  warning: low score"
}
