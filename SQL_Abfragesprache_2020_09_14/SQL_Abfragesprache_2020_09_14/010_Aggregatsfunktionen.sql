-- Aggregatsfunktionen
-- aggregate functions




-- in wievielen L�ndern haben wir Kunden?
SELECT Country
FROM Customers

SELECT DISTINCT Country
FROM Customers
-- dabei m�ssten wir aber nachschauen, wie viele Ergebnisse wir herausbekommen

-- COUNT
SELECT COUNT(Country)
FROM Customers
-- so viele, wie wir Kunden haben (weil bei jedem Kunden ein Country dabeisteht)


-- L�nderanzahl aus Kombination von DISTINCT und COUNT
-- wir z�hlen, wie viele DISTINCT Countries es gibt
SELECT COUNT(DISTINCT Country) AS L�nderanzahl
FROM Customers


-- wieviele Produkte haben wir?
SELECT COUNT(ProductID)
FROM Products
-- 77
-- hier brauchen wir KEIN DISTINCT -- die ProduktID ist eindeutig, da k�nnen wir keine doppelten Eintr�ge weglassen

-- oder:
SELECT COUNT(*)
FROM Products
-- z�hlt hier NICHT die Anzahl der Spalten
-- sondern Anzahl der Ergebnisse (also so viele, wie wir Produkte haben)



-- Durchschnittswert berechnen: AVG (average)
SELECT AVG(UnitPrice) AS Durchschnittspreis
FROM Products
-- 28,8663


-- Summe bilden: SUM 
SELECT SUM(Freight) AS [Summe aller Frachtkosten]
FROM Orders
-- 64942,69
-- Summe aller Frachtkosten in allen Bestellungen


-- MIN/MAX - kleinster/gr��ter Wert
SELECT MIN(UnitPrice) AS [niedrigster St�ckpreis]
FROM Products


SELECT MAX(UnitPrice) AS [h�chster St�ckpreis]
FROM Products
-- 263,50



-- mit mehreren Spalten
SELECT    MAX(UnitPrice) AS [h�chster St�ckpreis]
		, ProductID
FROM Products
-- Column 'Products.ProductID' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.



-- macht das Sinn?
SELECT    MAX(UnitPrice) AS [h�chster St�ckpreis]
--		, UnitPrice
		, ProductID
FROM Products
GROUP BY ProductID --, UnitPrice
-- nein! Wir bekommen jetzt den h�chsten St�ckpreis pro ProduktID (und das entspricht wieder dem eigentlichen St�ckpreis.)


SELECT MAX(UnitPrice)
		, SupplierID
FROM Products
GROUP BY SupplierID
-- teuerster UnitPrice pro Supplier (29 Ergebnisse, so viele, wie es Supplier gibt)


-- macht das Sinn?
SELECT	  AVG(Freight) 
		, CustomerID
FROM Orders
GROUP BY CustomerID
-- ja! Das sind die durchschnittlichen Frachtkosten pro Kunde


SELECT	  AVG(Freight) 
		, ShipCountry
FROM Orders
GROUP BY ShipCountry
-- durchschnittliche Frachtkosten im jeweiligen Land



SELECT	  AVG(Freight) 
		, ShipCity
FROM Orders
GROUP BY ShipCity
-- durschnittliche Frachtkosten pro Stadt



SELECT	  AVG(Freight) 
		, ShipCountry
		, ShipCity
FROM Orders
GROUP BY ShipCountry, ShipCity
-- durchschnittliche Frachtkosten pro Stadt im jeweiligen Land
-- so viele Ergebnisse wie St�dte
-- L�nder m�ssen mehrmals dastehen (wenn in einem Land in mehrere St�dte geliefert wird)


-- Summe Frachtkosten pro Kunde?
SELECT	  SUM(Freight) AS [Summe Frachtkosten]
		, CustomerID
FROM Orders
GROUP BY CustomerID



-- ansonsten ganz normales SELECT-Statement
-- da darf auch WHERE und ORDER BY dabeisein
SELECT	  SUM(Freight) AS [Summe Frachtkosten]
		, CustomerID
		, ShipCountry
FROM Orders
WHERE ShipCountry IN('Germany', 'Switzerland', 'Austria')
GROUP BY CustomerID, ShipCountry
ORDER BY ShipCountry




-- bringt es was, wenn hier die OrderID auch noch dabei steht?
SELECT	  SUM(Freight) AS [Summe Frachtkosten]
		, CustomerID
		, ShipCountry
		, OrderID
FROM Orders
-- WHERE ShipCountry IN('Germany', 'Switzerland', 'Austria')
GROUP BY CustomerID, ShipCountry, OrderID
-- ORDER BY ShipCountry

-- NEIN! bringt nix!!! Das sind dann wieder genau die Frachtkosten, die in jeder Bestellung drinstehen


-- durchschnittliche Frachtkosten pro Fr�chter?
SELECT	  AVG(Freight) AS [Frachtkosten/Fr�chter]
		, ShipVia
FROM Orders
GROUP BY ShipVia


-- geordnet? niedrigste Frachtkosten zuerst
SELECT	  AVG(Freight) AS [Frachtkosten/Fr�chter]
		, ShipVia
FROM Orders
GROUP BY ShipVia
ORDER BY AVG(Freight)


-- wir d�rfen auch das ALIAS verwenden zum sortieren:
SELECT	  AVG(Freight) AS FK
		, ShipVia
FROM Orders
GROUP BY ShipVia
ORDER BY FK



-- durchschnittlicher Warenpreis von allen Waren?
SELECT AVG(UnitPrice)
FROM Products
-- 28,8663


-- durschnittlicher Umsatz pro Kunde:
SELECT	  SUM(od.UnitPrice*od.Quantity) AS Umsatz
		, c.CompanyName
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY c.CompanyName
ORDER BY Umsatz DESC