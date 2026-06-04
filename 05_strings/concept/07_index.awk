# index + tolower/toupper — find literal substring
# Run: printf 'The QUICK brown fox\nQUICK fox\n' | awk -f 07_index.awk -
#
# index(s, t): position of substring t in s, 0 if not found
# Case-sensitive. Use tolower() for case-insensitive:

{ lower = tolower($0)
  if (index(lower, "quick") > 0)
      printf "%2d: contains 'quick': %s\n", NR, $0
}
