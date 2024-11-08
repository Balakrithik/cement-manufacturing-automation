use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Mill_KW)) as min from data;

/* MAX */
select max(abs(Mill_KW)) as max from data;

/* MEAN */
select avg(abs(Mill_KW)) as Mean from data;

/*  MEDIAN */
SELECT Mill_KW AS median_Mill_KW
FROM (
    SELECT Mill_KW, ROW_NUMBER() OVER (ORDER BY Mill_KW) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Mill_KW AS mode_Mill_KW
FROM (
    SELECT Mill_KW, COUNT(*) AS frequency
    FROM data
    GROUP BY Mill_KW
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Mill_KW) AS Mill_KW_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Mill_KW) AS Mill_KW_std
FROM data;

/*  RANGE */
SELECT MAX(Mill_KW) - MIN(Mill_KW) AS Mill_KW_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Mill_KW - (SELECT AVG(Mill_KW) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_KW) FROM data), 3))
    ) AS Mill_KW_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Mill_KW - (SELECT AVG(Mill_KW) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_KW) FROM data), 4))) - 3
    ) AS Mill_KW_kurtosis  FROM data;
        
/* Outliers */
SELECT count(*) FROM data WHERE (Mill_KW - (SELECT AVG(Mill_KW) FROM data)) > 3 * (SELECT stddev(Mill_KW) FROM data);