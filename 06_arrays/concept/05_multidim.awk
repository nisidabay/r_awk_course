# Multidimensional arrays: SUBSEP-separated composite keys
# Run: awk -f 05_multidim.awk /etc/passwd
#
# awk has no true 2D arrays — you simulate with $1,$2 as key
#   arr["shell","uid"] → internally "shell\x1cuid" (SUBSEP = \x1c)

{ shells_users[$NF][$1] = 1 }   # shell → [usernames]

END {
    for (shell in shells_users) {
        printf "%d users with %s:", length(shells_users[shell]), shell
        for (user in shells_users[shell]) printf " %s", user
        print ""
    }
}
