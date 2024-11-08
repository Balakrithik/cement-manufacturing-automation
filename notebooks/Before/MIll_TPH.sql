use cement_project;
select * from data;

/* count */
select count(*) from data;

/* MIN */
select min(abs(Mill_TPH)) as min from data;

/* MAX */
select max(abs(Mill_TPH)) as max from data;

/* MEAN */
select avg(abs(Mill_TPH)) as Mean from data;

/*  MEDIAN */
SELECT Mill_TPH AS median_Mill_TPH
FROM (
    SELECT Mill_TPH, ROW_NUMBER() OVER (ORDER BY Mill_TPH) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

/* Mode */
SELECT Mill_TPH AS mode_Mill_TPH
FROM (
    SELECT Mill_TPH, COUNT(*) AS frequency
    FROM data
    GROUP BY Mill_TPH
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(Mill_TPH) AS Mill_TPH_variance
FROM data;

/* Standard Deviation */
SELECT STDDEV(Mill_TPH) AS Mill_TPH_std
FROM data;

/*  RANGE */
SELECT MAX(Mill_TPH) - MIN(Mill_TPH) AS Mill_TPH_range
FROM data;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(Mill_TPH - (SELECT AVG(Mill_TPH) FROM data), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_TPH) FROM data), 3))
    ) AS Mill_TPH_skewness FROM data ;
 
/* KURTOSIS */
SELECT  (
        (SUM(POWER(Mill_TPH - (SELECT AVG(Mill_TPH) FROM data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_TPH) FROM data), 4))) - 3
    ) AS Mill_TPH_kurtosis  FROM data;
    
/* Outliers */
SELECT count(*) FROM data WHERE (Mill_TPH - (SELECT AVG(Mill_TPH) FROM data)) > 3 * (SELECT stddev(Mill_TPH) FROM data);

-- Mill_TPH
SELECT
  COUNT(CASE WHEN ABS(mill_tph - (SELECT AVG(mill_tph) FROM data)) > 3 * (SELECT STDDEV(mill_tph) FROM data) THEN 1 END) AS mill_tph_outliers
FROM data;

-- Clinker_TPH
SELECT
  COUNT(CASE WHEN ABS(clinker_tph - (SELECT AVG(clinker_tph) FROM data)) > 3 * (SELECT STDDEV(clinker_tph) FROM data) THEN 1 END) AS clinker_tph_outliers
FROM data;

-- Gypsum_TPH
SELECT
  COUNT(CASE WHEN ABS(gypsum_tph - (SELECT AVG(gypsum_tph) FROM data)) > 3 * (SELECT STDDEV(gypsum_tph) FROM data) THEN 1 END) AS gypsum_tph_outliers
FROM data;

-- DFA_TPH
SELECT
  COUNT(CASE WHEN ABS(dfa_tph - (SELECT AVG(dfa_tph) FROM data)) > 3 * (SELECT STDDEV(dfa_tph) FROM data) THEN 1 END) AS dfa_tph_outliers
FROM data;

-- WFA_TPH
SELECT
  COUNT(CASE WHEN ABS(wfa_tph - (SELECT AVG(wfa_tph) FROM data)) > 3 * (SELECT STDDEV(wfa_tph) FROM data) THEN 1 END) AS wfa_tph_outliers
FROM data;

-- Mill_KW
SELECT
  COUNT(CASE WHEN ABS(mill_kw - (SELECT AVG(mill_kw) FROM data)) > 3 * (SELECT STDDEV(mill_kw) FROM data) THEN 1 END) AS mill_kw_outliers
FROM data;

-- Mill_inletTemp
SELECT
  COUNT(CASE WHEN ABS(mill_inlettemp - (SELECT AVG(mill_inlettemp) FROM data)) > 3 * (SELECT STDDEV(mill_inlettemp) FROM data) THEN 1 END) AS mill_inlettemp_outliers
FROM data;

-- Mill_outletTemp
SELECT
  COUNT(CASE WHEN ABS(mill_outlettemp - (SELECT AVG(mill_outlettemp) FROM data)) > 3 * (SELECT STDDEV(mill_outlettemp) FROM data) THEN 1 END) AS mill_outlettemp_outliers
FROM data;

-- Mill_outletAmp
SELECT
  COUNT(CASE WHEN ABS(mill_outletamp - (SELECT AVG(mill_outletamp) FROM data)) > 3 * (SELECT STDDEV(mill_outletamp) FROM data) THEN 1 END) AS mill_outletamp_outliers
FROM data;

-- Mill_VentFan_RPM
SELECT
  COUNT(CASE WHEN ABS(mill_ventfan_rpm - (SELECT AVG(mill_ventfan_rpm) FROM data)) > 3 * (SELECT STDDEV(mill_ventfan_rpm) FROM data) THEN 1 END) AS mill_ventfan_rpm_outliers
FROM data;

-- Mill_VentFan_KW
SELECT
  COUNT(CASE WHEN ABS(mill_ventfan_kw - (SELECT AVG(mill_ventfan_kw) FROM data)) > 3 * (SELECT STDDEV(mill_ventfan_kw) FROM data) THEN 1 END) AS mill_ventfan_kw_outliers
FROM data;

-- Mill_VentBF_inletDraft
SELECT
  COUNT(CASE WHEN ABS(mill_ventbf_inletdraft - (SELECT AVG(mill_ventbf_inletdraft) FROM data)) > 3 * (SELECT STDDEV(mill_ventbf_inletdraft) FROM data) THEN 1 END) AS mill_ventbf_inletdraft_outliers
FROM data;

-- mill_vent_bf_ol_draft
SELECT
  COUNT(CASE WHEN ABS(mill_vent_bf_ol_draft - (SELECT AVG(mill_vent_bf_ol_draft) FROM data)) > 3 * (SELECT STDDEV(mill_vent_bf_ol_draft) FROM data) THEN 1 END) AS mill_vent_bf_ol_draft_outliers
FROM data;

-- Reject
SELECT
  COUNT(CASE WHEN ABS(reject - (SELECT AVG(reject) FROM data)) > 3 * (SELECT STDDEV(reject) FROM data) THEN 1 END)
