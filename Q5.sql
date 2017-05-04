UPDATE edition
SET translations = XMLQUERY('transform copy $res := $t
				 			 modify do insert element Translation {attribute Language {"Norwegian"},
				 									   			   attribute Publisher {"KLC"},
				 									               attribute Price {200}} as last into $res/Translations
							 return $res'
							 PASSING translations AS "t")
WHERE book IN (SELECT id
			   FROM book
			   WHERE title = 'Encore une fois')
ORDER BY year DESC
LIMIT 1;
