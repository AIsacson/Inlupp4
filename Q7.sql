SELECT XMLELEMENT(NAME "Resultat", XMLAGG(XMLELEMENT(NAME "Förlag", XMLATTRIBUTES(name AS "namn", country AS "land"),
													 XMLELEMENT(NAME "Språk", 
													(SELECT s."sprak"
													 FROM edition, XMLTABLE('$TRANSLATIONS//Translation' 
													 			   COLUMNS "sprak" VARCHAR(25) PATH '@Language',
																	   "forlag" VARCHAR(25) PATH '@Publisher') AS s
													 WHERE s."forlag" = publisher.name)))))
FROM publisher