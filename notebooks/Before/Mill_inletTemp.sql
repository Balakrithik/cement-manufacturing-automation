use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Mill_inletTemp)) as min from data;

/* MAX */
select max(abs(Mill_inletTemp)) as max from data;

/* MEAN */
select avg(abs(Mill_inletTemp)) as Mean from data;

/*  MEDIAN */
SELECT Mill_inletTemp AS median_Mill_inletTemp
FROM (
    SELECT Mill_inletTemp, ROW_NUMBER() OVER (ORDER BY Mill_inletTemp) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Mill_inletTemp AS mode_Mill_inletTemp
FROM (
    SELECT Mill_inletTemp, COUNT(*) AS frequency
    FROM data
    GROUP BY Mill_inletTemp
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Mill_inletTemp) AS Mill_inletTemp_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Mill_inletTemp) AS Mill_inletTemp_std
FROM data;

/*  RANGE */
SELECT MAX(Mill_inletTemp) - MIN(Mill_inletTemp) AS Mill_inletTemp_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Mill_inletTemp - (SELECT AVG(Mill_inletTemp) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_inletTemp) FROM data), 3))
    ) AS Mill_inletTemp_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Mill_inletTemp - (SELECT AVG(Mill_inletTemp) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_inletTemp) FROM data), 4))) - 3
    ) AS Mill_inletTemp_kurtosis  FROM data;
    
        
/* Outliers */
SELECT count(*) FROM data WHERE (Mill_inletTemp - (SELECT AVG(Mill_inletTemp) FROM data)) > 3 * (SELECT stddev(Mill_inletTemp) FROM data);