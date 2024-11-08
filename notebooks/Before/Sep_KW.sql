select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Sep_KW)) as min from data;

/* MAX */
select max(abs(Sep_KW)) as max from data;

/* MEAN */
select avg(abs(Sep_KW)) as Mean from data;

/*  MEDIAN */
SELECT Sep_KW AS median_Sep_KW
FROM (
    SELECT Sep_KW, ROW_NUMBER() OVER (ORDER BY Sep_KW) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Sep_KW AS mode_Sep_KW
FROM (
    SELECT Sep_KW, COUNT(*) AS frequency
    FROM data
    GROUP BY Sep_KW
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Sep_KW) AS Sep_KW_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Sep_KW) AS Sep_KW_std
FROM data;

/*  RANGE */
SELECT MAX(Sep_KW) - MIN(Sep_KW) AS Sep_KW_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Sep_KW - (SELECT AVG(Sep_KW) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_KW) FROM data), 3))
    ) AS Sep_KW_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Sep_KW - (SELECT AVG(Sep_KW) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_KW) FROM data), 4))) - 3
    ) AS Sep_KW_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Sep_KW - (SELECT AVG(Sep_KW) FROM data)) > 3 * (SELECT stddev(Sep_KW) FROM data);