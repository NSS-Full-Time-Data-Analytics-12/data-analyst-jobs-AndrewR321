SELECT *
FROM data_analyst_jobs;

---1.	How many rows are in the data_analyst_jobs table?
SELECT count (*)
FROM data_analyst_jobs;
---1793

---2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT company
FROM data_analyst_jobs
LIMIT 10;
---"ExxonMobil"

---3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT(DISTINCT title), location
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY'
GROUP BY location;
---17,5

---4.	How many postings in Tennessee have a star rating above 4?
SELECT location, 
	COUNT(CASE WHEN star_rating > 4 THEN star_rating END)
FROM data_analyst_jobs
WHERE location ='TN'
GROUP BY location;
---3

---5.	How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
---151

---6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT location, AVG(star_rating)
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY AVG DESC;
---NE

---7.	Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;
---881

---8.	How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';
---230

---9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT company, AVG(star_rating)AS avg_star_rating, SUM(review_count)AS sum_reviews
FROM data_analyst_jobs	
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company
ORDER BY sum_reviews DESC;

---10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT COUNT(DISTINCT company)
FROM data_analyst_jobs	
WHERE review_count > 5000;
---40

SELECT company, AVG(star_rating)AS avg_star_rating, SUM(review_count)AS sum_reviews
FROM data_analyst_jobs	
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company
ORDER BY avg_star_rating DESC;

---11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';
---1669

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';
---774

---12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%' AND title NOT ILIKE '%analytics';
---54

SELECT domain, title, days_since_posting,
	CASE WHEN days_since_posting > 21 THEN 'hard_to_fill'END
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' AND domain IS NOT NULL AND days_since_posting > 21
ORDER BY days_since_posting DESC;

SELECT domain AS depart, COUNT(title)
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%' AND domain IS NOT NULL AND days_since_posting > 21
GROUP BY domain
ORDER BY COUNT(title) DESC
LIMIT 4;







