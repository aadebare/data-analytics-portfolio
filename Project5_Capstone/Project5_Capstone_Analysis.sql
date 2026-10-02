CREATE DATABASE IF NOT EXISTS goldcare_capstone;
USE goldcare_capstone;

SHOW TABLES;
SELECT COUNT(*) FROM goldcare_capstone;
SELECT * FROM goldcare_capstone LIMIT 3;

##-- Q1: Which regions have the highest crisis score?
##-- Crisis Score = Vacancy Rate + Requires Improvement % + Inadequate %
SELECT 
    Region,
    Vacancy_Rate_Pct,
    Requires_Improvement_Pct,
    Inadequate_Pct,
    ROUND(Vacancy_Rate_Pct + Requires_Improvement_Pct + Inadequate_Pct, 1) AS Crisis_Score
FROM goldcare_capstone
ORDER BY Crisis_Score DESC;


##-- Q2: Which regions face the greatest combined workforce pressure?
SELECT 
    Region,
    NHS_Leavers_Annual,
    Annual_Leavers AS Care_Worker_Leavers,
    Vacancy_Rate_Pct,
    (NHS_Leavers_Annual + Annual_Leavers) AS Total_Workforce_Pressure
FROM goldcare_capstone
ORDER BY Total_Workforce_Pressure DESC;


##-- Q3: How much could each region save by switching to GoldCare Connect?
SELECT 
    Region,
    Total_Care_Homes,
    Total_Agency_Cost,
    Total_Platform_Cost,
    Total_Saving,
    ROUND(Total_Saving * 100.0 / Total_Agency_Cost, 1) AS Saving_Pct
FROM goldcare_capstone
ORDER BY Total_Saving DESC;


##-- Q4: Rank regions by expansion priority using RANK()
WITH Priority_CTE AS (
    SELECT 
        Region,
        Total_Care_Homes,
        Vacancy_Rate_Pct,
        Turnover_Rate_Pct,
        Total_Saving,
        ROUND(
            (Total_Care_Homes / 2579.0 * 40) +
            (Vacancy_Rate_Pct / 9.5 * 30) +
            (Turnover_Rate_Pct / 27.9 * 30), 1
        ) AS Priority_Score
    FROM goldcare_capstone
)
SELECT *,
    RANK() OVER (ORDER BY Priority_Score DESC) AS Priority_Rank
FROM Priority_CTE
ORDER BY Priority_Rank;



-- Q5: Running total of national savings as regions adopt GoldCare Connect
-- Ordered by priority (South East first)
WITH Ranked AS (
    SELECT 
        Region,
        Total_Care_Homes,
        Total_Saving,
        ROUND(
            (Total_Care_Homes / 2579.0 * 40) +
            (Vacancy_Rate_Pct / 9.5 * 30) +
            (Turnover_Rate_Pct / 27.9 * 30), 1
        ) AS Priority_Score
    FROM goldcare_capstone
)
SELECT 
    Region,
    Total_Care_Homes,
    Total_Saving,
    Priority_Score,
    SUM(Total_Saving) OVER (ORDER BY Priority_Score DESC) AS Cumulative_National_Saving
FROM Ranked
ORDER BY Priority_Score DESC;













