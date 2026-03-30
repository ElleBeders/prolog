DOMAINS
    number = integer
    list = number*

PREDICATES
    nondeterm count_ending_with(list, number, number)
    nondeterm read_list(integer, list)

CLAUSES
count_ending_with([], _, 0).

count_ending_with([H|T], Digit, Count) :-
    LastDigit = H mod 10,
    LastDigit = Digit,
    count_ending_with(T, Digit, RestCount),
    Count = RestCount + 1.

count_ending_with([_|T], Digit, Count) :-
    count_ending_with(T, Digit, Count).

read_list(0, []).

read_list(N, [H|T]) :-
    N > 0,
    write("El: "),
    readint(H),
    N1 = N - 1,
    read_list(N1, T).

GOAL
    write("=== End - ? ==="), nl, nl,
    write("Len list: "),
    readint(N),
    nl,
    write("Vvod list:"), nl,
    read_list(N, List),
    nl,
    write("Vvod 0-9: "),
    readint(Digit),
    count_ending_with(List, Digit, Result),
    nl,
    write("Res ("), 
    write(Digit), 
    write("): "), 
    write(Result), 
    nl.