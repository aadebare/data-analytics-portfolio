CREATE DATABASE IF NOT EXISTS cqc_analysis;
USE cqc_analysis;
SELECT COUNT(*)
FROM cqc_rated_carehomes;

SELECT *
FROM cqc_rated_carehomes LIMIT 10;


##Business Question 1:
#"What is the national rating distribution of care homes in England?"

SELECT `Location Latest Overall Rating` AS Ratings, COUNT(*) AS Total_Homes, ROUND(COUNT(*) * 100.0/(SELECT COUNT(*) FROM cqc_rated_carehomes), 1) AS Percentage
FROM cqc_rated_carehomes
GROUP BY Ratings
ORDER BY Total_Homes DESC;

##Business Question 2:
##"Which regions have the highest proportion of Outstanding care homes?"

SELECT `Location Region` AS Region, COUNT(*) AS Total_homes, SUM(CASE WHEN `Location Latest Overall Rating` = 'Outstanding' THEN 1 ELSE 0 END) Outstanding_count, ROUND(
SUM(CASE WHEN `Location Latest Overall Rating` = 'Outstanding' THEN 1 ELSE 0 END) *100/ COUNT(*), 1  ) AS Outstanding_Percentage
FROM cqc_rated_carehomes
GROUP BY Region
ORDER BY Outstanding_Percentage DESC
;


##Q3 — "How Does West Sussex Compare To The National Average?"

#SELECT `Location Latest Overall Rating` AS Ratings, COUNT(*) AS Total_homes, 
#ROUND(COUNT(*) * 100.0/(SELECT COUNT(*) FROM cqc_rated_carehomes WHERE `Location Local Authority` = 'West Sussex'), 1) AS Ws_Percentage
#FROM cqc_rated_carehomes
#WHERE `Location Local Authority` = 'West Sussex'
#GROUP BY `Location Latest Overall Rating`;

SELECT `Location Latest Overall Rating` AS Ratings,
COUNT(*) AS National_Total_Homes, 
ROUND(COUNT(*) * 100.0/(SELECT COUNT(*) FROM cqc_rated_carehomes), 1) AS National_Percentage,
SUM(CASE WHEN `Location Local Authority` = 'West Sussex' THEN 1 ELSE 0 END) AS West_Sussex_Total_homes,
ROUND(SUM(CASE WHEN `Location Local Authority` = 'West Sussex' THEN 1 ELSE 0 END) * 100.0 /
(SELECT COUNT(*) FROM cqc_rated_carehomes WHERE `Location Local Authority` = 'West Sussex'), 1
) AS West_Sussex_Percentage
FROM cqc_rated_carehomes
GROUP BY `Location Latest Overall Rating`
ORDER BY National_Total_Homes DESC;


##Business Question 4:
##"Which Local Authorities have the most Inadequate care homes?"

SELECT `Location Local Authority`,`Location Latest Overall Rating`, COUNT(*) AS Total_Count
FROM cqc_rated_carehomes
WHERE `Location Latest Overall Rating`= 'Inadequate'
GROUP BY `Location Latest Overall Rating`, `Location Local Authority`
ORDER BY Total_Count DESC 
LIMIT 10;



##Business Question 5:
##"What is the rating breakdown for nursing homes vs residential homes?"

SELECT `Location Latest Overall Rating`, COUNT(*) AS Total_rating,
SUM(CASE WHEN `Service type - Care home service with nursing` = 'Y' 
AND `Service type - Care home service without nursing` IS NULL
OR `Service type - Care home service without nursing` = '' THEN 1 ELSE 0 END) AS Nursing_homes,

SUM(CASE WHEN `Service type - Care home service without nursing` = 'Y' 
AND `Service type - Care home service with nursing` IS NULL 
OR `Service type - Care home service with nursing` = '' THEN 1 ELSE 0 END) AS Residential_homes,

SUM(CASE WHEN `Service type - Care home service with nursing` = 'Y' 
AND `Service type - Care home service without nursing` = 'Y' THEN 1 ELSE 0 END) AS Both_homes
FROM cqc_rated_carehomes
GROUP BY `Location Latest Overall Rating`
ORDER BY Total_rating DESC;


##Business Question 6:
##"Rank regions by their percentage of Outstanding homes"

WITH Region_Stats AS(
SELECT `Location Region` AS Region, COUNT(*) AS Total_homes, SUM(CASE WHEN `Location Latest Overall Rating` = 'Outstanding' THEN 1 ELSE 0 END) Outstanding_count, ROUND(
SUM(CASE WHEN `Location Latest Overall Rating` = 'Outstanding' THEN 1 ELSE 0 END) *100/ COUNT(*), 1  ) AS Outstanding_Percentage
FROM cqc_rated_carehomes
GROUP BY Region
)
SELECT *,
RANK() OVER(ORDER BY Outstanding_Percentage DESC) AS Region_Rank
FROM Region_Stats
;


##Business Question 7:
##"Show a running total of care homes per region — ordered alphabetically"

WITH region_total AS(
SELECT `Location Region` AS Region, COUNT(*) AS Total_homes
FROM cqc_rated_carehomes
GROUP BY `Location Region`
)
SELECT Region, Total_homes, SUM(Total_homes) OVER(ORDER BY Region) AS Running_total
FROM region_total
;

























SELECT *
FROM cqc_rated_carehomes;





