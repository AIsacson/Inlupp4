CREATE VIEW forlag AS
SELECT XMLELEMENT(NAME "Alla", XMLAGG(XMLELEMENT(NAME "Förlag", XMLATTRIBUTES(name AS "Namn", country AS "Land")))) AS "Publishers"
FROM publisher
