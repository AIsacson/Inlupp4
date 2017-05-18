SELECT XMLELEMENT(NAME "Resultat", XMLAGG(xt))
FROM(SELECT XMLELEMENT(NAME "F�rlag", XMLATTRIBUTES(name AS "namn", country AS "land"),
													 XMLAGG(XMLELEMENT(NAME "Spr�k", sprak))) AS xt
	 FROM publisher, (SELECT DISTINCT sprak, forlag
				 	  FROM edition, XMLTABLE('$TRANSLATIONS//Translation' 
						 	   COLUMNS sprak VARCHAR(25) PATH '@Language',
								 	   forlag VARCHAR(25) PATH '@Publisher') AS s)
WHERE forlag = publisher.name
GROUP BY name, country);