## select 10 fast food burger chain brand
CREATE TABLE brands AS 
	(SELECT business_id 
	FROM business 
	WHERE name LIKE '%McDonald%' or name LIKE '%Burger King%' or name 	LIKE '%Wendy%'or name LIKE '%Chick-fil-A%'or name LIKE '%Jack in 	the box%'or name LIKE '%steak%n shake%'or name LIKE '%Shake 	Shack%'or name LIKE '%Arby%'or name LIKE '%Five Guys%' or name LIKE 	'%In-N-Out%');


## find users who review and love these brand 
CREATE TABLE burgerfans AS 
	(SELECT business_id, stars,user_id 
	FROM review 
	WHERE business_id in (SELECT business_id FROM brands) and stars>3);


## count reviews group by users
CREATE TABLE counts AS 
	(SELECT count(user_id) AS count, user_id 
	FROM burgerfans 
	group by user_id 
	having count>1);


## percentage of burger review count / total_review_count  (percentage > 0.1, we consider him AS burger fan);
CREATE TABLE percentage AS 
	(SELECT users.user_id, (count/review_count) AS percentage 
	FROM users 
	inner join counts on counts.user_id=users.user_id 
	WHERE (count/review_count)>0.1);


## select those users and their review records(stars>3)
CREATE TABLE review1 AS 
	(SELECT business_id, user_id 
	FROM review 
	WHERE user_id in (SELECT user_id FROM percentage) and stars>3);


## find what they LIKE else by word frequency
CREATE TABLE business1 AS 
	(SELECT business_id, categories 
	FROM business 
	WHERE business_id in (SELECT business_id FROM review1));

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(categories)), 1, 20)) 
AS word 
FROM business1;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(categories)), 2, 20)) 
AS word 
FROM business1;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(categories)), 3, 20)) 
AS word 
FROM business1;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(categories)), 4, 20)) 
AS word 
FROM business1;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(categories)), 5, 20)) 
AS word 
FROM business1;