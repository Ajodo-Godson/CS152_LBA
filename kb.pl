%  Tell prolog that known/3 and multivalued/1 will be added later
:- dynamic known/3, multivalued/1.

% Enter your KB below this line:
%%%% Add in your rules here %%%

restaurant('Punjab') :- cuisine(indian).

restaurant('Fes') :- cuisine(turkish), distance(midrange), price(moderate), \+spicy(tolerated), \+dietary(vegan), time(lunch), \+takeaway(available), card(accepted), rating(high).
restaurant('Fes') :- cuisine(turkish), distance(midrange), price(moderate), \+spicy(tolerated), \+dietary(vegan), time(dinner), \+takeaway(available), card(accepted), rating(high).

restaurant('Meliz Palast') :- cuisine(turkish), distance(midrange), price(moderate), \+spicy(tolerated), \+dietary(vegan), time(lunch), \+takeaway(available), card(accepted), rating(moderate).
restaurant('Meliz Palast') :- cuisine(turkish), distance(midrange), price(moderate), \+spicy(tolerated), \+dietary(vegan), time(dinner), \+takeaway(available), card(accepted), rating(moderate).

restaurant('Simitdchi Cafe') :- cuisine(turkish), distance(midrange), price(moderate), \+spicy(tolerated), \+dietary(vegan), time(lunch), \+takeaway(available), card(accepted), rating(low).
restaurant('Simitdchi Cafe') :- cuisine(turkish), distance(midrange), price(moderate), \+spicy(tolerated), \+dietary(vegan), time(dinner), \+takeaway(available), card(accepted), rating(low).

restaurant('Keke Kebap') :- cuisine(turkish), distance(midrange), price(moderate), \+spicy(tolerated), \+dietary(vegan), time(lunch), takeaway(available), \+card(accepted).
restaurant('Keke Kebap') :- cuisine(turkish), distance(midrange), price(moderate), \+spicy(tolerated), \+dietary(vegan), time(dinner), takeaway(available), \+card(accepted).

restaurant('Ocakbasi') :- cuisine(turkish), distance(midrange), price(moderate), \+spicy(tolerated), \+dietary(vegan), time(lunch), takeaway(available), card(accepted).
restaurant('Ocakbasi') :- cuisine(turkish), distance(midrange), price(moderate), \+spicy(tolerated), \+dietary(vegan), time(dinner), takeaway(available), card(accepted).

restaurant('Doner box') :- cuisine(turkish), distance(close), price(cheap), time(lunch), dietary(halal), takeaway(available), rating(high).
restaurant('Doner box') :- cuisine(turkish), distance(close), price(cheap), time(dinner), dietary(halal), takeaway(available), rating(high).

restaurant('Doyum') :- cuisine(turkish), distance(midrange), price(cheap), dietary(halal), time(breakfast), takeaway(available), card(accepted), rating(high).
restaurant('Doyum') :- cuisine(turkish), distance(midrange), price(cheap), dietary(halal), time(lunch), takeaway(available), card(accepted), rating(high).
restaurant('Doyum') :- cuisine(turkish), distance(midrange), price(cheap), dietary(halal), time(dinner), takeaway(available), card(accepted), rating(high).

restaurant('Kimchi Princess') :- cuisine(korean), distance(close), price(cheap), spicy(tolerated).

restaurant('Chikogi') :- cuisine(korean), distance(close), price(cheap), \+spicy(tolerated).

restaurant('Lasan') :- cuisine(iraq_kurdish), distance(close), price(cheap), dietary(halal), time(breakfast), takeaway(available), card(accepted), rating(moderate).
restaurant('Lasan') :- cuisine(iraq_kurdish), distance(close), price(cheap), dietary(halal), time(lunch), takeaway(available), card(accepted), rating(moderate).
restaurant('Lasan') :- cuisine(iraq_kurdish), distance(close), price(cheap), dietary(halal), time(dinner), takeaway(available), card(accepted), rating(moderate).

restaurant('Schwarzwaldstuben') :- cuisine(german), distance(far), price(moderate), \+spicy(tolerated), \+dietary(vegan).

