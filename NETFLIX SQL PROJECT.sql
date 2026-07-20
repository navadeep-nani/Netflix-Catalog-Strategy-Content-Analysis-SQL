use netflix;

-- 1. What is the total number of 'Movies' and 'TV Shows' on Netflix?

select type,
count(*) as total_count
from netflix_data
group by type;

-- 2. Which country has produced the most content (Movies + TV Shows) on Netflix? List the top 5 countries.

select country,
count(*) as total_content
from netflix_data
where country is not null and country != ''
group by country
order by total_content desc
limit 5;

-- 3. Retrieve a list of all movies and TV shows released in the year 2020.

select title
from netflix_data
where release_year = 2020;

-- 4. What are the titles of all movies directed by 'Kirsten Johnson'?

select title
from netflix_data
where director = 'Kirsten Johnson';

 -- 5. Which content rating is the most common on Netflix? (Count of titles by rating).

select rating,
count(*) as total_count
from netflix_data
group by rating
order by total_count desc;

-- 6. Find the list of all 'TV Shows' that have 5 or more seasons.

select title,
cast(substring_index(duration, ' ', 1) as signed) as season_count
from netflix_data
where type = 'TV Show'
and cast(substring_index(duration, ' ', 1) as signed) >= 5
order by season_count desc,
title asc;

-- 7. List all the movies produced in 'India' that belong to the 'Comedies' category.

select title
from netflix_data
where country = 'India' and listed_in like '%Comedies%';

-- 8. How many new shows/movies were released each year? Sort the results in descending order of the release year.

select release_year,
count(*) as total_count
from netflix_data
group by release_year
order by release_year desc;

-- 9. Who are the top 5 directors with the highest number of directed movies (excluding 'Not Given')?

select director,
count(*) as total_movies
from netflix_data
where director != 'Not Given' and director is not null and director != '' and type = 'Movie'
group by director
order by total_movies desc
limit 5;

-- 10. In which year did Netflix add the highest amount of content to its platform?

select substring_index(date_added, '/', -1) as year_added,
count(*) as total_content
from netflix_data
group by year_added
order by total_content desc
limit 1;

-- 11. Which are the 5 oldest movies released in India on Netflix?

select title, release_year
from netflix_data
where type = 'Movie' and country = 'India'
order by release_year asc
limit 5;

-- 12. Find the titles of all movies listed as 'Documentaries' that were released after the year 2015.

select title, release_year
from netflix_data
where listed_in like '%Documentaries%' and release_year > 2015
order by release_year asc;

-- 13. Which movie has the longest duration in minutes on Netflix?

select title, duration
from netflix_data
where type = 'Movie'
order by cast(substring_index(duration,' ', 1) as signed) desc
limit 1;

-- 14. Identify the release years in which more than 50 movies from India were released.

select release_year,
count(*) as total_count
from netflix_data
where type = 'Movie' and country = 'India'
and country is not null and country != ''
group by release_year
having count(*) > 50
order by total_count desc;

-- 15. Find duplicate movie entries in the dataset to clean up the data. Display the movie title and release year.

select 
a.title, 
a.release_year
from netflix_data a
inner join netflix_data b 
on a.title = b.title 
and a.type = b.type
where a.type = 'Movie'
and a.show_id < b.show_id
and length(trim(a.title)) > 2;