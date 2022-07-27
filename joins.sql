/*
1. USE v_art;
SELECT artfile 
FROM v_art.artwork
WHERE period = 'Impressionism';
*/

/*
2. SELECT v_art.artwork.artfile
FROM v_art.artwork
INNER JOIN v_art.keyword
WHERE v_art.artwork.period = 'Impressionism' AND v_art.keyword.keyword = 'flowers';
*/


/*
3. SELECT DISTINCT fname, lname, title
FROM v_art.artist
NATURAL JOIN v_art.artwork
GROUP BY fname, lname, title;
*/


/*
4. SELECT DISTINCT magazineName, subscriberLastName, subscriberFirstName
FROM magazine.subscription
NATURAL JOIN magazine.magazine, magazine.subscriber
ORDER BY magazineName;
*/


/*
5. SELECT DISTINCT magazineName, subscriberFirstName, subscriberLastName
FROM magazine.magazine
NATURAL JOIN magazine.subscriber
WHERE subscriberFirstName LIKE '%Samantha%' AND subscriberLastName = 'Sanders';
*/


/*
6. SELECT first_name, last_name
FROM employees.employees
NATURAL JOIN employees.departments
ORDER BY last_name ASC limit 5;
*/


/*
7. SELECT DISTINCT dept_no, salary, first_name, last_name
FROM employees.dept_emp
NATURAL JOIN employees.salaries, employees.employees
WHERE first_name = 'Berni' AND last_name LIKE '%Genin%'
ORDER BY salary ASC;
*/