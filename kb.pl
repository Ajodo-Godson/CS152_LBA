%  Tell prolog that known/3 and multivalued/1 will be added later
:- dynamic known/3, multivalued/1.

% Enter your KB below this line:
%%%% Add in your rules here %%%

% Preference = none:
restaurant('Chikogi') :- preference(none), cuisine(korean), time(lunch).
restaurant('Chikogi') :- preference(none), cuisine(korean), time(dinner), \+spicy(tolerated).
restaurant('Kimchi Princess') :- preference(none), cuisine(korean), time(diner).
restaurant('Lasan') :- preference(none), cuisine(iraqi).
restaurant('SuBoclub') :- preference(none), cuisine(vietnamese), time(breakfast).
restaurant('SuBoclub') :- preference(none), cuisine(vietanamese), time(lunch).
restaurant('Xinh Xinh') :- preference(none), cuisine(vietnamese), time(dinner).
restaurant('Zaki Pizza') :- preference(none), cuisine(italian).
restaurant('Chicha') :- preference(none), cuisine(peruvian).
restaurant('Mishba') :- preference(none), cuisine(mexican).
restaurant('Punjab') :- preference(none), cuisine(indian).
restaurant('Heisser Hobel') :- preference(none), cuisine(german), time(lunch), price(cheap), distance(midrange).
restaurant('Gaststatte Berliner Wappen') :- preference(none), cuisine(german), time(lunch), price(cheap), distance(close), rating(moderate).
restaurant('Gaststatte Berliner Wappen') :- preference(none), cuisine(german), time(dinner), price(cheap), distance(close), rating(moderate).
restaurant('Wurstpate') :- preference(none), cuisine(german), time(lunch), price(cheap), distance(close), rating(high).
restaurant('Wurstpate') :- preference(none), cuisine(german), time(dinner), price(cheap), distance(close), rating(high).
restaurant('3 sisters') :- preference(none), cuisine(german), time(lunch), price(moderate), distance(close).
restaurant('3 sisters') :- preference(none), cuisine(german), time(dinner), price(moderate), distance(close).
restaurant('Forsters') :- preference(none), cuisine(german), time(lunch), price(moderate), distance(far), rating(high), takeaway(available).
restaurant('Forsters') :- preference(none), cuisine(german), time(dinner), price(moderate), distance(far), rating(high), takeaway(available).
restaurant('Maultaschen Manufaktur') :- preference(none), cuisine(german), time(dinner), price(moderate), distance(far), rating(high), \+takeaway(available).
restaurant('Schwarzwaldstuben') :- preference(none), cuisine(german), time(lunch), price(moderate), distance(far), rating(moderate).
restaurant('Schwarzwaldstuben') :- preference(none), cuisine(german), time(dinner), price(moderate), distance(far), rating(moderate).
restaurant('Rotisserie Weingrun') :- preference(none), cuisine(german), time(dinner), price(expensive).
restaurant('Obermaier') :- preference(none), cuisine(german), time(dinner), price(moderate), distance(midrange).
restaurant('Doner Box') :- preference(none), cuisine(turkish), time(lunch), price(cheap), distance(close).
restaurant('Doyum Restuarant') :- preference(none), cuisine(turkish), time(breakfast), price(cheap), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Doyum Restuarant') :- preference(none), cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Doyum Restuarant') :- preference(none), cuisine(turkish), time(dinner), price(cheap), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Ocakbasi') :- preference(none), cuisine(turkish), time(lunch), price(moderate), rating(low).
restaurant('Ocakbasi') :- preference(none), cuisine(turkish), time(dinner), price(moderate), rating(low).
restaurant('Keke Kebap') :- preference(none), cuisine(turkish), time(breakfast), price(cheap), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Keke Kebap') :- preference(none), cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Keke Kebap') :- preference(none), cuisine(turkish), time(dinner), price(cheap), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Simitdchi Cafe') :- preference(none), cuisine(turkish), time(breakfast), price(moderate), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(none), cuisine(turkish), time(lunch), price(moderate), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(none), cuisine(turkish), time(diner), price(moderate), rating(moderate).
restaurant('Meliz Palast') :- preference(none), cuisine(turkish), time(lunch), price(cheap), distance(midrange), dietary(vegan).
restaurant('Meliz Palast') :- preference(none), cuisine(turkish), time(dinner), price(cheap), distance(midrange), dietary(vegan).

