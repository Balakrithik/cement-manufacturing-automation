select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Mill_soundnoise)) as min from data;

/* MAX */
select max(abs(Mill_soundnoise)) as max from data;

/* MEAN */
select avg(abs(Mill_soundnoise)) as Mean from data;

/*  MEDIAN */
SELECT Mill_soundnoise AS median_Mill_soundnoise
FROM (
    SELECT Mill_soundnoise, ROW_NUMBER() OVER (ORDER BY Mill_soundnoise) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Mill_soundnoise AS mode_Mill_soundnoise
FROM (
    SELECT Mill_soundnoise, COUNT(*) AS frequency
    FROM data
    GROUP BY Mill_soundnoise
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Mill_soundnoise) AS Mill_soundnoise_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Mill_soundnoise) AS Mill_soundnoise_std
FROM data;

/*  RANGE */
SELECT MAX(Mill_soundnoise) - MIN(Mill_soundnoise) AS Mill_soundnoise_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Mill_soundnoise - (SELECT AVG(Mill_soundnoise) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_soundnoise) FROM data), 3))
    ) AS Mill_soundnoise_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Mill_soundnoise - (SELECT AVG(Mill_soundnoise) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_soundnoise) FROM data), 4))) - 3
    ) AS Mill_soundnoise_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Mill_soundnoise - (SELECT AVG(Mill_soundnoise) FROM data)) > 3 * (SELECT stddev(Mill_soundnoise) FROM data);