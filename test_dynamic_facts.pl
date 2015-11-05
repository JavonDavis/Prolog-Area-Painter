adjacentParishes(hanover, [westmoreland,stJames]).
adjacentParishes(westmoreland, [hanover,stJames,stElizabeth]).
adjacentParishes(stJames, [hanover,westmoreland,stElizabeth,trelawny]).
adjacentParishes(stElizabeth, [westmoreland,stJames,trelawny,manchester]).
adjacentParishes(trelawny, [stJames,stElizabeth,manchester,stAnn,clarendon]).
adjacentParishes(manchester, [stElizabeth,trelawny,stAnn,clarendon]).
adjacentParishes(stAnn, [trelawny,manchester,clarendon,stCatherine,stMary]).
adjacentParishes(clarendon, [trelawny,manchester,stAnn,stCatherine]).
adjacentParishes(stCatherine, [stAnn,clarendon,stMary,stAndrew]).
adjacentParishes(stMary, [stAnn,stCatherine,stAndrew,portland]).
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

custom_sub(Z,[],Z).

custom_sub(Parishes,[Parish/Color|Rest],K):-
	subtract(Parishes,[Parish],Z),
	custom_sub(Z,Rest,K).

traverse([],C,V).

color_parish([],C,V).


traverse([Parish|Rest],Colors,Visited):-
	adjacentParishes(Parish,O), % get adjacent parishes and store in O
	cuse(O,Visited,Color),
	write(Parish),
	write("-"),
	write_ln(Color),  % assign a color to parish at the front of list
	append(Visited,[Parish/Color],Correct),  % record that we have visited the parish at the top of the list
	custom_sub(O,Correct,K),
	traverse(K,Colors,Correct,Correct). % traverse the parishes adjacent

color_parish([Parish|Rest],Colors,Visited):-
	adjacentParishes(Parish,O),
	cuse(O,Visited,Color),!,
	write(Parish),
	write("-"),
	write_ln(Color),  % assign a color to parish at the front of list
	append(Visited,[Parish/Color],Correct),
	color_parish(Rest,Colors,Correct).
