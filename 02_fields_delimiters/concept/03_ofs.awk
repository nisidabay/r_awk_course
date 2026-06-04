# OFS: Output Field Separator — what print inserts between args
# Run: printf 'one two three\n' | awk -f 03_ofs.awk -
BEGIN { OFS = "," }   # set at start — all prints use this
{   printf "Input: %s\n", $0             # printf avoids OFS
    printf "Fields:"; for (i=1; i<=NF; i++) printf " [%d]%s", i, $i; print ""
    $2 = "__" $2 "__"
    printf "After modifying $2: %s\n", $0
}
