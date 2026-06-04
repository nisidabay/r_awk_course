# NF and NR: the two most-used built-in variables
#   NF = Number of Fields in the current record (line)
#   NR = Number of Records read so far (line number)

# NF: how many fields on this line?
{ printf "Line %2d: %2d fields →", NR, NF
  for (i = 1; i <= NF; i++) printf " [%s]", $i
  print "" }

# NF in arithmetic: sum the last two fields
NF >= 2 { print "Sum of last two:", $(NF-1) + $NF }