% Preference = distance:
restaurant('Chikogi') :- preference(distance), distance(close), cuisine(korean), time(lunch).
restaurant('Chikogi') :- preference(distance), distance(close), cuisine(korean), time(dinner), \+spicy(tolerated).
restaurant('Kimchi Princess') :- preference(distance), distance(close), cuisine(korean), time(diner).
restaurant('Lasan') :- preference(distance), distance(close), cuisine(iraqi).
restaurant('SuBoclub') :- preference(distance), distance(far), cuisine(vietnamese), time(breakfast).
restaurant('SuBoclub') :- preference(distance), distance(far), cuisine(vietanamese), time(lunch).
restaurant('Xinh Xinh') :- preference(distance), distance(far), cuisine(vietnamese), time(dinner).
restaurant('Zaki Pizza') :- preference(distance), distance(midrange), cuisine(italian).
restaurant('Chicha') :- preference(distance), distance(midrange), cuisine(peruvian).
restaurant('Mishba') :- preference(distance), distance(midrange), cuisine(mexican).
restaurant('Punjab') :- preference(distance), distance(midrange), cuisine(indian).
restaurant('Heisser Hobel') :- preference(distance), distance(midrange), cuisine(german), time(lunch), price(cheap).
restaurant('Gaststatte Berliner Wappen') :- preference(distance), distance(close), cuisine(german), time(lunch), price(cheap), rating(moderate).
restaurant('Gaststatte Berliner Wappen') :- preference(distance), distance(close), cuisine(german), time(dinner), price(cheap), rating(moderate).
restaurant('Wurstpate') :- preference(distance), distance(close), cuisine(german), time(lunch), price(cheap), rating(high).
restaurant('Wurstpate') :- preference(distance),  distance(close), cuisine(german), time(dinner), price(cheap), rating(high).
restaurant('3 sisters') :- preference(distance), distance(close), cuisine(german), time(lunch), price(moderate).
restaurant('3 sisters') :- preference(distance), distance(close), cuisine(german), time(dinner), price(moderate), distance(close).
restaurant('Forsters') :- preference(distance), distance(far), cuisine(german), time(lunch), price(moderate), rating(high), takeaway(available).
restaurant('Forsters') :- preference(distance), distance(far), cuisine(german), time(dinner), price(moderate), rating(high), takeaway(available).
restaurant('Maultaschen Manufaktur') :- preference(distance), distance(far), cuisine(german), time(dinner), price(moderate), rating(high), \+takeaway(available).
restaurant('Schwarzwaldstuben') :- preference(distance), distance(far), cuisine(german), time(lunch), price(moderate), rating(moderate).
restaurant('Schwarzwaldstuben') :- preference(distance), distance(far), cuisine(german), time(dinner), price(moderate), rating(moderate).
restaurant('Rotisserie Weingrun') :- preference(distance), distance(close), cuisine(german), time(dinner), price(expensive).
restaurant('Obermaier') :- preference(distance), distance(midrange), cuisine(german), time(dinner), price(moderate).
restaurant('Doner Box') :- preference(distance), distance(close), cuisine(turkish), time(lunch), price(cheap).
restaurant('Doyum Restuarant') :- preference(distance), distance(midrange), cuisine(turkish), time(breakfast), price(cheap), \+dietary(vegan), card(accepted).
restaurant('Doyum Restuarant') :- preference(distance), distance(midrange), cuisine(turkish), time(lunch), price(cheap), \+dietary(vegan), card(accepted).
restaurant('Doyum Restuarant') :- preference(distance), distance(midrange), cuisine(turkish), time(dinner), price(cheap), \+dietary(vegan), card(accepted).
restaurant('Ocakbasi') :- preference(distance), distance(midrange), cuisine(turkish), time(lunch), price(moderate), rating(low).
restaurant('Ocakbasi') :- preference(distance), distance(midrange), cuisine(turkish), time(dinner), price(moderate), rating(low).
restaurant('Keke Kebap') :- preference(distance), distance(midrange), cuisine(turkish), time(breakfast), price(cheap), \+dietary(vegan), \+card(accepted).
restaurant('Keke Kebap') :- preference(distance), distance(midrange), cuisine(turkish), time(lunch), price(cheap), \+dietary(vegan), \+card(accepted).
restaurant('Keke Kebap') :- preference(distance), distance(midrange), cuisine(turkish), time(dinner), price(cheap), \+dietary(vegan), \+card(accepted).
restaurant('Simitdchi Cafe') :- preference(distance), distance(midrange), cuisine(turkish), time(breakfast), price(moderate), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(distance), distance(midrange), cuisine(turkish), time(lunch), price(moderate), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(distance), distance(midrange), cuisine(turkish), time(diner), price(moderate), rating(moderate).
restaurant('Meliz Palast') :- preference(distance), distance(midrange), cuisine(turkish), time(lunch), price(cheap),dietary(vegan).
restaurant('Meliz Palast') :- preference(distance), cuisine(turkish), time(dinner), price(cheap), distance(midrange), dietary(vegan).

