DOMAINS
    number = integer
    list = number*

PREDICATES
    nondeterm set_difference(list, list, list)
    nondeterm set_difference_aux(list, list, list, list)
    nondeterm read_list(integer, list)
    nondeterm is_member(number, list)
    nondeterm remove_duplicates(list, list)
    nondeterm remove_duplicates_aux(list, list, list)
    nondeterm write_list(list)
    nondeterm reverse_list(list, list)
    nondeterm reverse_aux(list, list, list)

CLAUSES
is_member(X, [X|_]).
is_member(X, [_|T]) :-
    is_member(X, T).

remove_duplicates_aux([], Acc, Acc).
remove_duplicates_aux([H|T], Acc, Result) :-
    not(is_member(H, Acc)),
    remove_duplicates_aux(T, [H|Acc], Result).
remove_duplicates_aux([H|T], Acc, Result) :-
    is_member(H, Acc),
    remove_duplicates_aux(T, Acc, Result).

remove_duplicates(List, Result) :-
    remove_duplicates_aux(List, [], RevResult),
    reverse_list(RevResult, Result).

reverse_aux([], Acc, Acc).
reverse_aux([H|T], Acc, Result) :-
    reverse_aux(T, [H|Acc], Result).

reverse_list(List, Result) :-
    reverse_aux(List, [], Result).

set_difference_aux([], _, Acc, Acc).
set_difference_aux([H|T], SetB, Acc, Result) :-
    not(is_member(H, SetB)),
    set_difference_aux(T, SetB, [H|Acc], Result).
set_difference_aux([_|T], SetB, Acc, Result) :-
    set_difference_aux(T, SetB, Acc, Result).

set_difference(SetA, SetB, Result) :-
    set_difference_aux(SetA, SetB, [], RevResult),
    reverse_list(RevResult, Result).

read_list(0, []).
read_list(N, [H|T]) :-
    N > 0,
    write("El: "),
    readint(H),
    N1 = N - 1,
    read_list(N1, T).

write_list([]).
write_list([H|T]) :-
    write(H),
    write(" "),
    write_list(T).

GOAL
    write("=== A \\ B ==="), nl, nl,
    
    write("Len mn A: "),
    readint(N1), 
    nl,
    write("Vvod mn A:"), nl,
    read_list(N1, ListA_raw),
    remove_duplicates(ListA_raw, SetA),
    nl,
    write("Mn A: "), write_list(SetA), nl, nl,
    
    write("Len mn B: "),
    readint(N2),
    nl,
    write("Vvod mn B:"), nl,
    read_list(N2, ListB_raw),
    remove_duplicates(ListB_raw, SetB),
    nl,
    write("Mn B: "), write_list(SetB), nl, nl,
    
    set_difference(SetA, SetB, Difference),
    write("RES: "), write_list(Difference), nl.