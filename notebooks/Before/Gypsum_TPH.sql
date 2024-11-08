use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Gypsum_TPH)) as min from data;

/* MAX */
select max(abs(Gypsum_TPH)) as max from data;

/* MEAN */
select avg(abs(Gypsum_TPH)) as Mean from data;

/*  MEDIAN */
SELECT Gypsum_TPH AS median_Gypsum_TPH
FROM (
    SELECT Gypsum_TPH, ROW_NUMBER() OVER (ORDER BY Gypsum_TPH) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Gypsum_TPH AS mode_Gypsum_TPH
FROM (
    SELECT Gypsum_TPH, COUNT(*) AS frequency
    FROM data
    GROUP BY Gypsum_TPH
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Gypsum_TPH) AS Gypsum_TPH_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Gypsum_TPH) AS Gypsum_TPH_std
FROM data;

/*  RANGE */
SELECT MAX(Gypsum_TPH) - MIN(Gypsum_TPH) AS Gypsum_TPH_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Gypsum_TPH - (SELECT AVG(Gypsum_TPH) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Gypsum_TPH) FROM data), 3))
    ) AS Gypsum_TPH_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Gypsum_TPH - (SELECT AVG(Gypsum_TPH) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Gypsum_TPH) FROM data), 4))) - 3
    ) AS Gypsum_TPH_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Gypsum_TPH - (SELECT AVG(Gypsum_TPH) FROM data)) > 3 * (SELECT stddev(Gypsum_TPH) FROM data);