use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Mill_VentBF_inletDraft)) as min from data;

/* MAX */
select max(abs(Mill_VentBF_inletDraft)) as max from data;

/* MEAN */
select avg(abs(Mill_VentBF_inletDraft)) as Mean from data;

/*  MEDIAN */
SELECT Mill_VentBF_inletDraft AS median_Mill_VentBF_inletDraft
FROM (
    SELECT Mill_VentBF_inletDraft, ROW_NUMBER() OVER (ORDER BY Mill_VentBF_inletDraft) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Mill_VentBF_inletDraft AS mode_Mill_VentBF_inletDraft
FROM (
    SELECT Mill_VentBF_inletDraft, COUNT(*) AS frequency
    FROM data
    GROUP BY Mill_VentBF_inletDraft
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Mill_VentBF_inletDraft) AS Mill_VentBF_inletDraft_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Mill_VentBF_inletDraft) AS Mill_VentBF_inletDraft_std
FROM data;

/*  RANGE */
SELECT MAX(Mill_VentBF_inletDraft) - MIN(Mill_VentBF_inletDraft) AS Mill_VentBF_inletDraft_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Mill_VentBF_inletDraft - (SELECT AVG(Mill_VentBF_inletDraft) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_VentBF_inletDraft) FROM data), 3))
    ) AS Mill_VentBF_inletDraft_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Mill_VentBF_inletDraft - (SELECT AVG(Mill_VentBF_inletDraft) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_VentBF_inletDraft) FROM data), 4))) - 3
    ) AS Mill_VentBF_inletDraft_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Mill_VentBF_inletDraft - (SELECT AVG(Mill_VentBF_inletDraft) FROM data)) > 3 * (SELECT stddev(Mill_VentBF_inletDraft) FROM data);