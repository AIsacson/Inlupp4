SELECT XMLGROUP(title AS "Titel" OPTION ROOT "Resultat" ROW "Bok" AS ATTRIBUTES)
FROM book
WHERE (SELECT COUNT(book)
	   FROM edition
	   WHERE book.id = book)>1;