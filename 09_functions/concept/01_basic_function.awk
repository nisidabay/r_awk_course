# User-defined functions: function name(params) { ... }
# Run: awk -f 01_basic_function.awk /etc/passwd
#
# Parameters are positional. Extra args → ignored. Missing args → "" or 0.
# Local variables go in the parameter list (no 'local' keyword).

function grade(score) {
    if (score >= 90) return "A"
    if (score >= 80) return "B"
    if (score >= 70) return "C"
    return "F"
}

function average(a, b, c) { return (a + b + c) / 3 }

function greet(name) {
    printf "Hello, %s!\n", name
}

BEGIN {
    print "Grade 85:", grade(85)
    print "Grade 95:", grade(95)
    printf "Avg of 10/20/30: %.1f\n", average(10, 20, 30)
    greet("Carlos")
}
