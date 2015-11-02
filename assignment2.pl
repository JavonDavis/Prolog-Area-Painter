goal_state([clarendon/green, hanover/red, kingston/yellow, manchester/blue, portland/blue, stAndrew/red, stAnn/red, stCatherine/blue, stElizabeth/red, stJames/blue, stMary/yellow, stThomas/yellow, trelawny/yellow, westmoreland/yellow]).

color(green).
color(red).
color(yellow).
color(blue).

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

adjacent(Parish, OtherParish):-
        adjacentParishes(Parish, AdjacentParish),
        member(OtherParish, AdjacentParish).
