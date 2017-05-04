SELECT name AS "Namn", XMLQUERY('$INFO//Country/text()') AS "Land"
FROM author
WHERE id IN (SELECT author
			 FROM authorship
			 WHERE book IN (SELECT id
			 				FROM book
			 				WHERE id IN (SELECT book
			 							 FROM edition
			 							 WHERE XMLEXISTS('$TRANSLATIONS//Translation[@Language="Russian"]'))))