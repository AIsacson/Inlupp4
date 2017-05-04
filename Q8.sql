UPDATE edition
SET translations = XMLQUERY('transform copy $res := $TRANSLATIONS 
								modify do replace $res/Translation[@Language = "French"]/@Publisher with attribute Publisher {"ABC International"}
								return $res')
WHERE year = 1999
AND book IN (SELECT id
			 FROM book
			 WHERE title = 'Archeology in Egypt')