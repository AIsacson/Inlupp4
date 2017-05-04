SELECT XMLELEMENT(NAME "Resultat", 
		XMLAGG(XMLELEMENT(NAME "Förlag",XMLATTRIBUTES(name AS "Namn", country AS "Land"),
			(SELECT XMLAGG(XMLELEMENT(NAME "Bok", XMLATTRIBUTES(title AS "Titel", genre AS "Genre")))
		 	 FROM book, edition, XMLTABLE('distinct-values($TRANSLATIONS//Translation/@Publisher)' COLUMNS "publisher" VARCHAR(25) PATH 'string()') AS pub
		  	 WHERE book.id = edition.book
		 	 AND publisher.name = pub."publisher"))))
FROM publisher;