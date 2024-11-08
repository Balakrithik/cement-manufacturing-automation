select * from cement_project.data;
use cement_project;
/* count */
select count(*) from data;

/* MIN */
select min(abs(Sep_Vent_outletdraft)) as min from data;

/* MAX */
select max(abs(Sep_Vent_outletdraft)) as max from data;

/* MEAN */
select avg(abs(Sep_Vent_outletdraft)) as Mean from data;

/*  MEDIAN */
SELECT Sep_Vent_outletdraft AS median_Sep_Vent_outletdraft
FROM (
    SELECT Sep_Vent_outletdraft, ROW_NUMBER() OVER (ORDER BY Sep_Vent_outletdraft) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Sep_Vent_outletdraft AS mode_Sep_Vent_outletdraft
FROM (
    SELECT Sep_Vent_outletdraft, COUNT(*) AS frequency
    FROM data
    GROUP BY Sep_Vent_outletdraft
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Sep_Vent_outletdraft) AS Sep_Vent_outletdraft_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Sep_Vent_outletdraft) AS Sep_Vent_outletdraft_std
FROM data;

/*  RANGE */
SELECT MAX(Sep_Vent_outletdraft) - MIN(Sep_Vent_outletdraft) AS Sep_Vent_outletdraft_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Sep_Vent_outletdraft - (SELECT AVG(Sep_Vent_outletdraft) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Vent_outletdraft) FROM data), 3))
    ) AS Sep_Vent_outletdraft_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Sep_Vent_outletdraft - (SELECT AVG(Sep_Vent_outletdraft) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Vent_outletdraft) FROM data), 4))) - 3
    ) AS Sep_Vent_outletdraft_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Sep_Vent_outletdraft - (SELECT AVG(Sep_Vent_outletdraft) FROM data)) > 3 * (SELECT stddev(Sep_Vent_outletdraft) FROM data);