% Preference = price:
restaurant('Chikogi') :- preference(price), price(moderate), cuisine(korean), time(lunch).
restaurant('Chikogi') :- preference(price), price(moderate), cuisine(korean), time(dinner), \+spicy(tolerated).
restaurant('Kimchi Princess') :- preference(price), price(moderate), cuisine(korean), time(diner).
restaurant('Lasan') :- preference(price), price(cheap), cuisine(iraqi).
restaurant('SuBoclub') :- preference(price), price(moderate), cuisine(vietnamese), time(breakfast).
restaurant('SuBoclub') :- preference(price), price(moderate), cuisine(vietanamese), time(lunch).
restaurant('Xinh Xinh') :- preference(price), price(moderate), cuisine(vietnamese), time(dinner).
restaurant('Zaki Pizza') :- preference(price), price(moderate), cuisine(italian).
restaurant('Chicha') :- preference(price), price(moderate), cuisine(peruvian).
restaurant('Mishba') :- preference(price), price(moderate), cuisine(mexican).
restaurant('Punjab') :- preference(price), price(moderate), cuisine(indian).
restaurant('Heisser Hobel') :- preference(price), price(cheap), cuisine(german), time(lunch), distance(midrange).
restaurant('Gaststatte Berliner Wappen') :- preference(price), price(cheap), cuisine(german), time(lunch), distance(close), rating(moderate).
restaurant('Gaststatte Berliner Wappen') :- preference(price), price(cheap), cuisine(german), time(dinner), distance(close), rating(moderate).
restaurant('Wurstpate') :- preference(price), price(cheap), cuisine(german), time(lunch), distance(close), rating(high).
restaurant('Wurstpate') :- preference(price), price(cheap), cuisine(german), time(dinner), distance(close), rating(high).
restaurant('3 sisters') :- preference(price), price(moderate), cuisine(german), time(lunch), distance(close).
restaurant('3 sisters') :- preference(price), price(moderate), cuisine(german), time(dinner), distance(close).
restaurant('Forsters') :- preference(price), price(moderate), cuisine(german), time(lunch), distance(far), rating(high), takeaway(available).
restaurant('Forsters') :-preference(price), price(moderate), cuisine(german), time(dinner), distance(far), rating(high), takeaway(available).
restaurant('Maultaschen Manufaktur') :- preference(price), price(moderate), cuisine(german), time(dinner), distance(far), rating(high), \+takeaway(available).
restaurant('Schwarzwaldstuben') :- preference(price), price(moderate), cuisine(german), time(lunch), distance(far), rating(moderate).
restaurant('Schwarzwaldstuben') :- preference(price), price(moderate), cuisine(german), time(dinner), distance(far), rating(moderate).
restaurant('Rotisserie Weingrun') :- preference(price), price(expensive), cuisine(german), time(dinner).
restaurant('Obermaier') :- preference(price), price(moderate), cuisine(german), time(dinner), distance(midrange).
restaurant('Doner Box') :- preference(price), price(cheap), cuisine(turkish), time(lunch), distance(close).
restaurant('Doyum Restuarant') :- preference(price), price(cheap), cuisine(turkish), time(breakfast), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Doyum Restuarant') :- preference(price), price(cheap), cuisine(turkish), time(lunch), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Doyum Restuarant') :- preference(price), price(cheap), cuisine(turkish), time(dinner), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Ocakbasi') :- preference(price), price(moderate), cuisine(turkish), time(lunch), rating(low).
restaurant('Ocakbasi') :- preference(price), price(moderate), cuisine(turkish), time(dinner), rating(low).
restaurant('Keke Kebap') :- preference(price), price(cheap), cuisine(turkish), time(breakfast), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Keke Kebap') :- preference(price), price(cheap), cuisine(turkish), time(lunch), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Keke Kebap') :- preference(price), price(cheap), cuisine(turkish), time(dinner), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Simitdchi Cafe') :- preference(price), price(moderate), cuisine(turkish), time(breakfast), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(price), price(moderate), cuisine(turkish), time(lunch), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(price), price(moderate), cuisine(turkish), time(diner), rating(moderate).
restaurant('Meliz Palast') :- preference(price), price(cheap), cuisine(turkish), time(lunch), distance(midrange), dietary(vegan).
restaurant('Meliz Palast') :- preference(price), price(cheap), cuisine(turkish), time(dinner), distance(midrange), dietary(vegan).

