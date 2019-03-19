## Total number of branches for 10 top burger brand
SELECT name, count(business_id) 
FROM business 
WHERE name IN ('Burger King', 'Chick-fil-A', 'Jack in the Box', 'Shake Shack', 'In-N-Out Burger', 'Five Guys', 'McDonald\'s', 'Arby\'s', 'Wendy\'s', 'Steak \地 Shake')

GROUP BY name; 

## Avg rating score of each brand
SELECT name, avg(stars) 
FROM business 
WHERE name IN ('Burger King', 'Chick-fil-A', 'Jack in the Box', 'Shake Shack', 'In-N-Out Burger', 'Five Guys', 'McDonald\'s', 'Arby\'s', 'Wendy\'s', 'Steak \地 Shake')
GROUP BY name;


## Which city has the most branches for each brand
SELECT name, city, count(business_id) as count 
FROM business 
WHERE name IN ('Burger King', 'Chick-fil-A', 'Jack in the Box', 'Shake Shack', 'In-N-Out Burger', 'Five Guys', 'McDonald\'s', 'Arby\'s', 'Wendy\'s', 'Steak \地 Shake')
GROUP BY name, city
Having count>1
order by name, count DESC;


## Foot traffic
CREATE TABLE occur AS
SELECT name,
(LENGTH(checkindate) - LENGTH(REPLACE(checkindate, '2010', '')))/LENGTH('2010') AS count_2010,
(LENGTH(checkindate) - LENGTH(REPLACE(checkindate, '2011', '')))/LENGTH('2011') AS count_2011,
(LENGTH(checkindate) - LENGTH(REPLACE(checkindate, '2012', '')))/LENGTH('2012') AS count_2012,
(LENGTH(checkindate) - LENGTH(REPLACE(checkindate, '2013', '')))/LENGTH('2013') AS count_2013,
(LENGTH(checkindate) - LENGTH(REPLACE(checkindate, '2013', '')))/LENGTH('2014') AS count_2014,
(LENGTH(checkindate) - LENGTH(REPLACE(checkindate, '2013', '')))/LENGTH('2015') AS count_2015,
(LENGTH(checkindate) - LENGTH(REPLACE(checkindate, '2013', '')))/LENGTH('2016') AS count_2016,
(LENGTH(checkindate) - LENGTH(REPLACE(checkindate, '2013', '')))/LENGTH('2017') AS count_2017,
(LENGTH(checkindate) - LENGTH(REPLACE(checkindate, '2013', '')))/LENGTH('2018') AS count_2018
FROM (select * from business
WHERE name IN ('Burger King', 'Chick-fil-A', 'Jack in the Box', 'Shake Shack', 'In-N-Out Burger', 'Five Guys', 'McDonald\'s', 'Arby\'s', 'Wendy\'s', 'Steak \地 Shake')) q
JOIN checkin ON q.business_id = checkin.business_id;

SELECT name, sum(count_2010) as sum_2010, sum(count_2011) as sum_2011, sum(count_2012) as sum_2012, sum(count_2013) as sum_2013, sum(count_2014) as sum_2014, sum(count_2015) as sum_2015, sum(count_2016) as sum_2016, sum(count_2017) as sum_2017, sum(count_2018) as sum_2018
FROM occur
GROUP BY name;