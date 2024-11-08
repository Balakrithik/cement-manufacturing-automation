use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Mill_outletTemp)) as min from data;

/* MAX */
select max(abs(Mill_outletTemp)) as max from data;

/* MEAN */
select avg(abs(Mill_outletTemp)) as Mean from data;

/*  MEDIAN */
SELECT Mill_outletTemp AS median_Mill_outletTemp
FROM (
    SELECT Mill_outletTemp, ROW_NUMBER() OVER (ORDER BY Mill_outletTemp) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Mill_outletTemp AS mode_Mill_outletTemp
FROM (
    SELECT Mill_outletTemp, COUNT(*) AS frequency
    FROM data
    GROUP BY Mill_outletTemp
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Mill_outletTemp) AS Mill_outletTemp_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Mill_outletTemp) AS Mill_outletTemp_std
FROM data;

/*  RANGE */
SELECT MAX(Mill_outletTemp) - MIN(Mill_outletTemp) AS Mill_outletTemp_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Mill_outletTemp - (SELECT AVG(Mill_outletTemp) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_outletTemp) FROM data), 3))
    ) AS Mill_outletTemp_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Mill_outletTemp - (SELECT AVG(Mill_outletTemp) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_outletTemp) FROM data), 4))) - 3
    ) AS Mill_outletTemp_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Mill_outletTemp - (SELECT AVG(Mill_outletTemp) FROM data)) > 3 * (SELECT stddev(Mill_outletTemp) FROM data);