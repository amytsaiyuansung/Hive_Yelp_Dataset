#####Average Rating#####
##Average rating ordering by state
SELECT name, state, avg(stars) AS star_avg 
FROM business 
WHERE is_open = 1 AND name IN ('Burger King', 'Chick-fil-A', 'Jack in the Box', 'Shake Shack', 'In-N-Out Burger', 'Five Guys', 'McDonald\'s', 'Arby\'s', 'Wendy\'s', 'Steak \地 Shake')
GROUP BY name, state
ORDER BY state, star_avg DESC;

##Average rating ordering by avg(stars)
SELECT name, state, avg(stars) AS star_avg 
FROM business 
WHERE is_open = 1 AND name IN ('Burger King', 'Chick-fil-A', 'Jack in the Box', 'Shake Shack', 'In-N-Out Burger', 'Five Guys', 'McDonald\'s', 'Arby\'s', 'Wendy\'s', 'Steak \地 Shake')
GROUP BY name, state
ORDER BY star_avg DESC;

##Average rating ordering by name
SELECT name, state, avg(stars) AS star_avg 
FROM business 
WHERE is_open = 1 AND name IN ('Burger King', 'Chick-fil-A', 'Jack in the Box', 'Shake Shack', 'In-N-Out Burger', 'Five Guys', 'McDonald\'s', 'Arby\'s', 'Wendy\'s', 'Steak \地 Shake')
GROUP BY name, state
ORDER BY name, star_avg DESC;


#####Reivews#####
## Total reviews Table
CREATE VIEW total AS 
SELECT name, state, avg(review_count) AS review_avg 
FROM business 
WHERE is_open = 1 AND name IN ('Burger King', 'Chick-fil-A', 'Jack in the Box', 'Shake Shack', 'In-N-Out Burger', 'Five Guys', 'McDonald\'s', 'Arby\'s', 'Wendy\'s', 'Steak \地 Shake')
GROUP BY name, state;

##Average number of reviews by name
SELECT * 
FROM total 
ORDER BY name, review_avg DESC;

##Average number of reviews by review_avg
SELECT * FROM total 
ORDER BY review_avg DESC;

## Positive Reviews Table
CREATE VIEW positive AS 
SELECT name, state, avg(pos_review) AS pos_avg
FROM (SELECT review.business_id, business.name, business.state, Count(review.stars) AS pos_review FROM business
join review on business.business_id = review.business_id
where business.is_open =1 AND review.stars > 3 AND business.name IN ('Burger King', 'Chick-fil-A', 'Jack in the Box', 'Shake Shack', 'In-N-Out Burger', 'Five Guys', 'McDonald\'s', 'Arby\'s', 'Wendy\'s', 'Steak \地 Shake')
GROUP BY review.business_id, business.name, business.state)sub
GROUP BY name, state;

##Average nercentage of positive reviews by name
SELECT positive.name, positive.state, (positive.pos_avg/total.review_avg) AS pos_review 
FROM positive
JOIN total ON total.name = positive.name AND total.state = positive.state
ORDER BY name, pos_review DESC;


##Average percentage of positive reviews by pos_review
SELECT positive.name, positive.state, (positive.pos_avg/total.review_avg) AS pos_review 
FROM positive
JOIN total ON total.name = positive.name AND total.state = positive.state
ORDER BY pos_review DESC;


## Negative Reviews Table
CREATE VIEW negative AS 
SELECT name, state, avg(neg_review) AS neg_avg
FROM (SELECT review.business_id, business.name, business.state, Count(review.stars) AS neg_review FROM business
join review on business.business_id = review.business_id
where business.is_open =1 AND review.stars < 3 AND business.name IN ('Burger King', 'Chick-fil-A', 'Jack in the Box', 'Shake Shack', 'In-N-Out Burger', 'Five Guys', 'McDonald\'s', 'Arby\'s', 'Wendy\'s', 'Steak \地 Shake')
GROUP BY review.business_id, business.name, business.state)subn
GROUP BY name, state;

##Average percentage of negative reviews by name
SELECT negative.name, negative.state, (negative.neg_avg/total.review_avg) AS neg_review 
FROM negative
JOIN total ON total.name = negative.name AND total.state = negative.state
ORDER BY name, neg_review DESC;

##Average percentage of negative reviews by neg_review
SELECT negative.name, negative.state, (negative.neg_avg/total.review_avg) AS neg_review 
FROM negative
JOIN total ON total.name = negative.name AND total.state = negative.state
ORDER neg_review DESC;
