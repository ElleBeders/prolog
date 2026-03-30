DOMAINS
    person = a; n; v; g; d
    list = person*

PREDICATES
    nondeterm member(person, list)
    nondeterm condition1(list)
    nondeterm condition2(list)
    nondeterm condition3(list)
    nondeterm condition4(list)
    nondeterm condition5(list)
    nondeterm condition6(list)
    nondeterm solution(list)
    write_list(list)
    write_person(person)

CLAUSES
member(X, [X|_]).
member(X, [_|T]) :-
    member(X, T).

condition1(List) :-
    not(member(a, List)),
    not(member(d, List)).
condition1(List) :-
    member(a, List),
    not(member(d, List)).
condition1(List) :-
    not(member(a, List)),
    member(d, List).
condition1(List) :-
    member(a, List),
    member(d, List),
    member(n, List).

condition2(List) :-
    member(d, List).
condition2(List) :-
    not(member(d, List)),
    member(n, List),
    not(member(v, List)).

condition3(List) :-
    member(a, List),
    not(member(v, List)).
condition3(List) :-
    not(member(a, List)),
    member(v, List).

condition4(List) :-
    not(member(d, List)).
condition4(List) :-
    member(d, List),
    not(member(g, List)).

condition5(List) :-
    member(n, List).
condition5(List) :-
    member(v, List).
condition5(List) :-
    not(member(n, List)),
    not(member(v, List)),
    member(d, List).

condition6(List) :-
    member(n, List).
condition6(List) :-
    not(member(v, List)).
condition6(List) :-
    not(member(n, List)),
    member(v, List),
    not(member(d, List)),
    member(g, List).

solution([a, n]).
solution([a, n, g]).
solution([a, n, d]).
solution([n, v, d]).

write_list([]).
write_list([H|T]) :-
    write_person(H),
    write_list(T).

write_person(a) :- write("Andrey ").
write_person(n) :- write("Nikolay ").
write_person(v) :- write("Viktor ").
write_person(g) :- write("Grigoriy ").
write_person(d) :- write("Dmitriy ").

GOAL
    write("=== SOSTAV ==="), nl, nl,
    solution(List),
    write("Sostav: "),
    write_list(List),
    nl.