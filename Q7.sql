SELECT XMLELEMENT(NAME "Förlag", XMLATTRIBUTES(name AS "namn", country AS "land"),
	XMLAGG(XMLELEMENT(NAME "Språk", "sprak")))
FROM publisher, edition, XMLTABLE('$TRANSLATIONS//Translation[not(@Language = .)]' 
						 COLUMNS "sprak" VARCHAR(25) PATH '@Language',
								 "forlag" VARCHAR(25) PATH '@Publisher') AS s
WHERE "forlag" = publisher.name
GROUP BY name, country;
