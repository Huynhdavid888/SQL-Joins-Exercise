-- find all products --
 SELECT * FROM products;
-- find all products that cost $1400
 SELECT * FROM products
 WHERE Price = 1400.00;
-- find all products that cost $11.99 or $13.99
 SELECT * FROM products
 WHERE price = 11.99 OR price = 13.99;
 
-- find all products that do NOT cost 11.99 - using NOT
 SELECT * FROM products  
 WHERE NOT price = 11.99;
-- find  all products and sort them by price from greatest to least
 SELECT * FROM products
 ORDER BY price DESC;
-- find all employees who don't have a middle initial
 SELECT * FROM employees
 WHERE MiddleInitial IS NULL;
-- find distinct product prices
SELECT DISTINCT price FROM products;
-- find all employees whose first name starts with the letter ‘j’
 SELECT * FROM employees
 WHERE FirstName LIKE 'j%';
-- find all Macbooks --
 SELECT * FROM products
 WHERE NAME = '%Mackook%';
-- find all products that are on sale
 SELECT * FROM products
 WHERE OnSale = 1;
-- find the average price of all products --
 SELECT AVG(price) FROM products;
-- find all Geek Squad employees who don't have a middle initial --
 SELECT * FROM employees 
 WHERE MiddleInitial IS NULL AND title = 'GeekSquad';
-- find all products from the products table whose stock level is in the range  -- of 500 to 1200. Order by Price from least to greatest. **Try this with the -- between keyword** 
SELECT * FROM products
WHERE StockLevel >= 500 AND StockLevel <=  1200 
Order by Price;
-- joins: select all the computers from the products table:using the products table and the categories table, return the product name and the category name
SELECT P.NAME, C.NAME FROM products AS p
INNER JOIN  categories AS c On p.CategoryID = c.CategoryID;
SELECT * FROM products;
SELECT * FROM categories;
-- joins: find all product names, product prices, and products ratings that have a rating of 5
SELECT * FROM products;
SELECT * FROM reviews;
SELECT p.NAME, p.PRICE, p.Rating from products AS p
INNER JOIN reviews AS r ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
SELECT * FROM employees;
SELECT * FROM sales;
SELECT sum(s.quantity) As total_sold, e.employeeID, concat(e.firstname, ' ', e.lastname) AS fullname FROM sale AS s
INNER JOIN employees AS e ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID;
-- joins: find the name of the department, and the name of the category for Appliances and Games
SELECT * FROM categories;
SELECT * FROM departments;
SELECT c.NAME, d.NAME FROM departments AS d
INNER JOIN categories AS c ON  d.departmentID = c.DepartmentID
WHERE c.CategoryID = 2 OR c.CategoryID = 8;
-- joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California --You may need to use SUM()
SELECT * FROM sales;
SELECT p.NAME, sum(s.quantity) AS total_number_sold, sum(s.quantity * s.pricePerUnit) AS total_price_sold FROM products AS p
INNER JOIN sales AS s ON p.ProductID = s.ProductID
WHERE p.NAME LIKE '%Eagles: Hotel California%'
GROUP BY p.ProductID;
-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
SELECT * FROM products;
SELECT * FROM reviews;
SELECT p.NAME, r.Reviewer, r.Rating, r.Comment FROM products AS p
INNER Join reviews AS r ON p.ProductID = r.ProductID
WHERE p.NAME LIKE '%VISIO%'
ORDER BY rating
LIMIT 1;
-------------------------------------------- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT * FROM sales;
SELECT concat(e.firstname, ' ', e.lastname) AS fullname, p.NAME, sum(quantity) AS total_sold, s.DATE FROM employees AS e 
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON s.productID = p.ProductID
GROUP BY e.EmployeeID, s.DATE
ORDER BY total_sold DESC;