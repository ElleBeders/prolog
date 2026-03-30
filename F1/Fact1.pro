DOMAINS
number = integer
PREDICATES
nondeterm fact(number, number, number)
CLAUSES
fact(A, 0, A).
fact(A, B, Res) :- B > 0, Pro = A mod B, fact(B, Pro, Res).
GOAL
write("=== NOD ==="), nl, nl,
Write ("A = "), readint(A), Write ("B = "), readint(B), fact(A, B, Res), write("NOD = ", Res), nl.