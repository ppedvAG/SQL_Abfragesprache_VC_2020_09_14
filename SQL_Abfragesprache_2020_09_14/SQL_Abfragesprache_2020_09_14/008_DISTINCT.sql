-- DISTINCT

-- alle L�nder, in die wir liefern?
SELECT Country
FROM Customers
-- Ergebnis: so viele wie Kunden; wenn in einem Land mehrere Kunden vorhanden sind, wird das Land entsprechend �fter angezeigt



-- Liste von allen L�ndern, in die ich liefere (also jedes Land nur einmal)
SELECT DISTINCT Country
FROM Customers



-- mehrere Spalten m�glich?
-- ja
-- Sinn? von Fall zu Fall entscheiden!


SELECT DISTINCT Country, CustomerID
FROM Customers
-- macht keinen Sinn! So viele Ergebnisse, wie CustomerID


SELECT DISTINCT Country, City
FROM Customers
-- So viele Ergebnisse, wie St�dte (Land steht �fter da, wenn wir in einem Land mehrere St�dte haben)


SELECT DISTINCT Country, Region
FROM Customers
-- So viele Ergebnisse, wie es Regionen gibt (in machen L�ndern gibt es mehrere Regionen)


-- Liste von allen St�dten, in denen wir Kunden haben?
SELECT DISTINCT City
FROM Customers


-- Liste von allen L�ndern, in denen Angestellte wohnen?
SELECT DISTINCT Country
FROM Employees
-- UK, USA

-- �berpr�fen:
SELECT Country 
FROM Employees
ORDER BY Country
-- stimmt, nur in UK und in den USA


