% A map colouring program (after Bratko, ``Prolog Programming for AI'' p190)

% THE PROBLEM : To find a way of colouring a map using only 4 colours in
%               such a way that no pair of neighbouring countries are
%               the same colour.
%**********************************************************************

% Predicate : colour_countries(-List).
% Returns a List of terms of the form:
%       Country/Colour where - Country is the name of some country.
%                            - Colour is the map colour for that country.
% This program gives the following behaviour:
%
% | ?- colour_countries(X).
%
%     X=[austria/red,belgium/green,denmark/blue,france/red,
%       italy/yellow,netherlands/blue,portugal/blue,
%       spain/yellow,switzerland/blue,w_germany/yellow]
%yes

% colour_countries/1 works by first using setof/3 to construct a list of terms
% of the form : Country/Var where - Country is the name of a country
%                                   Var is a variable
% It then uses colours/2 to bind each Var in this list to an appropriate colour

colour_countries(Colours):-
        setof(Country/_, X^ngb(Country,X), Colours),
        colours(Colours).

% Predicate : colours(+List)
% Succeeds when, given a List of elements of form Country/Colour, a value
% for each Colour can be found such that the Country to which it is attached
% has no neighbour of the same colour.

        % If there are no elements left in the list then just succeed.
colours([]).
        % For a list with head Country/Colour and tail Rest, colour all
        % the Rest then select a value for Colour from the list of candidates
        % then check that there is no country in Rest which neighbours
        % the Country just coloured and has the same Colour.,
colours([Country/Colour|Rest]):-
        colours(Rest),
        member(Colour, [yellow,blue,red,green]),
        \+ (member(Country1/Colour, Rest), neighbour(Country, Country1)).


% Predicate : neighbour(Country, Neighbour)
% Succeeds if Neighbour is a neighbour of Country

neighbour(Country, Country1):-
        ngb(Country, Neighbours),
        member(Country1, Neighbours).


% Predicate : ngb(Country, Neighbours).
% Determines the list of Neighbours of a Country.

ngb(hanover, [westmoreland,stJames]).
ngb(westmoreland, [hanover,stJames,stElizabeth]).
ngb(stJames, [hanover,westmoreland,stElizabeth,trelawny]).
ngb(stElizabeth, [westmoreland,stJames,trelawny,manchester]).
ngb(trelawny, [stJames,stElizabeth,manchester,stAnn,clarendon]).
ngb(manchester, [stElizabeth,trelawny,stAnn,clarendon]).
ngb(stAnn, [trelawny,manchester,clarendon,stCatherine,stMary]).
ngb(clarendon, [trelawny,manchester,stAnn,stCatherine]).
ngb(stCatherine, [stAnn,clarendon,stMary,stAndrew]).
ngb(stMary, [stAnn,stCatherine,stAndrew,portland]).
ngb(stAndrew, [stCatherine,stMary,kingston,portland,stThomas]).
ngb(kingston, [stAndrew]).
ngb(portland, [stMary,stAndrew,stThomas]).
ngb(stThomas, [stAndrew,portland]).

%ngb(portugal, [spain]).
%ngb(spain, [portugal,france]).
%ngb(france, [spain,belgium,switzerland,w_germany,italy]).
%ngb(belgium, [france,w_germany,netherlands]).
%ngb(netherlands, [belgium,w_germany]).
% ngb(w_germany,
% [netherlands,belgium,france,switzerland,austria,denmark]).
%ngb(switzerland, [france,w_germany,austria,italy]).
%ngb(austria, [w_germany,switzerland,italy]).
%ngb(italy, [france,switzerland,austria]).
%ngb(denmark, [w_germany]).