% Preference = dietary:
restaurant('Chikogi') :- preference(dietary), \+dietary(vegan), cuisine(korean), time(lunch).
restaurant('Chikogi') :- preference(dietary), \+dietary(vegan), cuisine(korean), time(dinner), \+spicy(tolerated).
restaurant('Kimchi Princess') :- preference(dietary), \+dietary(vegan), cuisine(korean), time(diner).
restaurant('Lasan') :- preference(dietary), dietary(vegan), cuisine(iraqi).
restaurant('SuBoclub') :- preference(dietary), \+dietary(vegan), cuisine(vietnamese), time(breakfast).
restaurant('SuBoclub') :- preference(dietary), \+dietary(vegan), cuisine(vietanamese), time(lunch).
restaurant('Xinh Xinh') :- preference(dietary), \+dietary(vegan), cuisine(vietnamese), time(dinner).
restaurant('Zaki Pizza') :- preference(dietary), \+dietary(vegan), cuisine(italian).
restaurant('Chicha') :- preference(dietary), \+dietary(vegan), cuisine(peruvian).
restaurant('Mishba') :- preference(dietary), dietary(vegan), cuisine(mexican).
restaurant('Punjab') :- preference(dietary), \+dietary(vegan), cuisine(indian).
restaurant('Heisser Hobel') :- preference(dietary), \+dietary(vegan), cuisine(german), time(lunch), price(cheap), distance(midrange).
restaurant('Gaststatte Berliner Wappen') :- preference(dietary), \+dietary(vegan), cuisine(german), time(lunch), price(cheap), distance(close), rating(moderate).
restaurant('Gaststatte Berliner Wappen') :- preference(dietary), \+dietary(vegan), cuisine(german), time(dinner), price(cheap), distance(close), rating(moderate).
restaurant('Wurstpate') :- preference(dietary), \+dietary(vegan), cuisine(german), time(lunch), price(cheap), distance(close), rating(high).
restaurant('Wurstpate') :- preference(dietary), \+dietary(vegan), cuisine(german), time(dinner), price(cheap), distance(close), rating(high).
restaurant('3 sisters') :- preference(dietary), dietary(vegan), cuisine(german), time(lunch), price(moderate), distance(close).
restaurant('3 sisters') :- preference(dietary), dietary(vegan), cuisine(german), time(dinner), price(moderate), distance(close).
restaurant('Forsters') :- preference(dietary), dietary(vegan), cuisine(german), time(lunch), price(moderate), distance(far), rating(high), takeaway(available).
restaurant('Forsters') :- preference(dietary), dietary(vegan), cuisine(german), time(dinner), price(moderate), distance(far), rating(high), takeaway(available).
restaurant('Maultaschen Manufaktur') :- preference(dietary), dietary(vegan), cuisine(german), time(dinner), price(moderate), distance(far), rating(high), \+takeaway(available).
restaurant('Schwarzwaldstuben') :- preference(dietary), \+dietary(vegan), cuisine(german), time(lunch), price(moderate), distance(far), rating(moderate).
restaurant('Schwarzwaldstuben') :- preference(dietary), \+dietary(vegan), cuisine(german), time(dinner), price(moderate), distance(far), rating(moderate).
restaurant('Rotisserie Weingrun') :- preference(dietary), \+dietary(vegan), cuisine(german), time(dinner), price(expensive).
restaurant('Obermaier') :- preference(dietary), dietary(vegan), cuisine(german), time(dinner), price(moderate), distance(midrange).
restaurant('Doner Box') :- preference(dietary), \+dietary(vegan), cuisine(turkish), time(lunch), price(cheap), distance(close).
restaurant('Doyum Restuarant') :- preference(dietary), \+dietary(vegan), cuisine(turkish), time(breakfast), price(cheap), distance(midrange), card(accepted).
restaurant('Doyum Restuarant') :- preference(dietary), \+dietary(vegan), cuisine(turkish), time(lunch), price(cheap), distance(midrange), card(accepted).
restaurant('Doyum Restuarant') :- preference(dietary), \+dietary(vegan), cuisine(turkish), time(dinner), price(cheap), distance(midrange), card(accepted).
restaurant('Ocakbasi') :- preference(dietary), \+dietary(vegan), cuisine(turkish), time(lunch), price(moderate), rating(low).
restaurant('Ocakbasi') :- preference(dietary), \+dietary(vegan), cuisine(turkish), time(dinner), price(moderate), rating(low).
restaurant('Keke Kebap') :- preference(dietary), \+dietary(vegan), cuisine(turkish), time(breakfast), price(cheap), distance(midrange), \+card(accepted).
restaurant('Keke Kebap') :- preference(dietary), \+dietary(vegan), cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+card(accepted).
restaurant('Keke Kebap') :- preference(dietary), \+dietary(vegan), cuisine(turkish), time(dinner), price(cheap), distance(midrange), \+card(accepted).
restaurant('Simitdchi Cafe') :- preference(dietary), dietary(vegan), cuisine(turkish), time(breakfast), price(moderate), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(dietary), dietary(vegan), cuisine(turkish), time(lunch), price(moderate), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(dietary), dietary(vegan), cuisine(turkish), time(diner), price(moderate), rating(moderate).
restaurant('Meliz Palast') :- preference(dietary), dietary(vegan), cuisine(turkish), time(lunch), price(cheap), distance(midrange).
restaurant('Meliz Palast') :- preference(dietary), dietary(vegan), cuisine(turkish), time(dinner), price(cheap), distance(midrange).

