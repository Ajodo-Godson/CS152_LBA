%  Tell prolog that known/3 and multivalued/1 will be added later
:- dynamic known/3, multivalued/1.

% Enter your KB below this line:
%%%% Add in your rules here %%%

restaurant('Chikogi') :- cuisine(korean), time(lunch); cuisine(korean), time(dinner), \+spicy(tolerated).
restaurant('Kimchi Princess') :- cuisine(korean), time(dinner), spicy(tolerated).
restaurant('Lasan') :- cuisine(iraqi).
restaurant('SuBoclub') :- cuisine(vietnamese), time(breakfast); cuisine(vietnamese), time(lunch).
restaurant('Xinh Xinh') :- cuisine(vietnamese), time(dinner).
restaurant('Zaki’s Pizza') :- cuisine(italian).
restaurant('Chicha') :- cuisine(peruvian).
restaurant('Mishba') :- cuisine(mexican).
restaurant('Punjab') :- cuisine(indian).
restaurant('Heisser Hobel') :- cuisine(german), time(lunch), price(cheap), distance(midrange).
restaurant('Gaststatte Berliner Wappen') :- cuisine(german), time(lunch), price(cheap), distance(close), rating(moderate); cuisine(german), time(dinner), price(cheap), rating(moderate).
restaurant('Wurstpate') :- cuisine(german), time(lunch), price(cheap), distance(close), rating(high); cuisine(german), time(dinner), price(cheap), rating(high).
restaurant('3 sisters') :- cuisine(german), time(lunch), price(moderate), distance(close); cuisine(german), time(dinner), price(moderate), distance(close).
restaurant('Forsters') :- cuisine(german), time(lunch), price(moderate), distance(far), rating(high); cuisine(german), time(dinner), price(moderate), distance(far), rating(high), takeaway(available).
restaurant('Maultaschen Manufaktur') :- cuisine(german), time(dinner), price(moderate), distance(far), rating(high), \+takeaway(available).
restaurant('Schwarzwaldstuben') :- cuisine(german), time(lunch), price(moderate), distance(far), rating(moderate); cuisine(german), time(dinner), price(moderate), distance(far), rating(moderate).
restaurant('Rotisserie Weingrun') :- cuisine(german), time(dinner), price(expensive).
restaurant('Obermaier') :- cuisine(german), time(dinner), price(moderate), distance(midrange).
restaurant('Doner Box') :- cuisine(turkish), time(lunch), price(cheap), distance(close).
restaurant('Doyum Restuarant') :- cuisine(turkish), time(breakfast), price(cheap), card(accepted); cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan), card(accepted); cuisine(turkish), time(dinner), price(cheap), \+dietary(vegan), card(accepted).
restaurant('Ocakbasi') :- cuisine(turkish), time(lunch), price(moderate), rating(low); cuisine(turkish), time(dinner), price(moderate), rating(low).
restaurant('Keke Kebap') :- cuisine(turkish), time(breakfast), price(cheap), \+card(accepted); cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan), \+card(accepted); cuisine(turkish), time(dinner), price(cheap), \+dietary(vegan), \+card(accepted).
restaurant('Simitdchi Cafe') :- cuisine(turkish), time(breakfast), price(moderate); cuisine(turkish), time(lunch), price(moderate), rating(moderate); cuisine(turkish), time(dinner), price(moderate), rating(moderate).
restaurant('Meliz Palast') :- cuisine(turkish), time(lunch), price(cheap), distance(midrange), dietary(vegan); cuisine(turkish), time(dinner), price(cheap), dietary(vegan).

% The askables and menu-asks below are implemented to prompt the user about its preferences and constraints:
%%%% The askables are added as rules to the KB %%%%
cuisine(X):- menuask(cuisine, X, [korean, italian, german, turkish, vietnamese, iraqi, peruvian, mexican, indian]).
distance(X):- menuask(distance, X, [close, midrange, far]).
price(X) :- menuask(price, X, [cheap, moderate, expensive]).
spicy(X) :- ask(spicy, X).
dietary(X) :- ask(dietary, X).
time(X) :- menuask(time, X, [breakfast, lunch, dinner]).
takeaway(X) :- ask(takeaway, X).
card(X) :- ask(card, X).
rating(X) :- menuask(rating, X, [low, moderate, high]).



% Asking clauses for yes/no questions


% The following clauses construct the logical structure of the askables

ask(A, V):-
    known(yes, A, V), % Succeeds if it is true
    !.	% Stops looking

ask(A, V):-
    known(_, A, V), % Fails if False
    !, fail.

% Ensures that an askable predicate cannot take more than one value, so, if it already knows to be something else, don't ask again for a different value.
ask(A, V):-
    \+multivalued(A),
    known(yes, A, V2),
    V \== V2,
    !, fail.


ask(A, V):-
    read_py(A,V,Y), % Calls read_py for attribute A and variable V trying to match Y = yes
    assertz(known(Y, A, V)), % Add the information into the KB
    Y == yes.	% Succeeds or Fails

ask(A, V):-
    read_py(A,V,Y), % get the answer
    assertz(known(Y, A, V)), % remember it
    write_py(known(Y, A, V)),
    Y == yes.	% succeed or fail
menuask(A, V, _):-
known(yes, A, V), % Succeeds if true
!.	% Stops looking

menuask(A, V, _):-
known(_, A, V), % Fails if False
!, fail.

menuask(A, V, _):-
    \+multivalued(A),
    known(yes, A, V2),
    V \== V2,
    !, fail.




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

% DCG rules for constructing questions
question(cuisine) --> ["What cuisine are you in the mood for?"].
question(distance) --> ["How far are you willing to travel for your meal?"].
question(price) --> ["What is your budget for the meal?"].
question(spicy) --> ["Do you prefer spicy food?"].
question(dietary) --> ["Do you prefer vegan food?"].
question(time) --> ["What time are you planning to have the meal?"].
question(takeaway) --> ["Are you looking for a takeaway option?"].
question(card) --> ["Do you need a place that accepts cards?"].
question(rating) --> ["What rating do you want the restaurant to be?"].

% Predicate to generate question text using DCG
generate_question(Attribute, QuestionText) :-
    phrase(question(Attribute), QuestionList),
    atomic_list_concat(QuestionList, ' ', QuestionText).