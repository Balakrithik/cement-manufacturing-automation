select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Residue)) as min from data;

/* MAX */
select max(abs(Residue)) as max from data;

/* MEAN */
select avg(abs(Residue)) as Mean from data;

/*  MEDIAN */
SELECT Residue AS median_Residue
FROM (
    SELECT Residue, ROW_NUMBER() OVER (ORDER BY Residue) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Residue AS mode_Residue
FROM (
    SELECT Residue, COUNT(*) AS frequency
    FROM data
    GROUP BY Residue
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Residue) AS Residue_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Residue) AS Residue_std
FROM data;

/*  RANGE */
SELECT MAX(Residue) - MIN(Residue) AS Residue_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Residue - (SELECT AVG(Residue) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Residue) FROM data), 3))
    ) AS Residue_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Residue - (SELECT AVG(Residue) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Residue) FROM data), 4))) - 3
    ) AS Residue_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Residue - (SELECT AVG(Residue) FROM data)) > 3 * (SELECT stddev(Residue) FROM data);