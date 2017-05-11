SELECT XMLELEMENT(NAME "Resultat",(XMLQUERY('for $forlag in $f//Förlag
					     let $sprak := for $s in distinct-values($t//Translation[@Publisher = $forlag/@Namn]/@Language)
							   return element Språk {$s}
					     return element Förlag{$forlag/@Namn, $forlag/@Land, $sprak}'
				   	     PASSING XMLAGG("Publishers") AS "f", XMLAGG(Translations) AS "t")))AS "Förlag"
FROM edition, forlag