restaurant('Fosters') :- cuisine(german), distance(far), price(moderate), \+spicy(tolerated), dietary(vegan).

restaurant('Obermaier') :- cuisine(german), distance(midrange), price(cheap), \+spicy(tolerated), \+dietary(vegan), time(dinner).

restaurant('Heisser Hobel') :- cuisine(german), distance(midrange), price(cheap), \+spicy(tolerated), \+dietary(vegan), time(breakfast).
restaurant('Heisser Hobel') :- cuisine(german), distance(midrange), price(cheap), \+spicy(tolerated), \+dietary(vegan), time(lunch).

restaurant('Rotisserie Weingrun') :- cuisine(german), distance(close), price(expensive).

restaurant('3 Sisters') :- cuisine(german), distance(close), price(moderate).

restaurant('Wurstpate') :- cuisine(german), distance(close), price(cheap).

restaurant('Gaststatte') :- cuisine(german), distance(close), price(cheap), time(lunch), card(accepted), takeaway(available), rating(moderate).
restaurant('Gaststatte') :- cuisine(german), distance(close), price(cheap), time(dinner), card(accepted), takeaway(available), rating(moderate).

restaurant('Suboclub'):- cuisine(vietnamese), distance(far), time(lunch), card(accepted), takeaway(available), rating(high).
restaurant('Suboclub'):- cuisine(vietnamese), distance(far), time(dinner), card(accepted), takeaway(available), rating(high).

restaurant('Punjab') :- cuisine(indian), distance(midrange), price(cheap), spicy(tolerated), time(lunch), takeaway(available), rating(moderate).

restaurant('Zakis') :- cuisine(italian), distance(midrange), price(moderate), time(lunch), takeaway(available), rating(moderate).

restaurant('Chicha') :- cuisine(peruvian), distance(midrange), price(expensive), dietary(pescovegetarian), time(dinner), card(accepted), rating(moderate).

restaurant('Mishba') :- cuisine(mexican), distance(midrange), price(cheap), spicy(tolerated), time(lunch), card(accepted), rating(moderate).

restaurant('Xinh') :- cuisine(vietnamese), distance(far), price(moderate), spicy(tolerated), time(lunch), takeaway(available), card(accepted), rating(high).

% The code below implements the prompting to ask the user:
%%%% Add in your askables here %%%%
cuisine(X):- menuask(cuisine, X, [korean, vietnamese, german, turkish, iraq_kurdish, indian, italian, peruvian, mexican]).
distance(X):- menuask(distance, X, [close, midrange, far]).
price(X) :- ask(price, X).
spicy(X) :- ask(spicy, X).
time(X) :- ask(time, X).
dietary(X) :- menuask(dietary, X, [halal, vegan, pescovegetarian]).
takeaway(X) :- ask(takeaway, X).
card(X) :- ask(card, X).
rating(X) :- ask(rating, X).

% Asking clauses for yes/no questions

ask(A, V):-
known(yes, A, V), % succeed if true

!.	% stop looking

ask(A, V):-
known(_, A, V), % fail if false
!, fail.

% If not multivalued, and already known, don't ask again for a different value.
ask(A, V):-
\+multivalued(A),
known(yes, A, V2),
V \== V2,
!.

ask(A, V):-
read_py(A,V,Y), % get the answer
asserta(known(Y, A, V)), % remember it
write_py(known(Y, A, V)),
Y == yes.	% succeed or fail


menuask(A, V, _):-
known(yes, A, V), % succeed if true
!.	% stop looking

menuask(A, V, _):-
known(yes, A, V2), % If already known, don't ask again for a different value.
V \== V2,
!,
fail.

menuask(A, V, MenuList) :-
 read_py_menu(A, X, MenuList),
 check_val(X, A, V, MenuList),
 asserta( known(yes, A, X) ),
 X == V.
check_val(X, _, _, MenuList) :-
 member(X, MenuList),
 !.
check_val(X, A, V, MenuList) :-
 write_py(X), write_py(' is not a legal value, try again.'), nl,
 menuask(A, V, MenuList).

