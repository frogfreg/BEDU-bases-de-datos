-- 1 -- 
SELECT employeeNumber, lastName,firstName FROM employees
WHERE firstName LIKE "a%";

-- 2 --
SELECT employeeNumber, lastName,firstName FROM employees
WHERE lastName LIKE "%on";

-- 3 --
SELECT employeeNumber, lastName,firstName FROM employees
WHERE firstName LIKE "%on%";

-- 4 --
SELECT employeeNumber, lastName,firstName FROM employees
WHERE firstName LIKE "g_____";

-- 5 --
SELECT employeeNumber, lastName,firstName FROM employees
WHERE firstName NOT LIKE "b%";
-- 6 --
SELECT productCode,productName FROM products
WHERE productCode LIKE "%\_20%";
-- 7 --
SELECT orderNumber, sum(priceEach * quantityOrdered) FROM orderdetails
GROUP BY orderNumber;
-- 8 --
SELECT year(orderDate) as año, count(*)  FROM orders
GROUP BY año;
-- 9 --
SELECT lastName, firstName from employees
WHERE officeCode IN (SELECT officeCode FROM offices
					 WHERE country = "USA");
-- 10 --
SELECT customerNumber, checkNumber, amount FROM payments
WHERE amount IN (SELECT max(amount) FROM payments);
-- 11 --
SELECT customerNumber, checkNumber, amount FROM payments
WHERE amount > (SELECT avg(amount) FROM payments);
-- 12 --
SELECT customerName FROM customers
WHERE customerNumber NOT IN (SELECT customerNumber FROM orders); 
-- 13 --
SELECT orderNumber, min(quantityOrdered),max(quantityOrdered),avg(quantityOrdered) FROM orderdetails
GROUP BY orderNumber;
-- 14 --
SELECT status,count(*) FROM orders
GROUP BY status;