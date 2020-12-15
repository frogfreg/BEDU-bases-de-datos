-- 1 -- 
SELECT o.orderNumber,SUM(quantityOrdered) 
FROM orders AS o
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;
-- 2 --
SELECT o.orderNumber,status, SUM(quantityOrdered * priceEach)
FROM orders AS o
JOIN orderdetails as od
ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;
-- 3 --
SELECT od.orderNumber,o.orderDate,orderLineNumber
productName,quantityOrdered,priceEach
FROM orderdetails AS od
JOIN products AS p ON od.productCode = p.productCode
JOIN orders AS o ON od.orderNumber = o.orderNumber;
-- 4 --
SELECT od.orderNumber, productName,MSRP,priceEach
FROM orderdetails AS od
JOIN products AS p ON od.productCode = p.productCode;
-- 5 --
SELECT c.customerNumber, customerName, orderNumber, status
FROM customers AS c
LEFT JOIN orders AS o ON c.customerNumber = o.customerNumber;
-- 6 --
SELECT c.customerNumber, customerName FROM customers AS c
LEFT JOIN orders AS o ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;
-- 7 --
SELECT lastName,firstName,e.employeeNumber,customerName,checkNumber,sub.total_clients
FROM employees AS e
LEFT JOIN customers AS c ON salesRepEmployeeNumber = employeeNumber
LEFT JOIN payments AS p ON c.customerNumber = p.customerNumber
LEFT JOIN (SELECT employeeNumber,COUNT(customerNumber) AS 'total_clients'
			FROM customers 
			JOIN employees ON salesRepEmployeeNumber = employeeNumber
			GROUP BY employeeNumber) AS sub ON sub.employeeNumber = e.employeeNumber 
WHERE c.customerNumber IS NOT NULL;
-- 8.1 --
SELECT c.customerNumber, customerName, orderNumber, status
FROM customers AS c
RIGHT JOIN orders AS o ON c.customerNumber = o.customerNumber;
-- 8.2 --
SELECT c.customerNumber, customerName FROM customers AS c
RIGHT JOIN orders AS o ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;
-- 8.3 --
SELECT lastName,firstName,e.employeeNumber,customerName,checkNumber,sub.total_clients
FROM employees AS e
RIGHT JOIN customers AS c ON salesRepEmployeeNumber = employeeNumber
RIGHT JOIN payments AS p ON c.customerNumber = p.customerNumber
RIGHT JOIN (SELECT employeeNumber,COUNT(customerNumber) AS 'total_clients'
			FROM customers 
			JOIN employees ON salesRepEmployeeNumber = employeeNumber
			GROUP BY employeeNumber) AS sub ON sub.employeeNumber = e.employeeNumber 
WHERE c.customerNumber IS NOT NULL;

-- Un left join incluira todos los valores de la tabla izquierda, y los valores que no tengan
-- una correspondencia en la tabla derecha apareceran como NULL. Lo mismo ocurre con un right join,
-- pero esta vez apareceran todos los datos de la tabla derecha y los datos de la tabla izquierda
-- sin una correspondencia apareceran como NULL
-- 9.1 --
CREATE VIEW productos_por_orden_221 AS
	(	SELECT o.orderNumber,SUM(quantityOrdered) 
		FROM orders AS o
		JOIN orderdetails AS od
		ON o.orderNumber = od.orderNumber
		GROUP BY o.orderNumber);
-- 9.2 --
CREATE VIEW total_orden_221 AS 
(	SELECT o.orderNumber,status, SUM(quantityOrdered * priceEach)
	FROM orders AS o
	JOIN orderdetails as od
	ON o.orderNumber = od.orderNumber
	GROUP BY o.orderNumber);
-- 9.3 --
CREATE VIEW clientes_sin_orden AS 
(	SELECT c.customerNumber, customerName FROM customers AS c
	LEFT JOIN orders AS o ON c.customerNumber = o.customerNumber
	WHERE orderNumber IS NULL);


