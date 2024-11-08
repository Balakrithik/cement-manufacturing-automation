select * from cement_project.data;
alter table data RENAME COLUMN `Mill Vent BF O/L Draft` TO mill_vent_bf_ol_draft;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(mill_vent_bf_ol_draft)) as min from data;

/* MAX */
select max(abs(mill_vent_bf_ol_draft)) as max from data;

/* MEAN */
select avg(abs(mill_vent_bf_ol_draft)) as Mean from data;

/*  MEDIAN */
SELECT mill_vent_bf_ol_draft AS median_mill_vent_bf_ol_draft
FROM (
    SELECT mill_vent_bf_ol_draft, ROW_NUMBER() OVER (ORDER BY mill_vent_bf_ol_draft) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT mill_vent_bf_ol_draft AS mode_mill_vent_bf_ol_draft
FROM (
    SELECT mill_vent_bf_ol_draft, COUNT(*) AS frequency
    FROM data
    GROUP BY mill_vent_bf_ol_draft
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(mill_vent_bf_ol_draft) AS mill_vent_bf_ol_draft_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(mill_vent_bf_ol_draft) AS mill_vent_bf_ol_draft_std
FROM data;

/*  RANGE */
SELECT MAX(mill_vent_bf_ol_draft) - MIN(mill_vent_bf_ol_draft) AS mill_vent_bf_ol_draft_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(mill_vent_bf_ol_draft - (SELECT AVG(mill_vent_bf_ol_draft) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_vent_bf_ol_draft) FROM data), 3))
    ) AS mill_vent_bf_ol_draft_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(mill_vent_bf_ol_draft - (SELECT AVG(mill_vent_bf_ol_draft) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_vent_bf_ol_draft) FROM data), 4))) - 3
    ) AS mill_vent_bf_ol_draft_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (mill_vent_bf_ol_draft - (SELECT AVG(mill_vent_bf_ol_draft) FROM data)) > 3 * (SELECT stddev(mill_vent_bf_ol_draft) FROM data);