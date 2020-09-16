-- WHERE clause, WHERE-Klausel, WHERE Bedingung
-- einschr�nken, welche Ergebnisse ich bekomme


/*


	WHERE Operatoren:

		=, <, >, <=, >=
		!=, <> ..... darf NICHT einem bestimmten Wert entsprechen


		AND - es m�ssen zwingend alle Bedingungen erf�llt sein
		OR - mindestens eine von den Bedingungen muss erf�llt sein

		LIKE
		IN
		BETWEEN

*/



-- alle Spalten der Customers-Tabelle
SELECT *
FROM Customers


-- einschr�nken, welche Spalten wir ausgeben
SELECT	  CustomerID
		, CompanyName
FROM Customers



-- Anzahl meiner Treffer einschr�nken
-- z.B. nur die deutschen Kunden

SELECT	  *
FROM Customers
WHERE Country = 'Germany'



SELECT	  CustomerID
		, CompanyName
		, ContactName
		, Phone
FROM Customers
WHERE Country = 'Germany'



SELECT	  CustomerID
		, CompanyName
		, ContactName
		, Phone
FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'



-- nur die deutschsprachigen Kunden:
SELECT	  CustomerID
		, CompanyName
		, ContactName
		, Phone
		, Country
FROM Customers
WHERE Country = 'Germany' 
		OR Country = 'Austria' 
		OR Country = 'Switzerland'


-- Kunden, deren Frachtkosten h�her sind als 100:
SELECT *
FROM Orders
WHERE Freight > 100

-- Reihenfolge ordnen:
SELECT *
FROM Orders
WHERE Freight > 100
ORDER BY Freight -- ASC (ascending) = vom kleinsten zum gr��ten Wert geordnet
-- ASC (aufsteigend) ist Default, muss also nicht extra dazugeschrieben werden


SELECT *
FROM Orders
WHERE Freight > 100
ORDER BY Freight DESC -- (descending) = vom gr��ten zum kleinsten Wert geordnet



SELECT *
FROM Orders
WHERE Freight > 100
ORDER BY Freight DESC, CustomerID


-- gib mir alle aus, wo die Frachtkosten NICHT 148.33
SELECT *
FROM Orders
WHERE Freight != 148.33



-- �bungen:
-- Gib nur die Kunden aus, die in Frankreich ans�ssig sind.
SELECT *
FROM Customers
WHERE Country = 'France'

-- Gib alle Kunden aus, die in Buenos Aires in Argentinien ans�ssig sind.
SELECT *
FROM Customers
WHERE City = 'Buenos Aires' AND Country = 'Argentina'


-- Gib alle portugiesischen und spanischen Kunden aus.
SELECT *
FROM Customers
WHERE Country = 'Portugal' OR Country = 'Spain'


-- Gib alle Produkte aus, von denen mehr als 100 vorhanden sind.
-- Tipp: Wir m�ssen hier nichts berechnen, das steht in der Datenbank.
SELECT *
FROM Products
WHERE UnitsInStock > 100



-- ************************************** IN ******************************************

-- alle spanischen und portugiesischen Kunden:
SELECT *
FROM Customers
WHERE Country = 'Spain' OR Country = 'Portugal'

-- oder:

SELECT *
FROM Customers
WHERE Country IN('Spain', 'Portugal')


-- bestimmte Angestellte: 3, 5, 7
SELECT *
FROM Employees
WHERE EmployeeID = 3 OR EmployeeID = 5 OR EmployeeID = 7

-- oder:
SELECT *
FROM Employees
WHERE EmployeeID IN(3, 5, 7)


-- ****************************** BETWEEN ***********************************************
-- Bereich abfragen

SELECT    OrderID
		, Freight
FROM Orders
WHERE Freight >= 100 AND Freight <= 200

-- oder:
SELECT    OrderID
		, Freight
FROM Orders
WHERE Freight BETWEEN 100 AND 200
ORDER BY Freight
-- between macht >= und <=


-- Gib alle Produkte aus, deren ProduktID zwischen 10 und 15 (inklusive) liegt.
SELECT ProductID
FROM Products
WHERE ProductID BETWEEN 10 AND 15


-- Gib alle Produkte aus, die vom Anbieter (SupplierID) 2, 7 oder 15 geliefert werden.
SELECT    ProductID
		, ProductName
--		, SupplierID
FROM Products
WHERE SupplierID IN(2, 7, 15)

-- Resultfenster ein-/ausblenden: STRG + R
