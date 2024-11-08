select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Mill_outletDraft)) as min from data;

/* MAX */
select max(abs(Mill_outletDraft)) as max from data;

/* MEAN */
select avg(abs(Mill_outletDraft)) as Mean from data;

/*  MEDIAN */
SELECT Mill_outletDraft AS median_Mill_outletDraft
FROM (
    SELECT Mill_outletDraft, ROW_NUMBER() OVER (ORDER BY Mill_outletDraft) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Mill_outletDraft AS mode_Mill_outletDraft
FROM (
    SELECT Mill_outletDraft, COUNT(*) AS frequency
    FROM data
    GROUP BY Mill_outletDraft
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Mill_outletDraft) AS Mill_outletDraft_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Mill_outletDraft) AS Mill_outletDraft_std
FROM data;

/*  RANGE */
SELECT MAX(Mill_outletDraft) - MIN(Mill_outletDraft) AS Mill_outletDraft_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Mill_outletDraft - (SELECT AVG(Mill_outletDraft) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_outletDraft) FROM data), 3))
    ) AS Mill_outletDraft_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Mill_outletDraft - (SELECT AVG(Mill_outletDraft) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_outletDraft) FROM data), 4))) - 3
    ) AS Mill_outletDraft_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Mill_outletDraft - (SELECT AVG(Mill_outletDraft) FROM data)) > 3 * (SELECT stddev(Mill_outletDraft) FROM data);