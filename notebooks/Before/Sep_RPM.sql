
select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Sep_RPM)) as min from data;

/* MAX */
select max(abs(Sep_RPM)) as max from data;

/* MEAN */
select avg(abs(Sep_RPM)) as Mean from data;

/*  MEDIAN */
SELECT Sep_RPM AS median_Sep_RPM
FROM (
    SELECT Sep_RPM, ROW_NUMBER() OVER (ORDER BY Sep_RPM) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Sep_RPM AS mode_Sep_RPM
FROM (
    SELECT Sep_RPM, COUNT(*) AS frequency
    FROM data
    GROUP BY Sep_RPM
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Sep_RPM) AS Sep_RPM_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Sep_RPM) AS Sep_RPM_std
FROM data;

/*  RANGE */
SELECT MAX(Sep_RPM) - MIN(Sep_RPM) AS Sep_RPM_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Sep_RPM - (SELECT AVG(Sep_RPM) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_RPM) FROM data), 3))
    ) AS Sep_RPM_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Sep_RPM - (SELECT AVG(Sep_RPM) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_RPM) FROM data), 4))) - 3
    ) AS Sep_RPM_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Sep_RPM - (SELECT AVG(Sep_RPM) FROM data)) > 3 * (SELECT stddev(Sep_RPM) FROM data);