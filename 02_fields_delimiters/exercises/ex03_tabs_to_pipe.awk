# Exercise 3: CSV with tab delimiter → convert to pipe-delimited
# Run: awk -f ex03_tabs_to_pipe.awk ../data/tsv_sample.tsv
BEGIN { FS = "\t"; OFS = " | " }
{ print $1, $2, $3 }
