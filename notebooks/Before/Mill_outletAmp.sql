use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Mill_outletAmp)) as min from data;

/* MAX */
select max(abs(Mill_outletAmp)) as max from data;

/* MEAN */
select avg(abs(Mill_outletAmp)) as Mean from data;

/*  MEDIAN */
SELECT Mill_outletAmp AS median_Mill_outletAmp
FROM (
    SELECT Mill_outletAmp, ROW_NUMBER() OVER (ORDER BY Mill_outletAmp) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Mill_outletAmp AS mode_Mill_outletAmp
FROM (
    SELECT Mill_outletAmp, COUNT(*) AS frequency
    FROM data
    GROUP BY Mill_outletAmp
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Mill_outletAmp) AS Mill_outletAmp_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Mill_outletAmp) AS Mill_outletAmp_std
FROM data;

/*  RANGE */
SELECT MAX(Mill_outletAmp) - MIN(Mill_outletAmp) AS Mill_outletAmp_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Mill_outletAmp - (SELECT AVG(Mill_outletAmp) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_outletAmp) FROM data), 3))
    ) AS Mill_outletAmp_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Mill_outletAmp - (SELECT AVG(Mill_outletAmp) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_outletAmp) FROM data), 4))) - 3
    ) AS Mill_outletAmp_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Mill_outletAmp - (SELECT AVG(Mill_outletAmp) FROM data)) > 3 * (SELECT stddev(Mill_outletAmp) FROM data);