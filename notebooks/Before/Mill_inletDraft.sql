select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Mill_inletDraft)) as min from data;

/* MAX */
select max(abs(Mill_inletDraft)) as max from data;

/* MEAN */
select avg(abs(Mill_inletDraft)) as Mean from data;

/*  MEDIAN */
SELECT Mill_inletDraft AS median_Mill_inletDraft
FROM (
    SELECT Mill_inletDraft, ROW_NUMBER() OVER (ORDER BY Mill_inletDraft) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Mill_inletDraft AS mode_Mill_inletDraft
FROM (
    SELECT Mill_inletDraft, COUNT(*) AS frequency
    FROM data
    GROUP BY Mill_inletDraft
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Mill_inletDraft) AS Mill_inletDraft_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Mill_inletDraft) AS Mill_inletDraft_std
FROM data;

/*  RANGE */
SELECT MAX(Mill_inletDraft) - MIN(Mill_inletDraft) AS Mill_inletDraft_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Mill_inletDraft - (SELECT AVG(Mill_inletDraft) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_inletDraft) FROM data), 3))
    ) AS Mill_inletDraft_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Mill_inletDraft - (SELECT AVG(Mill_inletDraft) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_inletDraft) FROM data), 4))) - 3
    ) AS Mill_inletDraft_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Mill_inletDraft - (SELECT AVG(Mill_inletDraft) FROM data)) > 3 * (SELECT stddev(Mill_inletDraft) FROM data);