adjacentParishes(hanover, [westmoreland,stJames]).
adjacentParishes(westmoreland, [hanover,stJames,stElizabeth]).
adjacentParishes(stJames, [hanover,westmoreland,stElizabeth,trelawny]).
adjacentParishes(stElizabeth, [westmoreland,stJames,trelawny,manchester]).
adjacentParishes(trelawny, [stJames,stElizabeth,manchester,stAnn,clarendon]).
adjacentParishes(manchester, [stElizabeth,trelawny,stAnn,clarendon]).
adjacentParishes(stAnn, [trelawny,manchester,clarendon,stCatherine,stMary]).
adjacentParishes(clarendon, [trelawny,manchester,stAnn,stCatherine]).
adjacentParishes(stCatherine, [stAnn,clarendon,stMary,stAndrew]).
adjacentParishes(stMary, [stAnn,stCatherine,portland,stAndrew]).
adjacentParishes(stAndrew, [stCatherine,stMary,kingston,portland,stThomas]).
adjacentParishes(kingston, [stAndrew]).
adjacentParishes(portland, [stMary,stThomas,stAndrew]).
adjacentParishes(stThomas, [stAndrew,portland]).

adjacent_parish(Parish, OtherParish):-
        adjacentParishes(Parish, AdjacentParish),
        member(OtherParish, AdjacentParish).

cuse([],V,K).

cuse([P1|Rest], Visited,V):-
	color(V),
	not(member(P1/V,Visited)),
	cuse(Rest,Visited,V).

color(blue).
color(red).
color(green).
color(purple).

color_parish([],C,V).

%color_parish([hanover,westmoreland,stJames,stElizabeth,stThomas,stAnn,stAndrew,stCatherine,clarendon,stMary,kingston,portland,trelawny,manchester],[blue,red,green,purple],[]).

color_parish([Parish|Rest],Colors,Visited):-
	adjacentParishes(Parish,O),
	cuse(O,Visited,Color),!,
	write(Parish),
	write("-"),
	write_ln(Color),  % assign a color to parish at the front of list
	append(Visited,[Parish/Color],Correct),
	color_parish(Rest,Colors,Correct).

