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
    nondeterm solve

CLAUSES
member(X, [X|_]).
member(X, [_|T]) :-
    member(X, T).

% Условие 1
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

% Условие 2
condition2(List) :-
    member(d, List).
condition2(List) :-
    not(member(d, List)),
    member(n, List),
    not(member(v, List)).

% Условие 3
condition3(List) :-
    member(a, List),
    not(member(v, List)).
condition3(List) :-
    not(member(a, List)),
    member(v, List).

% Условие 4
condition4(List) :-
    not(member(d, List)).
condition4(List) :-
    member(d, List),
    not(member(g, List)).

% Условие 5
condition5(List) :-
    member(n, List).
condition5(List) :-
    member(v, List).
condition5(List) :-
    not(member(n, List)),
    not(member(v, List)),
    member(d, List).

% Условие 6
condition6(List) :-
    member(n, List).
condition6(List) :-
    not(member(v, List)).
condition6(List) :-
    not(member(n, List)),
    member(v, List),
    not(member(d, List)),
    member(g, List).

% Все возможные комбинации (только уникальные, в алфавитном порядке)
solution([]).
solution([a]).
solution([n]).
solution([v]).
solution([g]).
solution([d]).
solution([a, n]).
solution([a, v]).
solution([a, g]).
solution([a, d]).
solution([n, v]).
solution([n, g]).
solution([n, d]).
solution([v, g]).
solution([v, d]).
solution([g, d]).
solution([a, n, v]).
solution([a, n, g]).
solution([a, n, d]).
solution([a, v, g]).
solution([a, v, d]).
solution([a, g, d]).
solution([n, v, g]).
solution([n, v, d]).
solution([n, g, d]).
solution([v, g, d]).
solution([a, n, v, g]).
solution([a, n, v, d]).
solution([a, n, g, d]).
solution([a, v, g, d]).
solution([n, v, g, d]).
solution([a, n, v, g, d]).

write_list([]).
write_list([H|T]) :-
    write_person(H),
    write(" "),
    write_list(T).

write_person(a) :- write("Andrey").
write_person(n) :- write("Nikolay").
write_person(v) :- write("Viktor").
write_person(g) :- write("Grigoriy").
write_person(d) :- write("Dmitriy").

% Предикат для поиска и вывода всех решений
solve :-
    solution(List),
    condition1(List),
    condition2(List),
    condition3(List),
    condition4(List),
    condition5(List),
    condition6(List),
    write("Sostav: "),
    write_list(List),
    nl,
    fail.
solve.

GOAL
    write("=== SOSTAV ==="), nl, nl,
    solve.
