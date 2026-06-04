#!/usr/bin/awk -f
# field_swapper — swap fields by index
# Usage: awk -v f1=2 -v f2=4 -f field_swapper.awk data.txt
# Groups: 01 fields, 02 OFS

BEGIN { OFS = "\t" }
{
    tmp = $f1
    $f1 = $f2
    $f2 = tmp
    print
}
