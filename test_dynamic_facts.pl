


adjacentParishes(hanover, [westmoreland,stJames]).

cuse(Parish, Color, Visited):-
	color(Color),
    adjacent_parish(Parish, _),
    not(member(_/Color, Visited)).


 color(blue).
 color(red).
 color(green).
color(purple).


traverse([parishhead|Rest],Colors,visited):-
	setof(X cuse(hanover, X, [stjames/blue, westmoreland/red]),Z).
	nth0(0, Z, Color). 
	print parishhead +"-"+ Color  % assign a color to parish at the front of list
	adjacentParishes(parishhead,O).  % get adjacent parishes and store in O
	visited.append([parishhead\colorhead]).   % record that we have visited the parish at the top of the list
	traverse(Rest-visited,Colors,visited). % traverse the parishes adjacent