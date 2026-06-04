# FS as a regex: FS = "[,:]" splits on commas OR colons
# Run: awk -f 04_regex_fs.awk data/mixed.csv
# data/mixed.csv contains: name:age,city

BEGIN { FS = "[,:]" }
{ printf "1=%s 2=%s 3=%s\n", $1, $2, $3 }