% Preference = rating:
restaurant('Chikogi') :- preference(rating), rating(high), cuisine(korean), time(dinner), \+spicy(tolerated).
restaurant('Kimchi Princess') :- preference(rating), rating(high), cuisine(korean), time(diner).
restaurant('Lasan') :- preference(rating), rating(high), cuisine(iraqi).
restaurant('SuBoclub') :- preference(rating), rating(high), preference(rating), cuisine(vietanamese), time(lunch).
restaurant('Xinh Xinh') :- preference(rating), rating(high), cuisine(vietnamese), time(dinner).
restaurant('Zaki Pizza') :- preference(rating), rating(high), cuisine(italian).
restaurant('Chicha') :- preference(rating), rating(high), cuisine(peruvian).
restaurant('Mishba') :- preference(rating), rating(high), cuisine(mexican).
restaurant('Punjab') :- preference(rating), rating(high), cuisine(indian).
restaurant('Heisser Hobel') :- preference(rating), rating(high), cuisine(german), time(lunch), price(cheap), distance(midrange).
restaurant('Gaststatte Berliner Wappen') :- preference(rating), rating(moderate), cuisine(german), time(lunch), price(cheap), distance(close).
restaurant('Gaststatte Berliner Wappen') :- preference(rating), rating(moderate), cuisine(german), time(dinner), price(cheap), distance(close).
restaurant('Wurstpate') :- preference(rating), rating(high), cuisine(german), time(lunch), price(cheap), distance(close).
restaurant('Wurstpate') :- preference(rating), rating(high), cuisine(german), time(dinner), price(cheap), distance(close).
restaurant('3 sisters') :- preference(rating), rating(moderate), cuisine(german), time(lunch), price(moderate), distance(close).
restaurant('3 sisters') :- preference(rating), rating(moderate), cuisine(german), time(dinner), price(moderate), distance(close).
restaurant('Forsters') :- preference(rating), rating(high), cuisine(german), time(lunch), price(moderate), distance(far), takeaway(available).
restaurant('Forsters') :- preference(rating), rating(high), cuisine(german), time(dinner), price(moderate), distance(far), takeaway(available).
restaurant('Maultaschen Manufaktur') :- preference(rating), rating(high), cuisine(german), time(dinner), price(moderate), distance(far), rating(high), \+takeaway(available).
restaurant('Schwarzwaldstuben') :- preference(rating), rating(moderate), cuisine(german), time(lunch), price(moderate), distance(far).
restaurant('Schwarzwaldstuben') :- preference(rating), rating(moderate), cuisine(german), time(dinner), price(moderate), distance(far).
restaurant('Rotisserie Weingrun') :- preference(rating), rating(high), cuisine(german), time(dinner), price(expensive).
restaurant('Obermaier') :- preference(rating), rating(high), cuisine(german), time(dinner), price(moderate), distance(midrange).
restaurant('Doner Box') :- preference(rating), rating(high), cuisine(turkish), time(lunch), price(cheap), distance(close).
restaurant('Doyum Restuarant') :- preference(rating), rating(high), cuisine(turkish), time(breakfast), price(cheap), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Doyum Restuarant') :- preference(rating), rating(high), cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Doyum Restuarant') :- preference(rating), rating(high), cuisine(turkish), time(dinner), price(cheap), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Ocakbasi') :- preference(rating), rating(low), cuisine(turkish), time(lunch), price(moderate).
restaurant('Ocakbasi') :- preference(rating), rating(low), cuisine(turkish), time(dinner), price(moderate).
restaurant('Keke Kebap') :- preference(rating), rating(high), cuisine(turkish), time(breakfast), price(cheap), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Keke Kebap') :- preference(rating), rating(high), cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Keke Kebap') :- preference(rating), rating(high), cuisine(turkish), time(dinner), price(cheap), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Simitdchi Cafe') :- preference(rating), rating(moderate), cuisine(turkish), time(breakfast), price(moderate).
restaurant('Simitdchi Cafe') :- preference(rating), rating(moderate), cuisine(turkish), time(lunch), price(moderate).
restaurant('Simitdchi Cafe') :- preference(rating), rating(moderate), cuisine(turkish), time(diner), price(moderate).
restaurant('Meliz Palast') :- preference(rating), rating(moderate), cuisine(turkish), time(lunch), price(cheap), distance(midrange), dietary(vegan).
restaurant('Meliz Palast') :- preference(rating), rating(moderate), cuisine(turkish), time(dinner), price(cheap), distance(midrange), dietary(vegan).

