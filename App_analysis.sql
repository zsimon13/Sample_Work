CREATE TABLE apple_store_description_combined AS

Select * FROM appleStore_description1
UNION ALL
Select * FROM appleStore_description2
UNION ALL
Select * FROM appleStore_description3
UNION ALL
Select * FROM appleStore_description4


--EDA--AppleStore--
--Check number of unique apps in both tables--AppleStore

SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROM AppleStore

SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROM apple_store_description_combined

--Check for any missing values--
SELECT COUNT(*) AS MissingValues
FROM AppleStore
where track_name is null or user_rating is null or prime_genre is NULL

SELECT COUNT(*) AS MissingValues
FROM apple_store_description_combined
where app_desc is null 

--Find number of apps per genre--
SELECT prime_genre, count(*) as NumApps
from AppleStore
GROUP by prime_genre
order by NumApps DESC

--Get an overview of app ratings--AppleStore
SELECT min(user_rating) As MinRating,
	   max(user_rating) as MaxRating,
       avg(user_rating) as AvgRating
FROM AppleStore

--Data Analysis--
--Determine wheteher paid apps have a higher rating than free apps--
SELECT case 
		when price > 0 then 'Paid'
	    else 'Free'
	end as App_Type,
    avg(user_rating) as Avg_Rating
from AppleStore
group by App_Type

--Determine if apps with more available languages affect app ratings--
select CASE
		when lang_num < 10 then '<10 languages'
        WHEN lang_num BETWEEN 10 and 30 then '10-30 languages'
        else '>30 languages'
	end as language_bucket,
    avg(user_rating) as Avg_Rating
FROM AppleStore
group by language_bucket
order by Avg_Rating DESC

--Check for genere with low ratings-- 
SELECT prime_genre,
	avg(user_rating) as Avg_Rating
from AppleStore
group by prime_genre
order by Avg_Rating DESC
LIMIT 10

--Check if there correlatiopn between description length and user rating--
SELECT CASE
		when length(b.app_desc) <500 then 'Short'
        when length(b.app_desc) between 500 and 1000 then 'Medium'
        else 'Long'
	end as description_length_bucket,
    avg(a.user_rating) as average_rating
FROM AppleStore as a
join apple_store_description_combined as b 
on a.id = b.id
GROUP by description_length_bucket
order by average_rating DESC

--Check the top rated apps for each genre-- 
SELECT
	prime_genre,
    track_name,
    user_rating
FROM (
  	SELECT
  	prime_genre,
  	track_name,
  	user_rating,
  	RANK() OVER(PARTITION by prime_genre order by user_rating DEsc, rating_count_tot DESC) AS rank FROM AppleStore) as a
WHERE a.rank = 1