goal_state([clarendon/green, hanover/red, kingston/yellow,
	    manchester/blue, portland/blue, stAndrew/red,
	    stAnn/red, stCatherine/blue, stElizabeth/red,
	    stJames/blue, stMary/yellow, stThomas/yellow,
	    trelawny/yellow, westmoreland/yellow]).

colorParish(Colors):-
        bagof(Parish/_, X^adjacentParishes(Parish,X), Colors),
        colours(Colors).

colored_parishes([]).
color_parishes([Parish/Colour|Rest]):-
	color_parishes(Rest), member(Colour,colors),
	not(adjacent_parish(Parish, Rest)).

colors([blue,red,orange,green]).

parish(hanover).
parish(westmoreland).
parish(stJames).
parish(stElizabeth).
parish(trelawny).
parish(manchester).
parish(stAnn).
parish(clarendon).
parish(stCatherine).
parish(stMary).
parish(stAndrew).
parish(kingston).
parish(portland).
parish(stThomas).

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
adjacentParishes(portland, [stMary,stAndrew,stThomas]).
adjacentParishes(stThomas, [stAndrew,portland]).

adjacent_parish(Parish, OtherParish):-
        adjacentParishes(Parish, AdjacentParish),
        member(OtherParish, AdjacentParish).

move(hanover,westmoreland).
move(hanover,stJames).
move(westmoreland,hanover).
move(westmoreland,stJames).
move(westmoreland,stElizabeth).
move(stJames,hanover).
move(stJames,westmoreland).
move(stJames,trelawny).
move(stElizabeth,westmoreland).
move(stElizabeth,stJames).
move(stElizabeth,trelawny).
move(stElizabeth,manchester).
move(trelawny,stJames).
move(trelawny,stElizabeth).
move(trelawny,manchester).
move(trelawny,stAnn).
move(trelawny,clarendon).
move(manchester,stElizabeth).
move(manchester,trelawny).
move(manchester,stAnn).
move(manchester,clarendon).
move(stAnn,trelawny).
move(stAnn,manchester).
move(stAnn,clarendon).
move(stAnn,stCatherine).
move(stAnn,stMary).
move(clarendon,trelawny).
move(clarendon,manchester).
move(clarendon,stAnn).
move(clarendon,stCatherine).
move(stCatherine,stAnn).
move(stCatherine,clarendon).
move(stCatherine,stMary).
move(stCatherine,stAndrew).
move(stMary,stAnn).
move(stMary,stCatherine).
move(stMary,stAndrew).
move(stMary,portland).
move(stAndrew,stCatherine).
move(stAndrew,stMary).
move(stAndrew,kingston).
move(stAndrew,portland).
move(stAndrew,stThomas).
move(kingston,stAndrew).
move(portland,stMary).
move(portland,stAndrew).
move(portland,stThomas).
move(portland,stAndrew).
move(portland,stThomas).

