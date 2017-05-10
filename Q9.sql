XQUERY
element Resultat {
for $sprak in db2-fn:sqlquery('SELECT XMLELEMENT(NAME "Bok", XMLATTRIBUTES(originallanguage AS "Originalsprak"))
						   FROM book
						   GROUP BY originallanguage')
let $antal := for $bok in db2-fn:sqlquery('SELECT XMLELEMENT(NAME "Bok", XMLATTRIBUTES(originallanguage AS "Originalsprak"))
						   FROM book')
			  return $bok[@Originalsprak = $sprak/@Originalsprak]
return element Språk {attribute namn {$sprak/@Originalsprak}, attribute antalböcker {count($antal)}}
}  
			  