% Preference = takeaway:
restaurant('Chikogi') :- preference(takeaway), takeaway(available), cuisine(korean), time(lunch).
restaurant('Chikogi') :- preference(takeaway), takeaway(available), cuisine(korean), time(dinner), \+spicy(tolerated).
restaurant('Kimchi Princess') :- preference(takeaway), takeaway(available), cuisine(korean), time(diner).
restaurant('Lasan') :- preference(takeaway), takeaway(available), cuisine(iraqi).
restaurant('SuBoclub') :- preference(takeaway), takeaway(available), cuisine(vietnamese), time(breakfast).
restaurant('SuBoclub') :- preference(takeaway), takeaway(available), cuisine(vietanamese), time(lunch).
restaurant('Xinh Xinh') :- preference(takeaway), takeaway(available), cuisine(vietnamese), time(dinner).
restaurant('Zaki Pizza') :- preference(takeaway), takeaway(available), cuisine(italian).
restaurant('Chicha') :- preference(takeaway), \+takeaway(available), cuisine(peruvian).
restaurant('Mishba') :- preference(takeaway), \+takeaway(available), cuisine(mexican).
restaurant('Punjab') :- preference(takeaway), takeaway(available), cuisine(indian).
restaurant('Heisser Hobel') :- preference(takeaway), takeaway(available), cuisine(german), time(lunch), price(cheap), distance(midrange).
restaurant('Gaststatte Berliner Wappen') :- preference(takeaway), takeaway(available), cuisine(german), time(lunch), price(cheap), distance(close), rating(moderate).
restaurant('Gaststatte Berliner Wappen') :-preference(takeaway), takeaway(available), cuisine(german), time(dinner), price(cheap), distance(close), rating(moderate).
restaurant('Wurstpate') :- preference(takeaway), takeaway(available), cuisine(german), time(lunch), price(cheap), distance(close), rating(high).
restaurant('Wurstpate') :- preference(takeaway), takeaway(available), cuisine(german), time(dinner), price(cheap), distance(close), rating(high).
restaurant('3 sisters') :- preference(takeaway), \+takeaway(available), cuisine(german), time(lunch), price(moderate), distance(close).
restaurant('3 sisters') :- preference(takeaway), \+takeaway(available), cuisine(german), time(dinner), price(moderate), distance(close).
restaurant('Forsters') :- preference(takeaway), takeaway(available), cuisine(german), time(lunch), price(moderate), distance(far), rating(high).
restaurant('Forsters') :- preference(takeaway), takeaway(available), cuisine(german), time(dinner), price(moderate), distance(far), rating(high).
restaurant('Maultaschen Manufaktur') :- preference(takeaway), \+takeaway(available), cuisine(german), time(dinner), price(moderate), distance(far), rating(high).
restaurant('Schwarzwaldstuben') :- preference(takeaway), takeaway(available), cuisine(german), time(lunch), price(moderate), distance(far), rating(moderate).
restaurant('Schwarzwaldstuben') :- preference(takeaway), takeaway(available), cuisine(german), time(dinner), price(moderate), distance(far), rating(moderate).
restaurant('Rotisserie Weingrun') :- preference(takeaway), takeaway(available), cuisine(german), time(dinner), price(expensive).
restaurant('Obermaier') :- preference(takeaway), takeaway(available), cuisine(german), time(dinner), price(moderate), distance(midrange).
restaurant('Doner Box') :- preference(takeaway), takeaway(available), cuisine(turkish), time(lunch), price(cheap), distance(close).
restaurant('Doyum Restuarant') :- preference(takeaway), takeaway(available), cuisine(turkish), time(breakfast), price(cheap), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Doyum Restuarant') :- preference(takeaway), takeaway(available), cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Doyum Restuarant') :- preference(takeaway), takeaway(available), cuisine(turkish), time(dinner), price(cheap), distance(midrange), \+dietary(vegan), card(accepted).
restaurant('Ocakbasi') :- preference(takeaway), takeaway(available), cuisine(turkish), time(lunch), price(moderate), rating(low).
restaurant('Ocakbasi') :- preference(takeaway), takeaway(available), cuisine(turkish), time(dinner), price(moderate), rating(low).
restaurant('Keke Kebap') :- preference(takeaway), takeaway(available), cuisine(turkish), time(breakfast), price(cheap), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Keke Kebap') :- preference(takeaway), takeaway(available), cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Keke Kebap') :- preference(takeaway), takeaway(available), cuisine(turkish), time(dinner), price(cheap), distance(midrange), \+dietary(vegan), \+card(accepted).
restaurant('Simitdchi Cafe') :- preference(takeaway), takeaway(available), cuisine(turkish), time(breakfast), price(moderate), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(takeaway), takeaway(available), cuisine(turkish), time(lunch), price(moderate), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(takeaway), takeaway(available), cuisine(turkish), time(diner), price(moderate), rating(moderate).
restaurant('Meliz Palast') :- preference(takeaway), takeaway(available), cuisine(turkish), time(lunch), price(cheap), distance(midrange), dietary(vegan).
restaurant('Meliz Palast') :- preference(takeaway), takeaway(available), cuisine(turkish), time(dinner), price(cheap), distance(midrange), dietary(vegan).

