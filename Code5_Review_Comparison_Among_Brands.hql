## McDonald's
CREATE VIEW MD_rev AS
SELECT *
FROM review r
LEFT SEMI JOIN business b
ON (b.business_id = r.business_id
AND b.name LIKE 'McDonald\'s%');

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 2, 10))
AS bigrams
FROM MD_rev;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 3, 10))
AS trigrams
FROM MD_rev;

SELECT text, stars, useful, funny, cool
FROM MD_rev
WHERE text LIKE '%drive thr%'
ORDER BY useful DESC
LIMIT 5;



## Burger King
CREATE VIEW BK_rev AS
SELECT *
FROM review r
LEFT SEMI JOIN business b
ON (b.business_id = r.business_id
AND b.name LIKE 'Burger King%');

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 2, 10))
AS bigrams
FROM BK_rev;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 3, 10))
AS trigrams
FROM BK_rev;

SELECT text, stars, useful, funny, cool
FROM BK_rev
WHERE text LIKE '%drive thr%'
ORDER BY useful DESC
LIMIT 5;

SELECT text, stars, useful, funny, cool
FROM BK_rev
WHERE text LIKE '%drive thr%'
ORDER BY funny DESC
LIMIT 5;



## Wendy's
CREATE VIEW WD_rev AS
SELECT *
FROM review r
LEFT SEMI JOIN business b
ON (b.business_id = r.business_id
AND b.name LIKE 'Wendy\'s%');

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 2, 10))
AS bigrams
FROM WD_rev;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 3, 10))
AS trigrams
FROM WD_rev;

SELECT text, stars, useful, funny, cool
FROM WD_rev
WHERE text LIKE '%drive thr%'
ORDER BY useful DESC
LIMIT 5;



## Chick-fil-A
CREATE VIEW CF_rev AS
SELECT *
FROM review r
LEFT SEMI JOIN business b
ON (b.business_id = r.business_id
AND b.name LIKE 'Chick-fil-A%');

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 2, 10))
AS bigrams
FROM CF_rev;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 3, 10))
AS trigrams
FROM CF_rev;

SELECT text, stars, useful, funny, cool
FROM CF_rev
WHERE text LIKE '%drive thr%'
ORDER BY useful DESC
LIMIT 5;



## Steak and Shake
CREATE VIEW ST_rev AS
SELECT *
FROM review r
LEFT SEMI JOIN business b
ON (b.business_id = r.business_id
AND b.name LIKE 'Steak% Shake%');

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 2, 10))
AS bigrams
FROM ST_rev;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 3, 10))
AS trigrams
FROM ST_rev;

SELECT text, stars, useful, funny, cool
FROM ST_rev
WHERE text LIKE '%drive thr%'
ORDER BY useful DESC
LIMIT 5;

SELECT text, stars, useful, funny, cool
FROM ST_rev
WHERE text LIKE '%the food%'
ORDER BY useful DESC
LIMIT 5;



## Arby's
CREATE VIEW AB_rev AS
SELECT *
FROM review r
LEFT SEMI JOIN business b
ON (b.business_id = r.business_id
AND b.name LIKE 'Arby\'s%');

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 2, 10))
AS bigrams
FROM AB_rev;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 3, 10))
AS trigrams
FROM AB_rev;

SELECT text, stars, useful, funny, cool
FROM AB_rev
WHERE text LIKE '%drive thr%'
ORDER BY useful DESC
LIMIT 5;

SELECT text, stars, useful, funny, cool
FROM AB_rev
WHERE text LIKE '%roast beef sandwich%'
ORDER BY useful DESC
LIMIT 5;



## Five Guys
CREATE VIEW FG_rev AS
SELECT *
FROM review r
LEFT SEMI JOIN business b
ON (b.business_id = r.business_id
AND b.name LIKE 'Five Guys%');

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 2, 10))
AS bigrams
FROM FG_rev;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 3, 10))
AS trigrams
FROM FG_rev;

SELECT text, stars, useful, funny, cool
FROM FG_rev
WHERE text LIKE '%fries%'
ORDER BY useful DESC
LIMIT 5;



## Jack in the box
CREATE VIEW JB_rev AS
SELECT *
FROM review r
LEFT SEMI JOIN business b
ON (b.business_id = r.business_id
AND b.name LIKE 'Jack%ox');

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 2, 10))
AS bigrams
FROM JB_rev;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 3, 10))
AS trigrams
FROM JB_rev;

SELECT text, stars, useful, funny, cool
FROM JB_rev
WHERE text LIKE '%drive thr%'
ORDER BY useful DESC
LIMIT 5;



## Shake Shack
CREATE VIEW SS_rev AS
SELECT *
FROM review r
LEFT SEMI JOIN business b
ON (b.business_id = r.business_id
AND b.name LIKE '%Shake Shack%');

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 2, 10))
AS bigrams
FROM SS_rev;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 3, 10))
AS trigrams
FROM SS_rev;

SELECT text, stars, useful, funny, cool
FROM SS_rev
WHERE text LIKE '%in n out%'
ORDER BY useful DESC
LIMIT 5;

SELECT text, stars, useful, funny, cool
FROM SS_rev
WHERE text LIKE '%the burger%'
ORDER BY useful DESC
LIMIT 5;



## In-N-Out
CREATE VIEW IO_rev AS
SELECT *
FROM review r
LEFT SEMI JOIN business b
ON (b.business_id = r.business_id
AND b.name LIKE 'In%Out Burger');

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 2, 10))
AS bigrams
FROM IO_rev;

SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(text)), 3, 10))
AS trigrams
FROM IO_rev;

SELECT text, stars, useful, funny, cool
FROM IO_rev
WHERE text LIKE '%in phoenix%'
ORDER BY useful DESC
LIMIT 5;