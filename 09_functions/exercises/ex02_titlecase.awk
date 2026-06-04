# Exercise 2: capitalize first letter of each word
# Run: awk -f ex02_titlecase.awk data/sample.txt
function titlecase(str,    parts, i, n, result) {
    n = split(str, parts, " ")
    for (i = 1; i <= n; i++)
        result = result (i > 1 ? " " : "") toupper(substr(parts[i], 1, 1)) substr(parts[i], 2)
    return result
}
{ print titlecase($0) }
