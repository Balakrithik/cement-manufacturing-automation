select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Sep_Amp)) as min from data;

/* MAX */
select max(abs(Sep_Amp)) as max from data;

/* MEAN */
select avg(abs(Sep_Amp)) as Mean from data;

/*  MEDIAN */
SELECT Sep_Amp AS median_Sep_Amp
FROM (
    SELECT Sep_Amp, ROW_NUMBER() OVER (ORDER BY Sep_Amp) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Sep_Amp AS mode_Sep_Amp
FROM (
    SELECT Sep_Amp, COUNT(*) AS frequency
    FROM data
    GROUP BY Sep_Amp
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Sep_Amp) AS Sep_Amp_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Sep_Amp) AS Sep_Amp_std
FROM data;

/*  RANGE */
SELECT MAX(Sep_Amp) - MIN(Sep_Amp) AS Sep_Amp_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Sep_Amp - (SELECT AVG(Sep_Amp) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Amp) FROM data), 3))
    ) AS Sep_Amp_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Sep_Amp - (SELECT AVG(Sep_Amp) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Amp) FROM data), 4))) - 3
    ) AS Sep_Amp_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Sep_Amp - (SELECT AVG(Sep_Amp) FROM data)) > 3 * (SELECT stddev(Sep_Amp) FROM data);