SELECT XMLELEMENT(NAME "Resultat", XMLAGG(XMLELEMENT(NAME "F�rlag", XMLATTRIBUTES(name AS "namn", country AS "land"),
													 XMLELEMENT(NAME "Spr�k", 
													(SELECT s."sprak"
													 FROM edition, XMLTABLE('$TRANSLATIONS//Translation' 
													 			   COLUMNS "sprak" VARCHAR(25) PATH '@Language',
																	   "forlag" VARCHAR(25) PATH '@Publisher') AS s
													 WHERE s."forlag" = publisher.name)))))
FROM publisher