select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(CAFan_KW)) as min from data;

/* MAX */
select max(abs(CAFan_KW)) as max from data;

/* MEAN */
select avg(abs(CAFan_KW)) as Mean from data;

/*  MEDIAN */
SELECT CAFan_KW AS median_CAFan_KW
FROM (
    SELECT CAFan_KW, ROW_NUMBER() OVER (ORDER BY CAFan_KW) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT CAFan_KW AS mode_CAFan_KW
FROM (
    SELECT CAFan_KW, COUNT(*) AS frequency
    FROM data
    GROUP BY CAFan_KW
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(CAFan_KW) AS CAFan_KW_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(CAFan_KW) AS CAFan_KW_std
FROM data;

/*  RANGE */
SELECT MAX(CAFan_KW) - MIN(CAFan_KW) AS CAFan_KW_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(CAFan_KW - (SELECT AVG(CAFan_KW) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(CAFan_KW) FROM data), 3))
    ) AS CAFan_KW_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(CAFan_KW - (SELECT AVG(CAFan_KW) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(CAFan_KW) FROM data), 4))) - 3
    ) AS CAFan_KW_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (CAFan_KW - (SELECT AVG(CAFan_KW) FROM data)) > 3 * (SELECT stddev(CAFan_KW) FROM data);