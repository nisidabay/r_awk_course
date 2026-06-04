# Shared library: useful math + string utilities
# Used by 03_include.awk

function sum(a, b) { return a + b }
function double(x) { return x * 2 }
function greet(name) { printf "Hello, %s!\n", name }
