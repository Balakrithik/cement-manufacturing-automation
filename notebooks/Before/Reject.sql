select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Reject)) as min from data;

/* MAX */
select max(abs(Reject)) as max from data;

/* MEAN */
select avg(abs(Reject)) as Mean from data;

/*  MEDIAN */
SELECT Reject AS median_Reject
FROM (
    SELECT Reject, ROW_NUMBER() OVER (ORDER BY Reject) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Reject AS mode_Reject
FROM (
    SELECT Reject, COUNT(*) AS frequency
    FROM data
    GROUP BY Reject
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Reject) AS Reject_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Reject) AS Reject_std
FROM data;

/*  RANGE */
SELECT MAX(Reject) - MIN(Reject) AS Reject_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Reject - (SELECT AVG(Reject) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Reject) FROM data), 3))
    ) AS Reject_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Reject - (SELECT AVG(Reject) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Reject) FROM data), 4))) - 3
    ) AS Reject_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Reject - (SELECT AVG(Reject) FROM data)) > 3 * (SELECT stddev(Reject) FROM data);