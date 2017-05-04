SELECT title AS "Titel", originallanguage AS "Originalspr�k", genre AS "Genre",
	  (SELECT COUNT(*)
	   FROM edition
	   WHERE book = book.id) AS "AntalUpplagor",
	  (SELECT COUNT(DISTINCT "sprak")
	   FROM edition,XMLTABLE('$TRANSLATIONS//Translation' COLUMNS "sprak" VARCHAR(25) PATH '@Language') AS s
	   WHERE book = book.id) AS "AntalSpr�k",
	   (SELECT COUNT(DISTINCT id)
	    FROM author
	    WHERE id IN(SELECT author
	    			FROM authorship
	    			WHERE book IN (SELECT book.id
	    						   FROM edition
	    						   WHERE book = book.id))) AS "AntalF�rfattare",
	   (SELECT year
	    FROM edition
	    WHERE book = book.id
	    ORDER BY year ASC
	    LIMIT 1) AS "�r"
FROM book
	   