select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Sep_ventbagfilter_fanrpm)) as min from data;

/* MAX */
select max(abs(Sep_ventbagfilter_fanrpm)) as max from data;

/* MEAN */
select avg(abs(Sep_ventbagfilter_fanrpm)) as Mean from data;

/*  MEDIAN */
SELECT Sep_ventbagfilter_fanrpm AS median_Sep_ventbagfilter_fanrpm
FROM (
    SELECT Sep_ventbagfilter_fanrpm, ROW_NUMBER() OVER (ORDER BY Sep_ventbagfilter_fanrpm) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Sep_ventbagfilter_fanrpm AS mode_Sep_ventbagfilter_fanrpm
FROM (
    SELECT Sep_ventbagfilter_fanrpm, COUNT(*) AS frequency
    FROM data
    GROUP BY Sep_ventbagfilter_fanrpm
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Sep_ventbagfilter_fanrpm) AS Sep_ventbagfilter_fanrpm_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Sep_ventbagfilter_fanrpm) AS Sep_ventbagfilter_fanrpm_std
FROM data;

/*  RANGE */
SELECT MAX(Sep_ventbagfilter_fanrpm) - MIN(Sep_ventbagfilter_fanrpm) AS Sep_ventbagfilter_fanrpm_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Sep_ventbagfilter_fanrpm - (SELECT AVG(Sep_ventbagfilter_fanrpm) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_ventbagfilter_fanrpm) FROM data), 3))
    ) AS Sep_ventbagfilter_fanrpm_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Sep_ventbagfilter_fanrpm - (SELECT AVG(Sep_ventbagfilter_fanrpm) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_ventbagfilter_fanrpm) FROM data), 4))) - 3
    ) AS Sep_ventbagfilter_fanrpm_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Sep_ventbagfilter_fanrpm - (SELECT AVG(Sep_ventbagfilter_fanrpm) FROM data)) > 3 * (SELECT stddev(Sep_ventbagfilter_fanrpm) FROM data);