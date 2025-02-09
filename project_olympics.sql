CREATE DATABASE proj;

USE proj;

SHOW VARIABLES LIKE "secure_file_priv";

create table olympics
(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(500),
NOC varchar(500),
Games varchar (500),
Year int,
Season varchar(500),
City varchar(200),
Sport varchar(300),
Event varchar(800),
Medal varchar(200)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/Athletes_Transformed.csv"
INTO TABLE olympics
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY "\r\n"
IGNORE 1 ROWS;

SELECT * FROM olympics
LIMIT 100;


-- 1. Show how many medal counts present for entire data

select medal,count(medal) as Medal_count
from olympics
group by medal;



-- 2. Show count of unique sports present in Olympics

 select distinct sport,count(sport) as Sport_count
from olympics
group by sport;

select count(distinct (sport)) as Sport_count
from olympics;
 


-- 3. Show how many different medals won by team India

SELECT medal,COUNT(medal) as medalcount 
FROM olympics
WHERE TEAM="India" and medal<>"nomedal"
GROUP BY medal;

-- 4. Show event wise medals won by India show from highest to lowest medals won in order

SELECT event,COUNT(medal) as medalcount
FROM olympics
WHERE TEAM="India"
GROUP BY event
ORDER BY medalcount DESC;

-- 5. Show event wise medals won by India in order of year

SELECT year,event,COUNT(medal) as medalcount
FROM olympics
WHERE TEAM="India"
GROUP BY year,event
ORDER BY year;


-- 6. show country who won maximum medals.

SELECT team, COUNT(medal) as medalcount
 FROM olympics
 GROUP BY team
 ORDER BY medalcount DESC
 LIMIT 1;

-- 7.show top 10 countries whowon gold

SELECT team,count(medal) as goldmedal
FROM olympics
WHERE medal= "gold"
GROUP BY team
ORDER BY goldmedal DESC
LIMIT 10;



--  8. show in which year did United states won most gold medal

SELECT year,COUNT(medal) as maxgold
FROM olympics
WHERE medal="gold" and team="united states"
GROUP BY year
ORDER BY maxgold DESC
LIMIT 1;

-- 9. In which sports United States has most medals.

SELECT sport, COUNT(medal) as medalcount
FROM olympics
WHERE team="united states"
GROUP BY sport
ORDER BY medalcount DESC;

-- 10. Find top three players who won most medals along with their sports and country

SELECT name,team,sport, COUNT(medal) as mostmedal FROM olympics
GROUP BY name,sport,team
ORDER BY mostmedal DESC
limit 3;


-- 11. Find player with most gold medals in cycling along with his country.

 SELECT name,team, COUNT(medal) as most_gold
 FROM olympics
 WHERE sport="cycling" and medal="gold"
 GROUP BY team,name
 ORDER BY most_gold DESC
 LIMIT 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.

SELECT team,name,COUNT(medal) as mostmedals
FROM olympics
WHERE sport="basketball" and Medal <> "NoMedal"
GROUP BY team,name
ORDER BY mostmedals DESC
LIMIT 10;


-- 13. Find out the count of different medals of the top basketball player Teresa Edwards

SELECT medal,COUNT(medal) as medalcount
FROM olympics
WHERE sport= "basketball" and name="teresa edwards"
GROUP BY medal;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel

SELECT year,sex, COUNT(medal) as medal_count
FROM olympics
GROUP BY year,sex
ORDER BY medal_count;

