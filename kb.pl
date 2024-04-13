%  Tell prolog that known/3 and multivalued/1 will be added later
:- dynamic known/3, multivalued/1.

% Enter your KB below this line:
%%%% Add in your rules here %%%


restaurant('Chikogi') :- cuisine(korean), time(lunch).
restaurant('Chikogi') :- cuisine(korean), time(dinner), \+spicy(tolerated).
restaurant('Kimchi Princess') :- cuisine(korean), time(dinner), spicy(tolerated).
restaurant('Lasan') :- cuisine(iraqi).
restaurant('SuBoclub') :- cuisine(vietnamese), time(breakfast).
restaurant('SuBoclub') :- cuisine(vietnamese), time(lunch).
restaurant('Xinh Xinh') :- cuisine(vietnamese), time(dinner).
restaurant('Zakis Pizza') :- cuisine(italian).
restaurant('Chicha') :- cuisine(peruvian).
restaurant('Mishba') :- cuisine(mexican).
restaurant('Punjab') :- cuisine(indian).
restaurant('Heisser Hobel') :- cuisine(german), time(lunch), price(cheap), distance(midrange).
restaurant('Gaststatte Berliner Wappen') :- cuisine(german), time(lunch), price(cheap), distance(close), rating(moderate).
restaurant('Gaststatte Berliner Wappen') :- cuisine(german), time(dinner), price(cheap), rating(moderate).
restaurant('Wurstpate') :- cuisine(german), time(lunch), price(cheap), distance(close), rating(high).
restaurant('Wurstpate') :- cuisine(german), time(dinner), price(cheap), rating(high).
restaurant('3 sisters') :- cuisine(german), time(lunch), price(moderate), distance(close).
restaurant('3 sisters') :- cuisine(german), time(dinner), price(moderate), distance(close).
restaurant('Forsters') :- cuisine(german), time(lunch), price(moderate), distance(far), rating(high).
restaurant('Forsters') :- cuisine(german), time(dinner), price(moderate), distance(far), rating(high), takeaway(available).
restaurant('Maultaschen Manufaktur') :- cuisine(german), time(dinner), price(moderate), distance(far), rating(high), \+takeaway(available).
restaurant('Schwarzwaldstuben') :- cuisine(german), time(lunch), price(moderate), distance(far), rating(moderate).
restaurant('Schwarzwaldstuben') :- cuisine(german), time(dinner), price(moderate), distance(far), rating(moderate).
restaurant('Rotisserie Weingrun') :- cuisine(german), time(dinner), price(expensive).
restaurant('Obermaier') :- cuisine(german), time(dinner), price(moderate), distance(midrange).
restaurant('Doner Box') :- cuisine(turkish), time(lunch), price(cheap), distance(close).
restaurant('Doyum Restuarant') :- cuisine(turkish), time(breakfast), price(cheap), card(accepted).
restaurant('Doyum Restuarant') :- cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Doyum Restuarant') :- cuisine(turkish), time(dinner), price(cheap), \+dietary(vegan), card(accepted).
restaurant('Ocakbasi') :- cuisine(turkish), time(lunch), price(moderate), rating(low).
restaurant('Ocakbasi') :- cuisine(turkish), time(dinner), price(moderate), rating(low).
restaurant('Keke Kebap') :- cuisine(turkish), time(breakfast), price(cheap), \+card(accepted).
restaurant('Keke Kebap') :- cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Keke Kebap') :- cuisine(turkish), time(dinner), price(cheap), \+dietary(vegan), \+card(accepted).
restaurant('Simitdchi Cafe') :- cuisine(turkish), time(breakfast), price(moderate).
restaurant('Simitdchi Cafe') :- cuisine(turkish), time(lunch), price(moderate), rating(moderate).
restaurant('Simitdchi Cafe') :- cuisine(turkish), time(dinner), price(moderate), rating(moderate).
restaurant('Meliz Palast') :- cuisine(turkish), time(lunch), price(cheap), distance(midrange), dietary(vegan).
restaurant('Meliz Palast') :- cuisine(turkish), time(dinner), price(cheap), dietary(vegan).

% The askables and menu-asks below are implemented to prompt the user about its preferences and constraints:
%%%% The askables are added as rules to the KB %%%%
preference(X) :- menuask(preference, X, [distance, price, dietary, rating, takeaway, payment, none]).
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

% DCG rules for constructing questions
question(preference) --> ["Do you have any preference for one of the following characteristics of the restaurant?"].
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