/*
1. SELECT round(avg(quantity * 1.0), 0) AS 'Stock Average'
FROM bike.stock;
*/

/*
2. SELECT DISTINCT quantity, product_name
FROM bike.stock
NATURAL JOIN bike.product
WHERE quantity = 0
ORDER BY product_name ASC LIMIT 12;
*/

/*
3. SELECT product_name, category_name, count(quantity) AS 'In Stock'
FROM bike.stock
NATURAL JOIN bike.product, bike.category
WHERE store_id = 2
ORDER BY 'In Stock' DESC;
*/

/*
4. SELECT count(emp_no) AS 'Number of Employees'
FROM employees.employees;
*/

/*
5. SELECT dept_name, round(avg(salary * 1.0), 2) AS 'average_salary' 
FROM employees.departments, employees.salaries
GROUP BY dept_name
ORDER BY dept_name ASC;
*/


/*
6. SELECT DISTINCT dept_name AS 'Department',
(SELECT COUNT(gender) FROM employees.employees WHERE gender = 'F') AS 'Number of Females' 
FROM employees.employees
NATURAL JOIN employees.departments;
*/