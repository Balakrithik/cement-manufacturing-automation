use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(DFA_TPH)) as min from data;

/* MAX */
select max(abs(DFA_TPH)) as max from data;

/* MEAN */
select avg(abs(DFA_TPH)) as Mean from data;

/*  MEDIAN */
SELECT DFA_TPH AS median_DFA_TPH
FROM (
    SELECT DFA_TPH, ROW_NUMBER() OVER (ORDER BY DFA_TPH) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT DFA_TPH AS mode_DFA_TPH
FROM (
    SELECT DFA_TPH, COUNT(*) AS frequency
    FROM data
    GROUP BY DFA_TPH
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(DFA_TPH) AS DFA_TPH_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(DFA_TPH) AS DFA_TPH_std
FROM data;

/*  RANGE */
SELECT MAX(DFA_TPH) - MIN(DFA_TPH) AS DFA_TPH_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(DFA_TPH - (SELECT AVG(DFA_TPH) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(DFA_TPH) FROM data), 3))
    ) AS DFA_TPH_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(DFA_TPH - (SELECT AVG(DFA_TPH) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(DFA_TPH) FROM data), 4))) - 3
    ) AS DFA_TPH_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (DFA_TPH - (SELECT AVG(DFA_TPH) FROM data)) > 3 * (SELECT stddev(DFA_TPH) FROM data);