% Preference = payment:
restaurant('Chikogi') :- preference(payment), card(accepted), cuisine(korean), time(lunch).
restaurant('Chikogi') :- preference(payment), card(accepted), cuisine(korean), time(dinner), \+spicy(tolerated).
restaurant('Kimchi Princess') :- preference(payment), card(accepted), cuisine(korean), time(diner).
restaurant('Lasan') :- preference(payment), card(accepted), cuisine(iraqi).
restaurant('SuBoclub') :- preference(payment), card(accepted), cuisine(vietnamese), time(breakfast).
restaurant('SuBoclub') :- preference(payment), card(accepted), cuisine(vietanamese), time(lunch).
restaurant('Xinh Xinh') :- preference(payment), card(accepted), cuisine(vietnamese), time(dinner).
restaurant('Zaki Pizza') :- preference(payment), \+card(accepted), cuisine(italian).
restaurant('Chicha') :- preference(payment), \+card(accepted), cuisine(peruvian).
restaurant('Mishba') :- preference(payment), card(accepted), cuisine(mexican).
restaurant('Punjab') :- preference(payment), card(accepted), cuisine(indian).
restaurant('Heisser Hobel') :- preference(payment), \+card(accepted), cuisine(german), time(lunch), price(cheap), distance(midrange).
restaurant('Gaststatte Berliner Wappen') :- preference(payment), card(accepted), cuisine(german), time(lunch), price(cheap), distance(close), rating(moderate).
restaurant('Gaststatte Berliner Wappen') :- preference(payment), card(accepted), cuisine(german), time(dinner), price(cheap), distance(close), rating(moderate).
restaurant('Wurstpate') :- preference(payment), \+card(accepted), cuisine(german), time(lunch), price(cheap), distance(close), rating(high).
restaurant('Wurstpate') :- preference(card), \+card(accepted), cuisine(german), time(dinner), price(cheap), distance(close), rating(high).
restaurant('3 sisters') :- preference(payment), card(accepted), cuisine(german), time(lunch), price(moderate), distance(close).
restaurant('3 sisters') :- preference(payment), card(accepted), cuisine(german), time(dinner), price(moderate), distance(close).
restaurant('Forsters') :- preference(payment), card(accepted), cuisine(german), time(lunch), price(moderate), distance(far), rating(high), takeaway(available).
restaurant('Forsters') :- preference(payment), card(accepted), cuisine(german), time(dinner), price(moderate), distance(far), rating(high), takeaway(available).
restaurant('Maultaschen Manufaktur') :- preference(payment), card(accepted), cuisine(german), time(dinner), price(moderate), distance(far), rating(high), \+takeaway(available).
restaurant('Schwarzwaldstuben') :- preference(payment), card(accepted), cuisine(german), time(lunch), price(moderate), distance(far), rating(moderate).
restaurant('Schwarzwaldstuben') :- preference(payment), card(accepted), cuisine(german), time(dinner), price(moderate), distance(far), rating(moderate).
restaurant('Rotisserie Weingrun') :- preference(payment), card(accepted), cuisine(german), time(dinner), price(expensive).
restaurant('Obermaier') :- preference(payment), card(accepted), cuisine(german), time(dinner), price(moderate), distance(midrange).
restaurant('Doner Box') :- preference(payment), \+card(accepted), cuisine(turkish), time(lunch), price(cheap), distance(close).
restaurant('Doyum Restuarant') :- preference(payment), card(accepted), cuisine(turkish), time(breakfast), price(cheap), distance(midrange), \+dietary(vegan).
restaurant('Doyum Restuarant') :- preference(payment), card(accepted), cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan).
restaurant('Doyum Restuarant') :- preference(payment), card(accepted), cuisine(turkish), time(dinner), price(cheap), distance(midrange), \+dietary(vegan).
restaurant('Ocakbasi') :- preference(payment), card(accepted), cuisine(turkish), time(lunch), price(moderate), rating(low).
restaurant('Ocakbasi') :- preference(card), card(accepted), cuisine(turkish), time(dinner), price(moderate), rating(low).
restaurant('Keke Kebap') :- preference(payment), \+card(accepted), cuisine(turkish), time(breakfast), price(cheap), distance(midrange), \+dietary(vegan).
restaurant('Keke Kebap') :- preference(card), \+card(accepted), cuisine(turkish), time(lunch), price(cheap), distance(midrange), \+dietary(vegan).
restaurant('Keke Kebap') :- preference(card), \+card(accepted), cuisine(turkish), time(dinner), price(cheap), distance(midrange), \+dietary(vegan).
restaurant('Simitdchi Cafe') :- preference(payment), card(accepted), cuisine(turkish), time(breakfast), price(moderate), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(payment), card(accepted), cuisine(turkish), time(lunch), price(moderate), rating(moderate).
restaurant('Simitdchi Cafe') :- preference(payment), card(accepted), cuisine(turkish), time(diner), price(moderate), rating(moderate).
restaurant('Meliz Palast') :- preference(payment), \+card(accepted), cuisine(turkish), time(lunch), price(cheap), distance(midrange), dietary(vegan).
restaurant('Meliz Palast') :- preference(payment), \+card(accepted), cuisine(turkish), time(dinner), price(cheap), distance(midrange), dietary(vegan).


% The code below implements the prompting to ask the user:
%%%% Add in your askables here %%%%
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