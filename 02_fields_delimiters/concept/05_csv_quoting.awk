# CSV with quoted fields: "San Francisco, CA" has commas inside quotes.
# Simple FS="," breaks — it splits inside the quoted field.
# FPAT (gawk extension): define what a field IS, not what separates them.
#   FPAT = "([^,]+)|(\"[^\"]+\")"  → non-comma chars OR double-quoted strings

BEGIN { FPAT = "([^,]+)|(\"[^\"]+\")" }
{
    printf "City: %-25s State: %s\n", $1, $2
    # strip quotes from first field
    gsub(/"/, "", $1)
    printf "  Clean: %s\n", $1
}
