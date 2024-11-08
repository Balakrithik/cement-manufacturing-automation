use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(WFA_TPH)) as min from data;

/* MAX */
select max(abs(WFA_TPH)) as max from data;

/* MEAN */
select avg(abs(WFA_TPH)) as Mean from data;

/*  MEDIAN */
SELECT WFA_TPH AS median_WFA_TPH
FROM (
    SELECT WFA_TPH, ROW_NUMBER() OVER (ORDER BY WFA_TPH) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT WFA_TPH AS mode_WFA_TPH
FROM (
    SELECT WFA_TPH, COUNT(*) AS frequency
    FROM data
    GROUP BY WFA_TPH
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(WFA_TPH) AS WFA_TPH_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(WFA_TPH) AS WFA_TPH_std
FROM data;

/*  RANGE */
SELECT MAX(WFA_TPH) - MIN(WFA_TPH) AS WFA_TPH_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(WFA_TPH - (SELECT AVG(WFA_TPH) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(WFA_TPH) FROM data), 3))
    ) AS WFA_TPH_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(WFA_TPH - (SELECT AVG(WFA_TPH) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(WFA_TPH) FROM data), 4))) - 3
    ) AS WFA_TPH_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (WFA_TPH - (SELECT AVG(WFA_TPH) FROM data)) > 3 * (SELECT stddev(WFA_TPH) FROM data);