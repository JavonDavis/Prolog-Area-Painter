# Prolog-Area-Painter
Prolog program to paint areas given colours. With the constraint that no area adjacent to each other will have the same color.

#Usage
Execute Painter.pl
Program prints out area-color pairs and prints true if it could successfully paint the areas with the colors given, false otherwise
To run the program you would call color_area(Areas,Colors) where Areas would be a list of lists where each 
list is a list of areas where the each element after the first element is an area that is adjacent to the area
represented by the first element.

#Examples
The following would color Jamaica according to parish, in this example the first element represents the parish Hanover and states that Westmoreland and St. James are adjacent to it.
color_area([['Hanover', 'Westmoreland','St. James'],['Westmoreland', 'Hanover','St. James','St. Elizabeth'],['St. James', 'Hanover','Westmoreland','St. Elizabeth','Trelawny'],['St. Elizabeth', 'Westmoreland','St. James','Trelawny','Manchester'],['Trelawny', 'St. James','St. Elizabeth','Manchester','St. Ann','Clarendon'],['Manchester', 'St. Elizabeth','Trelawny','St. Ann','Clarendon'],['St. Ann', 'Trelawny','Manchester','Clarendon','St. Catherine','St. Mary'],['Clarendon', 'Trelawny','Manchester','St. Ann','St. Catherine'],['St. Catherine', 'St. Ann','Clarendon','St. Mary','St. Andrew'],['St. Mary', 'St. Ann','St. Catherine','Portland','St. Andrew'],['St. Andrew', 'St. Catherine','St. Mary','Kingston','Portland','St. Thomas'],['Kingston', 'St. Andrew'],['Portland', 'St. Mary','St. Thomas','St. Andrew'],['St. Thomas', 'St. Andrew','Portland']],[blue,red,green,purple]).

The following would color Jamaica with an extra parish named 'The best Parish'
color_area([['Hanover', 'Westmoreland','St. James'],['The best Parish','Trelawny','St. Ann','St. Mary'],['Westmoreland', 'Hanover','St. James','St. Elizabeth'],['St. James', 'Hanover','Westmoreland','St. Elizabeth','Trelawny'],['St. Elizabeth', 'Westmoreland','St. James','Trelawny','Manchester'],['Trelawny', 'St. James','St. Elizabeth','Manchester','St. Ann','Clarendon','The best Parish'],['Manchester', 'St. Elizabeth','Trelawny','St. Ann','Clarendon'],['St. Ann', 'Trelawny','Manchester','Clarendon','St. Catherine','St. Mary','The best Parish'],['Clarendon', 'Trelawny','Manchester','St. Ann','St. Catherine'],['St. Catherine', 'St. Ann','Clarendon','St. Mary','St. Andrew'],['St. Mary', 'St. Ann','St. Catherine','Portland','St. Andrew','The best Parish'],['St. Andrew', 'St. Catherine','St. Mary','Kingston','Portland','St. Thomas'],['Kingston', 'St. Andrew'],['Portland', 'St. Mary','St. Thomas','St. Andrew'],['St. Thomas', 'St. Andrew','Portland']],[blue,red,green,purple]).

The following would color Cuba according to state
color_area([['Pinar del Rio', 'La Habana'], ['La Habana', 'Pinar del Rio', 'Mantanzas'], ['Mantanzas', 'La Habana', 'Cienfuegos', 'Villa Clara'], ['Cienfuegos', 'Mantanzas', 'Villa Clara', 'Sancti Spiritus'], ['Villa Clara', 'Mantanzas', 'Cienfuegos', 'Sancti Spiritus'], ['Sancti Spiritus', 'Villa Clara', 'Cienfuegos', 'Ciego de Avila'], ['Ciego de Avila', 'Sancti Spiritus', 'Camaguey'], ['Camaguey', 'Ciego de Avila', 'Las Tunas'], ['Las Tunas', 'Camaguey', 'Holguin', 'Granma'], ['Granma', 'Las Tunas', 'Holguin', 'Santiago de Cuba'], ['Holguin', 'Las Tunas', 'Granma', 'Santiago de Cuba', 'Guantanamo'], ['Santiago de Cuba', 'Holguin', 'Granma', 'Guantanamo'], ['Guantanamo', 'Holguin', 'Santiago'], ['Isla de Juventud']], [blue, red, green]).

