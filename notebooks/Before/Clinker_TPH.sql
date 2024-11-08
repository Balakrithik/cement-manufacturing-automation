use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Clinker_TPH)) as min from data;

/* MAX */
select max(abs(Clinker_TPH)) as max from data;

/* MEAN */
select avg(abs(Clinker_TPH)) as Mean from data;

/*  MEDIAN */
SELECT Clinker_TPH AS median_Clinker_TPH
FROM (
    SELECT Clinker_TPH, ROW_NUMBER() OVER (ORDER BY Clinker_TPH) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Clinker_TPH AS mode_Clinker_TPH
FROM (
    SELECT Clinker_TPH, COUNT(*) AS frequency
    FROM data
    GROUP BY Clinker_TPH
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Clinker_TPH) AS Clinker_TPH_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Clinker_TPH) AS Clinker_TPH_std
FROM data;

/*  RANGE */
SELECT MAX(Clinker_TPH) - MIN(Clinker_TPH) AS Clinker_TPH_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Clinker_TPH - (SELECT AVG(Clinker_TPH) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Clinker_TPH) FROM data), 3))
    ) AS Clinker_TPH_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Clinker_TPH - (SELECT AVG(Clinker_TPH) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Clinker_TPH) FROM data), 4))) - 3
    ) AS Clinker_TPH_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Clinker_TPH - (SELECT AVG(Clinker_TPH) FROM data)) > 3 * (SELECT stddev(Clinker_TPH) FROM data);