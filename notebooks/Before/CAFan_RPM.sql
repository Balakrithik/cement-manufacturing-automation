select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(CAFan_RPM)) as min from data;

/* MAX */
select max(abs(CAFan_RPM)) as max from data;

/* MEAN */
select avg(abs(CAFan_RPM)) as Mean from data;

/*  MEDIAN */
SELECT CAFan_RPM AS median_CAFan_RPM
FROM (
    SELECT CAFan_RPM, ROW_NUMBER() OVER (ORDER BY CAFan_RPM) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT CAFan_RPM AS mode_CAFan_RPM
FROM (
    SELECT CAFan_RPM, COUNT(*) AS frequency
    FROM data
    GROUP BY CAFan_RPM
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(CAFan_RPM) AS CAFan_RPM_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(CAFan_RPM) AS CAFan_RPM_std
FROM data;

/*  RANGE */
SELECT MAX(CAFan_RPM) - MIN(CAFan_RPM) AS CAFan_RPM_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(CAFan_RPM - (SELECT AVG(CAFan_RPM) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(CAFan_RPM) FROM data), 3))
    ) AS CAFan_RPM_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(CAFan_RPM - (SELECT AVG(CAFan_RPM) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(CAFan_RPM) FROM data), 4))) - 3
    ) AS CAFan_RPM_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (CAFan_RPM - (SELECT AVG(CAFan_RPM) FROM data)) > 3 * (SELECT stddev(CAFan_RPM) FROM data);