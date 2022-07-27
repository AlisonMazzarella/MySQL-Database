/* 1. List the magazine name and then take 3% off the magazine price and round to 2 decimal places. 
SELECT magazineName, round((magazinePrice - (magazinePrice * 0.3 / 10)),2) AS NewPrice
FROM magazine.magazine; 
*/

/* 2. Show the primary key of id from the subscriber table and using the date of 2020-12-20 as if it were today's date, how long in years, ROUNDED to the nearest year, has it been since their subscription started? 
SELECT subscriberKey, datediff(year, '03-01-2011', '12-20-2020')
FROM magazine.subscription;
*/

/* 3. Show the subscriptionStartDate and subscriptionLength and add the  subscriptionLength to the subscriptionStartDate to see the date of how long their subscription will go. Format that date so it takes the format of Month name, number day with comma and then a 4 digit year. 
SELECT subscriptionStartDate, subscriptionLength
FROM magazine.subscription;
*/

/* 4. We need a list of all the products without the year at the end of the product_name string. Notice that some have two years listed, make sure you take those off as well. Order your results by product_id and limit your results to the first 14. 
SELECT product_name
FROM bike.product
ORDER BY product_id ASC
LIMIT 14;
*/

/* 5. List the product name and then take the 2019 model year bikes and divide the price into 3 equal payments. Display one of the payments with a dollar sign, comma at the thousands place and two decimal places. 
SELECT product_name
FROM bike.product
WHERE model_year = '2019';
*/