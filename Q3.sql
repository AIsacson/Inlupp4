SELECT XMLELEMENT(NAME "F�rfattare", XMLATTRIBUTES(author.name AS "Namn", "land" AS "Land"), 
		XMLAGG(XMLELEMENT(NAME "Bok", XMLATTRIBUTES(title AS "Title", originallanguage AS "Originalspr�k", genre AS "Genre"))))
FROM book, author, XMLTABLE('$INFO//Country' COLUMNS "land" VARCHAR(25) PATH 'text()') AS "l"
WHERE author.id IN (SELECT author
					FROM authorship
					WHERE book = book.id)
GROUP BY name, "land"