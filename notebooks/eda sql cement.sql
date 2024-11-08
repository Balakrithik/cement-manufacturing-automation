use project2_360;
/* count */
select count(*) from cement_data;

/* Renameing the columns for mysql compatibility */

/* date_time, mill_tph, clinker_tph, gypsum_tph, dfa_tph, wfa_tph, 
mill_kw, mill_il_temp, mill_ol_temp, mill_ol_be_amp, mill_vent_fan_rpm, 
mill_vent_fan_kw, mill_vent_bf_il_draft, mill_vent_bf_ol_draft, reject, 
sep_rpm, sep_kw, sep_amp, ca_fan_rpm, ca_fan_kw, mill_folaphone, mill_il_draft,
 mill_ol_draft, sep_vent_il_draft, sep_vent_ol_draft, sep_vent_bag_filter_fan_kw, 
 sep_vent_bag_filter_fan_rpm, residue_45_lu*/
 
ALTER TABLE cement_data RENAME COLUMN `Date & Time`to date_time ;
ALTER TABLE cement_data RENAME COLUMN `Mill TPH` to  mill_tph ;
ALTER TABLE cement_data
RENAME COLUMN `Clinker TPH` TO clinker_tph,
RENAME COLUMN `Gypsum TPH` TO gypsum_tph,
RENAME COLUMN `DFA TPH` TO dfa_tph,
RENAME COLUMN `WFA TPH` TO wfa_tph,
RENAME COLUMN `Mill KW` TO mill_kw,
RENAME COLUMN `Mill I/L Temp` TO mill_il_temp,
RENAME COLUMN `Mill O/L Temp` TO mill_ol_temp,
RENAME COLUMN `Mill O/L BE Amp` TO mill_ol_be_amp,
RENAME COLUMN `Mill Vent Fan RPM` TO mill_vent_fan_rpm,
RENAME COLUMN `Mill Vent Fan KW` TO mill_vent_fan_kw,
RENAME COLUMN `Mill Vent BF I/L Draft` TO mill_vent_bf_il_draft,
RENAME COLUMN `Mill Vent BF O/L Draft` TO mill_vent_bf_ol_draft,
RENAME COLUMN `Reject` TO reject,
RENAME COLUMN `Sep RPM` TO sep_rpm,
RENAME COLUMN `Sep KW` TO sep_kw,
RENAME COLUMN `Sep Amp` TO sep_amp,
RENAME COLUMN `CA Fan RPM` TO ca_fan_rpm,
RENAME COLUMN `CA Fan KW` TO ca_fan_kw,
RENAME COLUMN `Mill Folaphone` TO mill_folaphone,
RENAME COLUMN `Mill I/L Draft` TO mill_il_draft,
RENAME COLUMN `Mill O/L Draft` TO mill_ol_draft,
RENAME COLUMN `Sep. Vent I/L Draft` TO sep_vent_il_draft,
RENAME COLUMN `Sep. Vent O/L Draft` TO sep_vent_ol_draft,
RENAME COLUMN `Sep.Vent bag filter fan kw` TO sep_vent_bag_filter_fan_kw,
RENAME COLUMN `Sep.Vent bag filter fan rpm` TO sep_vent_bag_filter_fan_rpm,
RENAME COLUMN `Residue
(45Âµ)` TO residue_45_lu;

/* Min */
SELECT MIN(mill_tph), MIN(clinker_tph), MIN(gypsum_tph), MIN(dfa_tph), MIN(wfa_tph), MIN(mill_kw), MIN(mill_il_temp), MIN(mill_ol_temp), MIN(mill_ol_be_amp), MIN(mill_vent_fan_rpm), MIN(mill_vent_fan_kw), MIN(mill_vent_bf_il_draft), MIN(mill_vent_bf_ol_draft), MIN(reject), MIN(sep_rpm), MIN(sep_kw), MIN(sep_amp), MIN(ca_fan_rpm), MIN(ca_fan_kw), MIN(mill_folaphone), MIN(mill_il_draft), MIN(mill_ol_draft), MIN(sep_vent_il_draft), MIN(sep_vent_ol_draft), MIN(sep_vent_bag_filter_fan_kw), MIN(sep_vent_bag_filter_fan_rpm), MIN(residue_45_lu)
FROM cement_data;

/* MAX */
SELECT  MAX(mill_tph), MAX(clinker_tph), MAX(gypsum_tph), MAX(dfa_tph), MAX(wfa_tph), MAX(mill_kw), MAX(mill_il_temp), MAX(mill_ol_temp), MAX(mill_ol_be_amp), MAX(mill_vent_fan_rpm), MAX(mill_vent_fan_kw), MAX(mill_vent_bf_il_draft), MAX(mill_vent_bf_ol_draft), MAX(reject), MAX(sep_rpm), MAX(sep_kw), MAX(sep_amp), MAX(ca_fan_rpm), MAX(ca_fan_kw), MAX(mill_folaphone), MAX(mill_il_draft), MAX(mill_ol_draft), MAX(sep_vent_il_draft), MAX(sep_vent_ol_draft), MAX(sep_vent_bag_filter_fan_kw), MAX(sep_vent_bag_filter_fan_rpm), MAX(residue_45_lu)
FROM cement_data;

/* MEAN */
SELECT AVG(mill_tph), AVG(clinker_tph), AVG(gypsum_tph), AVG(dfa_tph), AVG(wfa_tph), AVG(mill_kw), AVG(mill_il_temp), AVG(mill_ol_temp), AVG(mill_ol_be_amp), AVG(mill_vent_fan_rpm), AVG(mill_vent_fan_kw), AVG(mill_vent_bf_il_draft), AVG(mill_vent_bf_ol_draft), AVG(reject), AVG(sep_rpm), AVG(sep_kw), AVG(sep_amp), AVG(ca_fan_rpm), AVG(ca_fan_kw), AVG(mill_folaphone), AVG(mill_il_draft), AVG(mill_ol_draft), AVG(sep_vent_il_draft), AVG(sep_vent_ol_draft), AVG(sep_vent_bag_filter_fan_kw), AVG(sep_vent_bag_filter_fan_rpm), AVG(residue_45_lu)
FROM cement_data;
use project2_360;
/*  MEDIAN */
SELECT  mill_tph AS median
FROM (
    SELECT  mill_tph, ROW_NUMBER() OVER (ORDER BY  mill_tph) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data 
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

SELECT  clinker_tph AS median
FROM (
    SELECT  clinker_tph, ROW_NUMBER() OVER (ORDER BY  clinker_tph) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data 
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

SELECT  gypsum_tph AS median
FROM (
    SELECT  gypsum_tph, ROW_NUMBER() OVER (ORDER BY  gypsum_tph) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data 
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

SELECT  dfa_tph AS median
FROM (
    SELECT  dfa_tph, ROW_NUMBER() OVER (ORDER BY  dfa_tph) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data 
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

SELECT  wfa_tph AS median
FROM (
    SELECT  wfa_tph, ROW_NUMBER() OVER (ORDER BY  wfa_tph) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data 
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

SELECT  mill_kw AS median
FROM (
    SELECT  mill_kw, ROW_NUMBER() OVER (ORDER BY  mill_kw) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data 
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

-- Median for mill_il_temp
SELECT mill_il_temp AS median
FROM (
    SELECT mill_il_temp, ROW_NUMBER() OVER (ORDER BY mill_il_temp) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for mill_ol_temp
SELECT mill_ol_temp AS median
FROM (
    SELECT mill_ol_temp, ROW_NUMBER() OVER (ORDER BY mill_ol_temp) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for mill_ol_be_amp
SELECT mill_ol_be_amp AS median
FROM (
    SELECT mill_ol_be_amp, ROW_NUMBER() OVER (ORDER BY mill_ol_be_amp) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for mill_vent_fan_rpm
SELECT mill_vent_fan_rpm AS median
FROM (
    SELECT mill_vent_fan_rpm, ROW_NUMBER() OVER (ORDER BY mill_vent_fan_rpm) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for mill_vent_fan_kw
SELECT mill_vent_fan_kw AS median
FROM (
    SELECT mill_vent_fan_kw, ROW_NUMBER() OVER (ORDER BY mill_vent_fan_kw) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for mill_vent_bf_il_draft
SELECT mill_vent_bf_il_draft AS median
FROM (
    SELECT mill_vent_bf_il_draft, ROW_NUMBER() OVER (ORDER BY mill_vent_bf_il_draft) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for mill_vent_bf_ol_draft
SELECT mill_vent_bf_ol_draft AS median
FROM (
    SELECT mill_vent_bf_ol_draft, ROW_NUMBER() OVER (ORDER BY mill_vent_bf_ol_draft) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for reject
SELECT reject AS median
FROM (
    SELECT reject, ROW_NUMBER() OVER (ORDER BY reject) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for sep_rpm
SELECT sep_rpm AS median
FROM (
    SELECT sep_rpm, ROW_NUMBER() OVER (ORDER BY sep_rpm) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for sep_kw
SELECT sep_kw AS median
FROM (
    SELECT sep_kw, ROW_NUMBER() OVER (ORDER BY sep_kw) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for sep_amp
SELECT sep_amp AS median
FROM (
    SELECT sep_amp, ROW_NUMBER() OVER (ORDER BY sep_amp) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for ca_fan_rpm
SELECT ca_fan_rpm AS median
FROM (
    SELECT ca_fan_rpm, ROW_NUMBER() OVER (ORDER BY ca_fan_rpm) AS row_num,
           COUNT(*) OVER () AS total_count
 FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for ca_fan_kw
SELECT ca_fan_kw AS median
FROM (
SELECT ca_fan_kw, ROW_NUMBER() OVER (ORDER BY ca_fan_kw) AS row_num,
COUNT(*) OVER () AS total_count
FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for mill_folaphone
SELECT mill_folaphone AS median
FROM (
SELECT mill_folaphone, ROW_NUMBER() OVER (ORDER BY mill_folaphone) AS row_num,
COUNT(*) OVER () AS total_count
FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for mill_il_draft
SELECT mill_il_draft AS median
FROM (
SELECT mill_il_draft, ROW_NUMBER() OVER (ORDER BY mill_il_draft) AS row_num,
COUNT(*) OVER () AS total_count
FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for mill_ol_draft
SELECT mill_ol_draft AS median
FROM (
SELECT mill_ol_draft, ROW_NUMBER() OVER (ORDER BY mill_ol_draft) AS row_num,
COUNT(*) OVER () AS total_count
FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for sep_vent_il_draft
SELECT sep_vent_il_draft AS median
FROM (
SELECT sep_vent_il_draft, ROW_NUMBER() OVER (ORDER BY sep_vent_il_draft) AS row_num,
COUNT(*) OVER () AS total_count
FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for sep_vent_ol_draft
SELECT sep_vent_ol_draft AS median
FROM (
SELECT sep_vent_ol_draft, ROW_NUMBER() OVER (ORDER BY sep_vent_ol_draft) AS row_num,
COUNT(*) OVER () AS total_count
FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for sep_vent_bag_filter_fan_kw
SELECT sep_vent_bag_filter_fan_kw AS median
FROM (
SELECT sep_vent_bag_filter_fan_kw, ROW_NUMBER() OVER (ORDER BY sep_vent_bag_filter_fan_kw) AS row_num,
COUNT(*) OVER () AS total_count
FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for sep_vent_bag_filter_fan_rpm
SELECT sep_vent_bag_filter_fan_rpm AS median
FROM (
SELECT sep_vent_bag_filter_fan_rpm, ROW_NUMBER() OVER (ORDER BY sep_vent_bag_filter_fan_rpm) AS row_num,
COUNT(*) OVER () AS total_count
FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for residue_45_lu
SELECT residue_45_lu AS median
FROM (
SELECT residue_45_lu, ROW_NUMBER() OVER (ORDER BY residue_45_lu) AS row_num,
COUNT(*) OVER () AS total_count
FROM cement_data
) AS median
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

/*Mode*/
SELECT mill_tph AS mode_mill_tph
FROM (
    SELECT mill_tph, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY mill_tph
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(mill_tph) AS variance_mill_tph
FROM cement_data ;

/* Standard Deviation */
SELECT STDDEV(mill_tph) AS std_mill_tph
FROM cement_data;

/*  RANGE */
SELECT MAX(mill_tph) - MIN(mill_tph) AS range_mill_tph
FROM cement_data ;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(mill_tph - (SELECT AVG(mill_tph) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_tph) FROM cement_data ), 3))
    ) AS skewness_mill_tph FROM cement_data;
    
     /* KURTOSIS */
  
  SELECT  (
        (SUM(POWER(mill_tph - (SELECT AVG(mill_tph) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_tph) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_tph  FROM cement_data;

/*mode*/
SELECT clinker_tph AS mode_clinker_tph
FROM (
    SELECT clinker_tph, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY clinker_tph
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

/*  VARIANCE */
SELECT VARIANCE(clinker_tph) AS variance_clinker_tph
FROM cement_data ;

/* Standard Deviation */
SELECT STDDEV(clinker_tph) AS std_clinker_tph
FROM cement_data;

/*  RANGE */
SELECT MAX(clinker_tph) - MIN(clinker_tph) AS range_clinker_tph
FROM cement_data ;

/* SKEWNESS */
SELECT
    (
        SUM(POWER(clinker_tph - (SELECT AVG(clinker_tph) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(clinker_tph) FROM cement_data ), 3))
    ) AS skewness_clinker_tph FROM cement_data;
    
     /* KURTOSIS */
  
  SELECT  (
        (SUM(POWER(clinker_tph - (SELECT AVG(clinker_tph) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(clinker_tph) FROM cement_data), 4))) - 3
    ) AS kurtosis_clinker_tph  FROM cement_data;

/*Variance*/
SELECT
  VARIANCE(gypsum_tph) AS variance_gypsum_tph,
  VARIANCE(dfa_tph) AS variance_dfa_tph,
  VARIANCE(wfa_tph) AS variance_wfa_tph,
  VARIANCE(mill_kw) AS variance_mill_kw,
  VARIANCE(mill_il_temp) AS variance_mill_il_temp,
  VARIANCE(mill_ol_temp) AS variance_mill_ol_temp,
  VARIANCE(mill_ol_be_amp) AS variance_mill_ol_be_amp,
  VARIANCE(mill_vent_fan_rpm) AS variance_mill_vent_fan_rpm,
  VARIANCE(mill_vent_fan_kw) AS variance_mill_vent_fan_kw,
  VARIANCE(mill_vent_bf_il_draft) AS variance_mill_vent_bf_il_draft,
  VARIANCE(mill_vent_bf_ol_draft) AS variance_mill_vent_bf_ol_draft,
  VARIANCE(reject) AS variance_reject,
  VARIANCE(sep_rpm) AS variance_sep_rpm,
  VARIANCE(sep_kw) AS variance_sep_kw,
  VARIANCE(sep_amp) AS variance_sep_amp,
  VARIANCE(ca_fan_rpm) AS variance_ca_fan_rpm,
  VARIANCE(ca_fan_kw) AS variance_ca_fan_kw,
  VARIANCE(mill_folaphone) AS variance_mill_folaphone,
  VARIANCE(mill_il_draft) AS variance_mill_il_draft,
  VARIANCE(mill_ol_draft) AS variance_mill_ol_draft,
  VARIANCE(sep_vent_il_draft) AS variance_sep_vent_il_draft,
  VARIANCE(sep_vent_ol_draft) AS variance_sep_vent_ol_draft,
  VARIANCE(sep_vent_bag_filter_fan_kw) AS variance_sep_vent_bag_filter_fan_kw,
  VARIANCE(sep_vent_bag_filter_fan_rpm) AS variance_sep_vent_bag_filter_fan_rpm,
  VARIANCE(residue_45_lu) AS variance_residue_45_lu
FROM cement_data;

/* Standard Deviatiomn */
SELECT
  STDDEV(gypsum_tph) AS std_gypsum_tph,
  STDDEV(dfa_tph) AS std_dfa_tph,
  STDDEV(wfa_tph) AS std_wfa_tph,
  STDDEV(mill_kw) AS std_mill_kw,
  STDDEV(mill_il_temp) AS std_mill_il_temp,
  STDDEV(mill_ol_temp) AS std_mill_ol_temp,
  STDDEV(mill_ol_be_amp) AS std_mill_ol_be_amp,
  STDDEV(mill_vent_fan_rpm) AS std_mill_vent_fan_rpm,
  STDDEV(mill_vent_fan_kw) AS std_mill_vent_fan_kw,
  STDDEV(mill_vent_bf_il_draft) AS std_mill_vent_bf_il_draft,
  STDDEV(mill_vent_bf_ol_draft) AS std_mill_vent_bf_ol_draft,
  STDDEV(reject) AS std_reject,
  STDDEV(sep_rpm) AS std_sep_rpm,
  STDDEV(sep_kw) AS std_sep_kw,
  STDDEV(sep_amp) AS std_sep_amp,
  STDDEV(ca_fan_rpm) AS std_ca_fan_rpm,
  STDDEV(ca_fan_kw) AS std_ca_fan_kw,
  STDDEV(mill_folaphone) AS std_mill_folaphone,
  STDDEV(mill_il_draft) AS std_mill_il_draft,
  STDDEV(mill_ol_draft) AS std_mill_ol_draft,
  STDDEV(sep_vent_il_draft) AS std_sep_vent_il_draft,
  STDDEV(sep_vent_ol_draft) AS std_sep_vent_ol_draft,
  STDDEV(sep_vent_bag_filter_fan_kw) AS std_sep_vent_bag_filter_fan_kw,
  STDDEV(sep_vent_bag_filter_fan_rpm) AS std_sep_vent_bag_filter_fan_rpm,
  STDDEV(residue_45_lu) AS std_residue_45_lu
FROM cement_data;

/* Range */
SELECT
  MAX(gypsum_tph) - MIN(gypsum_tph) AS range_gypsum_tph,
  MAX(dfa_tph) - MIN(dfa_tph) AS range_dfa_tph,
  MAX(wfa_tph) - MIN(wfa_tph) AS range_wfa_tph,
  MAX(mill_kw) - MIN(mill_kw) AS range_mill_kw,
  MAX(mill_il_temp) - MIN(mill_il_temp) AS range_mill_il_temp,
  MAX(mill_ol_temp) - MIN(mill_ol_temp) AS range_mill_ol_temp,
  MAX(mill_ol_be_amp) - MIN(mill_ol_be_amp) AS range_mill_ol_be_amp,
  MAX(mill_vent_fan_rpm) - MIN(mill_vent_fan_rpm) AS range_mill_vent_fan_rpm,
  MAX(mill_vent_fan_kw) - MIN(mill_vent_fan_kw) AS range_mill_vent_fan_kw,
  MAX(mill_vent_bf_il_draft) - MIN(mill_vent_bf_il_draft) AS range_mill_vent_bf_il_draft,
  MAX(mill_vent_bf_ol_draft) - MIN(mill_vent_bf_ol_draft) AS range_mill_vent_bf_ol_draft,
  MAX(reject) - MIN(reject) AS range_reject,
  MAX(sep_rpm) - MIN(sep_rpm) AS range_sep_rpm,
  MAX(sep_kw) - MIN(sep_kw) AS range_sep_kw,
  MAX(sep_amp) - MIN(sep_amp) AS range_sep_amp,
  MAX(ca_fan_rpm) - MIN(ca_fan_rpm) AS range_ca_fan_rpm,
  MAX(ca_fan_kw) - MIN(ca_fan_kw) AS range_ca_fan_kw,
  MAX(mill_folaphone) - MIN(mill_folaphone) AS range_mill_folaphone,
  MAX(mill_il_draft) - MIN(mill_il_draft) AS range_mill_il_draft,
  MAX(mill_ol_draft) - MIN(mill_ol_draft) AS range_mill_ol_draft,
  MAX(sep_vent_il_draft) - MIN(sep_vent_il_draft) AS range_sep_vent_il_draft,
  MAX(sep_vent_ol_draft) - MIN(sep_vent_ol_draft) AS range_sep_vent_ol_draft,
  MAX(sep_vent_bag_filter_fan_kw) - MIN(sep_vent_bag_filter_fan_kw) AS range_sep_vent_bag_filter_fan_kw,
  MAX(sep_vent_bag_filter_fan_rpm) - MIN(sep_vent_bag_filter_fan_rpm) AS range_sep_vent_bag_filter_fan_rpm,
  MAX(residue_45_lu) - MIN(residue_45_lu) AS range_residue_45_lu
FROM cement_data;


/*mode*/
SELECT gypsum_tph AS mode_gypsum_tph
FROM (
    SELECT gypsum_tph, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY gypsum_tph
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(gypsum_tph - (SELECT AVG(gypsum_tph) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(gypsum_tph) FROM cement_data ), 3))
    ) AS skewness_gypsum_tph , (
        (SUM(POWER(gypsum_tph - (SELECT AVG(gypsum_tph) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(gypsum_tph) FROM cement_data), 4))) - 3
    ) AS kurtosis_gypsum_tph  FROM cement_data;
    
/*mode*/
SELECT dfa_tph AS mode_dfa_tph
FROM (
    SELECT dfa_tph, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY dfa_tph
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(dfa_tph - (SELECT AVG(dfa_tph) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(dfa_tph) FROM cement_data ), 3))
    ) AS skewness_dfa_tph , (
        (SUM(POWER(dfa_tph - (SELECT AVG(dfa_tph) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(dfa_tph) FROM cement_data), 4))) - 3
    ) AS kurtosis_dfa_tph  FROM cement_data;
    
/*mode*/
SELECT wfa_tph AS mode_wfa_tph
FROM (
    SELECT wfa_tph, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY wfa_tph
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(wfa_tph - (SELECT AVG(wfa_tph) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(wfa_tph) FROM cement_data ), 3))
    ) AS skewness_wfa_tph , (
        (SUM(POWER(wfa_tph - (SELECT AVG(wfa_tph) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(wfa_tph) FROM cement_data), 4))) - 3
    ) AS kurtosis_wfa_tph  FROM cement_data;
    
/*mode*/
SELECT mill_kw AS mode_mill_kw
FROM (
    SELECT mill_kw, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY mill_kw
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(mill_kw - (SELECT AVG(mill_kw) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_kw) FROM cement_data ), 3))
    ) AS skewness_mill_kw , (
        (SUM(POWER(mill_kw - (SELECT AVG(mill_kw) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_kw) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_kw  FROM cement_data;
    
/*mode*/
SELECT mill_il_temp AS mode_mill_il_temp
FROM (
    SELECT mill_il_temp, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY mill_il_temp
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(mill_il_temp - (SELECT AVG(mill_il_temp) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_il_temp) FROM cement_data ), 3))
    ) AS skewness_mill_il_temp , (
        (SUM(POWER(mill_il_temp - (SELECT AVG(mill_il_temp) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_il_temp) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_il_temp  FROM cement_data;
    
/*mode*/
SELECT mill_ol_temp AS mode_mill_ol_temp
FROM (
    SELECT mill_ol_temp, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY mill_ol_temp
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(mill_ol_temp - (SELECT AVG(mill_ol_temp) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_ol_temp) FROM cement_data ), 3))
    ) AS skewness_mill_ol_temp , (
        (SUM(POWER(mill_ol_temp - (SELECT AVG(mill_ol_temp) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_ol_temp) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_ol_temp  FROM cement_data;
    
/*mode*/
SELECT mill_ol_be_amp AS mode_mill_ol_be_amp
FROM (
    SELECT mill_ol_be_amp, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY mill_ol_be_amp
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(mill_ol_be_amp - (SELECT AVG(mill_ol_be_amp) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_ol_be_amp) FROM cement_data ), 3))
    ) AS skewness_mill_ol_be_amp , (
        (SUM(POWER(mill_ol_be_amp - (SELECT AVG(mill_ol_be_amp) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_ol_be_amp) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_ol_be_amp  FROM cement_data;
    

/*mode*/
SELECT  mill_vent_fan_rpm AS mode_mill_vent_fan_rpm
FROM (
    SELECT  mill_vent_fan_rpm, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY  mill_vent_fan_rpm
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER( mill_vent_fan_rpm - (SELECT AVG( mill_vent_fan_rpm) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV( mill_vent_fan_rpm) FROM cement_data ), 3))
    ) AS skewness_mill_vent_fan_rpm , (
        (SUM(POWER( mill_vent_fan_rpm - (SELECT AVG( mill_vent_fan_rpm) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV( mill_vent_fan_rpm) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_vent_fan_rpm  FROM cement_data;
    
/*mode*/
SELECT mill_vent_fan_kw AS mode_mill_vent_fan_kw
FROM (
    SELECT mill_vent_fan_kw, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY mill_vent_fan_kw
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(mill_vent_fan_kw - (SELECT AVG(mill_vent_fan_kw) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_vent_fan_kw) FROM cement_data ), 3))
    ) AS skewness_mill_vent_fan_kw , (
        (SUM(POWER(mill_vent_fan_kw - (SELECT AVG(mill_vent_fan_kw) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_vent_fan_kw) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_vent_fan_kw  FROM cement_data;
    
/*mode*/
SELECT mill_vent_bf_il_draft AS mode_mill_vent_bf_il_draft
FROM (
    SELECT mill_vent_bf_il_draft, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY mill_vent_bf_il_draft
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(mill_vent_bf_il_draft - (SELECT AVG(mill_vent_bf_il_draft) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_vent_bf_il_draft) FROM cement_data ), 3))
    ) AS skewness_mill_vent_bf_il_draft , (
        (SUM(POWER(mill_vent_bf_il_draft - (SELECT AVG(mill_vent_bf_il_draft) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_vent_bf_il_draft) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_vent_bf_il_draft  FROM cement_data;
    
/*mode*/
SELECT mill_vent_bf_ol_draft AS mode_mill_vent_bf_ol_draft
FROM (
    SELECT mill_vent_bf_ol_draft, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY mill_vent_bf_ol_draft
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(mill_vent_bf_ol_draft - (SELECT AVG(mill_vent_bf_ol_draft) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_vent_bf_ol_draft) FROM cement_data ), 3))
    ) AS skewness_mill_vent_bf_ol_draft , (
        (SUM(POWER(mill_vent_bf_ol_draft - (SELECT AVG(mill_vent_bf_ol_draft) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_vent_bf_ol_draft) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_vent_bf_ol_draft  FROM cement_data;
    
/*mode*/
SELECT reject AS mode_reject
FROM (
    SELECT reject, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY reject
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(reject - (SELECT AVG(reject) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(reject) FROM cement_data ), 3))
    ) AS skewness_reject , (
        (SUM(POWER(reject - (SELECT AVG(reject) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(reject) FROM cement_data), 4))) - 3
    ) AS kurtosis_reject  FROM cement_data;
    
/*mode*/
SELECT sep_rpm AS mode_sep_rpm
FROM (
    SELECT sep_rpm, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY sep_rpm
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(sep_rpm - (SELECT AVG(sep_rpm) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_rpm) FROM cement_data ), 3))
    ) AS skewness_sep_rpm , (
        (SUM(POWER(sep_rpm - (SELECT AVG(sep_rpm) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_rpm) FROM cement_data), 4))) - 3
    ) AS kurtosis_sep_rpm  FROM cement_data;
    
/*mode*/
SELECT sep_kw AS mode_sep_kw
FROM (
    SELECT sep_kw, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY sep_kw
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(sep_kw - (SELECT AVG(sep_kw) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_kw) FROM cement_data ), 3))
    ) AS skewness_sep_kw , (
        (SUM(POWER(sep_kw - (SELECT AVG(sep_kw) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_kw) FROM cement_data), 4))) - 3
    ) AS kurtosis_sep_kw  FROM cement_data;
    
/*mode*/
SELECT sep_amp AS mode_sep_amp
FROM (
    SELECT sep_amp, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY sep_amp
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(sep_amp - (SELECT AVG(sep_amp) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_amp) FROM cement_data ), 3))
    ) AS skewness_sep_amp , (
        (SUM(POWER(sep_amp - (SELECT AVG(sep_amp) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_amp) FROM cement_data), 4))) - 3
    ) AS kurtosis_sep_amp  FROM cement_data;
    
/*mode*/
SELECT ca_fan_rpm AS mode_ca_fan_rpm
FROM (
    SELECT ca_fan_rpm, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY ca_fan_rpm
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(ca_fan_rpm - (SELECT AVG(ca_fan_rpm) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(ca_fan_rpm) FROM cement_data ), 3))
    ) AS skewness_ca_fan_rpm , (
        (SUM(POWER(ca_fan_rpm - (SELECT AVG(ca_fan_rpm) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(ca_fan_rpm) FROM cement_data), 4))) - 3
    ) AS kurtosis_ca_fan_rpm  FROM cement_data;
    
/*mode*/
SELECT ca_fan_kw AS mode_ca_fan_kw
FROM (
    SELECT ca_fan_kw, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY ca_fan_kw
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(ca_fan_kw - (SELECT AVG(ca_fan_kw) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(ca_fan_kw) FROM cement_data ), 3))
    ) AS skewness_ca_fan_kw , (
        (SUM(POWER(ca_fan_kw - (SELECT AVG(ca_fan_kw) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(ca_fan_kw) FROM cement_data), 4))) - 3
    ) AS kurtosis_ca_fan_kw  FROM cement_data;
    
/*mode*/
SELECT mill_folaphone AS mode_mill_folaphone
FROM (
    SELECT mill_folaphone, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY mill_folaphone
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(mill_folaphone - (SELECT AVG(mill_folaphone) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_folaphone) FROM cement_data ), 3))
    ) AS skewness_mill_folaphone , (
        (SUM(POWER(mill_folaphone - (SELECT AVG(mill_folaphone) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_folaphone) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_folaphone  FROM cement_data;
    
/*mode*/
SELECT mill_il_draft AS mode_mill_il_draft
FROM (
    SELECT mill_il_draft, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY mill_il_draft
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(mill_il_draft - (SELECT AVG(mill_il_draft) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_il_draft) FROM cement_data ), 3))
    ) AS skewness_mill_il_draft , (
        (SUM(POWER(mill_il_draft - (SELECT AVG(mill_il_draft) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_il_draft) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_il_draft  FROM cement_data;
    
/*mode*/
SELECT mill_ol_draft AS mode_mill_ol_draft
FROM (
    SELECT mill_ol_draft, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY mill_ol_draft
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(mill_ol_draft - (SELECT AVG(mill_ol_draft) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_ol_draft) FROM cement_data ), 3))
    ) AS skewness_mill_ol_draft , (
        (SUM(POWER(mill_ol_draft - (SELECT AVG(mill_ol_draft) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(mill_ol_draft) FROM cement_data), 4))) - 3
    ) AS kurtosis_mill_ol_draft  FROM cement_data;
    
/*mode*/
SELECT sep_vent_il_draft AS mode_sep_vent_il_draft
FROM (
    SELECT sep_vent_il_draft, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY sep_vent_il_draft
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(sep_vent_il_draft - (SELECT AVG(sep_vent_il_draft) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_vent_il_draft) FROM cement_data ), 3))
    ) AS skewness_sep_vent_il_draft , (
        (SUM(POWER(sep_vent_il_draft - (SELECT AVG(sep_vent_il_draft) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_vent_il_draft) FROM cement_data), 4))) - 3
    ) AS kurtosis_sep_vent_il_draft  FROM cement_data;
    
/*mode*/
SELECT sep_vent_ol_draft AS mode_sep_vent_ol_draft
FROM (
    SELECT sep_vent_ol_draft, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY sep_vent_ol_draft
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(sep_vent_ol_draft - (SELECT AVG(sep_vent_ol_draft) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_vent_ol_draft) FROM cement_data ), 3))
    ) AS skewness_sep_vent_ol_draft , (
        (SUM(POWER(sep_vent_ol_draft - (SELECT AVG(sep_vent_ol_draft) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_vent_ol_draft) FROM cement_data), 4))) - 3
    ) AS kurtosis_sep_vent_ol_draft  FROM cement_data;
    
/*mode*/
SELECT sep_vent_bag_filter_fan_kw AS mode_sep_vent_bag_filter_fan_kw
FROM (
    SELECT sep_vent_bag_filter_fan_kw, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY sep_vent_bag_filter_fan_kw
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(sep_vent_bag_filter_fan_kw - (SELECT AVG(sep_vent_bag_filter_fan_kw) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_vent_bag_filter_fan_kw) FROM cement_data ), 3))
    ) AS skewness_sep_vent_bag_filter_fan_kw , (
        (SUM(POWER(sep_vent_bag_filter_fan_kw - (SELECT AVG(sep_vent_bag_filter_fan_kw) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_vent_bag_filter_fan_kw) FROM cement_data), 4))) - 3
    ) AS kurtosis_sep_vent_bag_filter_fan_kw  FROM cement_data;
    
/*mode*/
SELECT sep_vent_bag_filter_fan_rpm AS mode_sep_vent_bag_filter_fan_rpm
FROM (
    SELECT sep_vent_bag_filter_fan_rpm, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY sep_vent_bag_filter_fan_rpm
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(sep_vent_bag_filter_fan_rpm - (SELECT AVG(sep_vent_bag_filter_fan_rpm) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_vent_bag_filter_fan_rpm) FROM cement_data ), 3))
    ) AS skewness_sep_vent_bag_filter_fan_rpm , (
        (SUM(POWER(sep_vent_bag_filter_fan_rpm - (SELECT AVG(sep_vent_bag_filter_fan_rpm) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(sep_vent_bag_filter_fan_rpm) FROM cement_data), 4))) - 3
    ) AS kurtosis_sep_vent_bag_filter_fan_rpm  FROM cement_data;
    
/*mode*/
SELECT residue_45_lu AS mode_residue_45_lu
FROM (
    SELECT residue_45_lu, COUNT(*) AS frequency
    FROM cement_data
    GROUP BY residue_45_lu
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/* SKEWNESS *//* KURTOSIS */
SELECT
    (
        SUM(POWER(residue_45_lu - (SELECT AVG(residue_45_lu) FROM cement_data ), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(residue_45_lu) FROM cement_data ), 3))
    ) AS skewness_residue_45_lu , (
        (SUM(POWER(residue_45_lu - (SELECT AVG(residue_45_lu) FROM cement_data), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(residue_45_lu) FROM cement_data), 4))) - 3
    ) AS kurtosis_residue_45_lu  FROM cement_data;
    
/* Duplicate Count */
SELECT COUNT(*)
FROM cement_data
GROUP BY date_time, mill_tph, clinker_tph, gypsum_tph, dfa_tph, wfa_tph, 
mill_kw, mill_il_temp, mill_ol_temp, mill_ol_be_amp, mill_vent_fan_rpm, 
mill_vent_fan_kw, mill_vent_bf_il_draft, mill_vent_bf_ol_draft, reject, 
sep_rpm, sep_kw, sep_amp, ca_fan_rpm, ca_fan_kw, mill_folaphone, mill_il_draft,
 mill_ol_draft, sep_vent_il_draft, sep_vent_ol_draft, sep_vent_bag_filter_fan_kw, 
 sep_vent_bag_filter_fan_rpm, residue_45_lu -- List all the columns that define a duplicate row
HAVING COUNT(*) > 1;

/* Null Value Count */
SELECT
  SUM(date_time IS NULL) AS date_time_null_count,
  SUM(mill_tph IS NULL) AS mill_tph_null_count,
  SUM(clinker_tph IS NULL) AS clinker_tph_null_count,
  SUM(gypsum_tph IS NULL) AS gypsum_tph_null_count,
  SUM(dfa_tph IS NULL) AS dfa_tph_null_count,
  SUM(wfa_tph IS NULL) AS wfa_tph_null_count,
  SUM(mill_kw IS NULL) AS mill_kw_null_count,
  SUM(mill_il_temp IS NULL) AS mill_il_temp_null_count,
  SUM(mill_ol_temp IS NULL) AS mill_ol_temp_null_count,
  SUM(mill_ol_be_amp IS NULL) AS mill_ol_be_amp_null_count,
  SUM(mill_vent_fan_rpm IS NULL) AS mill_vent_fan_rpm_null_count,
  SUM(mill_vent_fan_kw IS NULL) AS mill_vent_fan_kw_null_count,
  SUM(mill_vent_bf_il_draft IS NULL) AS mill_vent_bf_il_draft_null_count,
  SUM(mill_vent_bf_ol_draft IS NULL) AS mill_vent_bf_ol_draft_null_count,
  SUM(reject IS NULL) AS reject_null_count,
  SUM(sep_rpm IS NULL) AS sep_rpm_null_count,
  SUM(sep_kw IS NULL) AS sep_kw_null_count,
  SUM(sep_amp IS NULL) AS sep_amp_null_count,
  SUM(ca_fan_rpm IS NULL) AS ca_fan_rpm_null_count,
  SUM(ca_fan_kw IS NULL) AS ca_fan_kw_null_count,
  SUM(mill_folaphone IS NULL) AS mill_folaphone_null_count,
  SUM(mill_il_draft IS NULL) AS mill_il_draft_null_count,
  SUM(mill_ol_draft IS NULL) AS mill_ol_draft_null_count,
  SUM(sep_vent_il_draft IS NULL) AS sep_vent_il_draft_null_count,
  SUM(sep_vent_ol_draft IS NULL) AS sep_vent_ol_draft_null_count,
  SUM(sep_vent_bag_filter_fan_kw IS NULL) AS sep_vent_bag_filter_fan_kw_null_count,
  SUM(sep_vent_bag_filter_fan_rpm IS NULL) AS sep_vent_bag_filter_fan_rpm_null_count,
  SUM(residue_45_lu IS NULL) AS residue_45_lu_null_count
FROM cement_data;


/* Outlier Count  3 sigma - gaussian */

/* mill_tph */
SELECT count(*) FROM cement_data WHERE (mill_tph - (SELECT AVG(mill_tph) FROM cement_data)) > 3 * (SELECT stddev(mill_tph) FROM cement_data);
/* clinker_tph */
SELECT count(*) FROM cement_data WHERE (clinker_tph - (SELECT AVG(clinker_tph) FROM cement_data)) > 3 * (SELECT stddev(clinker_tph) FROM cement_data);
/* gypsum_tph */
SELECT count(*) FROM cement_data WHERE (gypsum_tph - (SELECT AVG(gypsum_tph) FROM cement_data)) > 3 * (SELECT stddev(gypsum_tph) FROM cement_data);
/* dfa_tph */
SELECT count(*) FROM cement_data WHERE (dfa_tph - (SELECT AVG(dfa_tph) FROM cement_data)) > 3 * (SELECT stddev(dfa_tph) FROM cement_data);
/* wfa_tph */
SELECT count(*) FROM cement_data WHERE (wfa_tph - (SELECT AVG(wfa_tph) FROM cement_data)) > 3 * (SELECT stddev(wfa_tph) FROM cement_data);
/* mill_kw */
SELECT count(*) FROM cement_data WHERE (mill_kw - (SELECT AVG(mill_kw) FROM cement_data)) > 3 * (SELECT stddev(mill_kw) FROM cement_data);
/* mill_il_temp */
SELECT count(*) FROM cement_data WHERE (mill_il_temp - (SELECT AVG(mill_il_temp) FROM cement_data)) > 3 * (SELECT stddev(mill_il_temp) FROM cement_data);
/* mill_ol_temp */
SELECT count(*) FROM cement_data WHERE (mill_ol_temp - (SELECT AVG(mill_ol_temp) FROM cement_data)) > 3 * (SELECT stddev(mill_ol_temp) FROM cement_data);
/*  mill_ol_be_amp */
SELECT count(*) FROM cement_data WHERE (mill_ol_be_amp - (SELECT AVG(mill_ol_be_amp) FROM cement_data)) > 3 * (SELECT stddev(mill_ol_be_amp) FROM cement_data);
/*  mill_vent_fan_rpm */
SELECT count(*) FROM cement_data WHERE (mill_vent_fan_rpm - (SELECT AVG(mill_vent_fan_rpm) FROM cement_data)) > 3 * (SELECT stddev(mill_vent_fan_rpm) FROM cement_data);
/*  mill_vent_fan_kw */
SELECT count(*) FROM cement_data WHERE (mill_vent_fan_kw - (SELECT AVG(mill_vent_fan_kw) FROM cement_data)) > 3 * (SELECT stddev(mill_vent_fan_kw) FROM cement_data);
/*  mill_vent_bf_il_draft */
SELECT count(*) FROM cement_data WHERE (mill_vent_bf_il_draft - (SELECT AVG(mill_vent_bf_il_draft) FROM cement_data)) > 3 * (SELECT stddev(mill_vent_bf_il_draft) FROM cement_data);
/*  mill_vent_bf_ol_draft */
SELECT count(*) FROM cement_data WHERE (mill_vent_bf_ol_draft - (SELECT AVG(mill_vent_bf_ol_draft) FROM cement_data)) > 3 * (SELECT stddev(mill_vent_bf_ol_draft) FROM cement_data);
/*  reject */
SELECT count(*) FROM cement_data WHERE (reject - (SELECT AVG(reject) FROM cement_data)) > 3 * (SELECT stddev(reject) FROM cement_data);
/*  sep_rpm */
SELECT count(*) FROM cement_data WHERE (sep_rpm - (SELECT AVG(sep_rpm) FROM cement_data)) > 3 * (SELECT stddev(sep_rpm) FROM cement_data);
/*  sep_kw */
SELECT count(*) FROM cement_data WHERE (sep_kw - (SELECT AVG(sep_kw) FROM cement_data)) > 3 * (SELECT stddev(sep_kw) FROM cement_data);
/*  sep_amp */
SELECT count(*) FROM cement_data WHERE (sep_amp - (SELECT AVG(sep_amp) FROM cement_data)) > 3 * (SELECT stddev(sep_amp) FROM cement_data);
/*  ca_fan_rpm */
SELECT count(*) FROM cement_data WHERE (ca_fan_rpm - (SELECT AVG(ca_fan_rpm) FROM cement_data)) > 3 * (SELECT stddev(ca_fan_rpm) FROM cement_data);
/*  ca_fan_kw */
SELECT count(*) FROM cement_data WHERE (ca_fan_kw - (SELECT AVG(ca_fan_kw) FROM cement_data)) > 3 * (SELECT stddev(ca_fan_kw) FROM cement_data);
/*  mill_folaphone */
SELECT count(*) FROM cement_data WHERE (mill_folaphone - (SELECT AVG(mill_folaphone) FROM cement_data)) > 3 * (SELECT stddev(mill_folaphone) FROM cement_data);
/*  mill_il_draft */
SELECT count(*) FROM cement_data WHERE (mill_il_draft - (SELECT AVG(mill_il_draft) FROM cement_data)) > 3 * (SELECT stddev(mill_il_draft) FROM cement_data);
/*  mill_ol_draft */
SELECT count(*) FROM cement_data WHERE (mill_ol_draft - (SELECT AVG(mill_ol_draft) FROM cement_data)) > 3 * (SELECT stddev(mill_ol_draft) FROM cement_data);
/*  sep_vent_il_draft */
SELECT count(*) FROM cement_data WHERE (sep_vent_il_draft - (SELECT AVG(sep_vent_il_draft) FROM cement_data)) > 3 * (SELECT stddev(sep_vent_il_draft) FROM cement_data);
/*  sep_vent_ol_draft */
SELECT count(*) FROM cement_data WHERE (sep_vent_ol_draft - (SELECT AVG(sep_vent_ol_draft) FROM cement_data)) > 3 * (SELECT stddev(sep_vent_ol_draft) FROM cement_data);
/*  sep_vent_bag_filter_fan_kw */
SELECT count(*) FROM cement_data WHERE (sep_vent_bag_filter_fan_kw - (SELECT AVG(sep_vent_bag_filter_fan_kw) FROM cement_data)) > 3 * (SELECT stddev(sep_vent_bag_filter_fan_kw) FROM cement_data);
/*  sep_vent_bag_filter_fan_rpm */
SELECT count(*) FROM cement_data WHERE (sep_vent_bag_filter_fan_rpm - (SELECT AVG(sep_vent_bag_filter_fan_rpm) FROM cement_data)) > 3 * (SELECT stddev(sep_vent_bag_filter_fan_rpm) FROM cement_data);
/*  residue_45_lu */
SELECT count(*) FROM cement_data WHERE (residue_45_lu - (SELECT AVG(residue_45_lu) FROM cement_data)) > 3 * (SELECT stddev(residue_45_lu) FROM cement_data);



/* Outlier Count  3 sigma - gaussian */
SELECT
    COUNT(CASE WHEN ABS(mill_tph - (SELECT AVG(mill_tph) FROM cement_data)) > 3 * (SELECT STDDEV(mill_tph) FROM cement_data) THEN 1 END) AS mill_tph_outliers,
    COUNT(CASE WHEN ABS(clinker_tph - (SELECT AVG(clinker_tph) FROM cement_data)) > 3 * (SELECT STDDEV(clinker_tph) FROM cement_data) THEN 1 END) AS clinker_tph_outliers,
    COUNT(CASE WHEN ABS(gypsum_tph - (SELECT AVG(gypsum_tph) FROM cement_data)) > 3 * (SELECT STDDEV(gypsum_tph) FROM cement_data) THEN 1 END) AS gypsum_tph_outliers,
    COUNT(CASE WHEN ABS(dfa_tph - (SELECT AVG(dfa_tph) FROM cement_data)) > 3 * (SELECT STDDEV(dfa_tph) FROM cement_data) THEN 1 END) AS dfa_tph_outliers,
    COUNT(CASE WHEN ABS(wfa_tph - (SELECT AVG(wfa_tph) FROM cement_data)) > 3 * (SELECT STDDEV(wfa_tph) FROM cement_data) THEN 1 END) AS wfa_tph_outliers,
    COUNT(CASE WHEN ABS(mill_kw - (SELECT AVG(mill_kw) FROM cement_data)) > 3 * (SELECT STDDEV(mill_kw) FROM cement_data) THEN 1 END) AS mill_kw_outliers,
    COUNT(CASE WHEN ABS(mill_il_temp - (SELECT AVG(mill_il_temp) FROM cement_data)) > 3 * (SELECT STDDEV(mill_il_temp) FROM cement_data) THEN 1 END) AS mill_il_temp_outliers,
    COUNT(CASE WHEN ABS(mill_ol_temp - (SELECT AVG(mill_ol_temp) FROM cement_data)) > 3 * (SELECT STDDEV(mill_ol_temp) FROM cement_data) THEN 1 END) AS mill_ol_temp_outliers,
    COUNT(CASE WHEN ABS(mill_ol_be_amp - (SELECT AVG(mill_ol_be_amp) FROM cement_data)) > 3 * (SELECT STDDEV(mill_ol_be_amp) FROM cement_data) THEN 1 END) AS mill_ol_be_amp_outliers,
    COUNT(CASE WHEN ABS(mill_vent_fan_rpm - (SELECT AVG(mill_vent_fan_rpm) FROM cement_data)) > 3 * (SELECT STDDEV(mill_vent_fan_rpm) FROM cement_data) THEN 1 END) AS mill_vent_fan_rpm_outliers,
    COUNT(CASE WHEN ABS(mill_vent_fan_kw - (SELECT AVG(mill_vent_fan_kw) FROM cement_data)) > 3 * (SELECT STDDEV(mill_vent_fan_kw) FROM cement_data) THEN 1 END) AS mill_vent_fan_kw_outliers,
    COUNT(CASE WHEN ABS(mill_vent_bf_il_draft - (SELECT AVG(mill_vent_bf_il_draft) FROM cement_data)) > 3 * (SELECT STDDEV(mill_vent_bf_il_draft) FROM cement_data) THEN 1 END) AS mill_vent_bf_il_draft_outliers,
    COUNT(CASE WHEN ABS(mill_vent_bf_ol_draft - (SELECT AVG(mill_vent_bf_ol_draft) FROM cement_data)) > 3 * (SELECT STDDEV(mill_vent_bf_ol_draft) FROM cement_data) THEN 1 END) AS mill_vent_bf_ol_draft_outliers,
    COUNT(CASE WHEN ABS(reject - (SELECT AVG(reject) FROM cement_data)) > 3 * (SELECT STDDEV(reject) FROM cement_data) THEN 1 END) AS reject_outliers,
    COUNT(CASE WHEN ABS(sep_rpm - (SELECT AVG(sep_rpm) FROM cement_data)) > 3 * (SELECT STDDEV(sep_rpm) FROM cement_data) THEN 1 END) AS sep_rpm_outliers,
    COUNT(CASE WHEN ABS(sep_kw - (SELECT AVG(sep_kw) FROM cement_data)) > 3 * (SELECT STDDEV(sep_kw) FROM cement_data) THEN 1 END) AS sep_kw_outliers,
    COUNT(CASE WHEN ABS(sep_amp - (SELECT AVG(sep_amp) FROM cement_data)) > 3 * (SELECT STDDEV(sep_amp) FROM cement_data) THEN 1 END) AS sep_amp_outliers,
    COUNT(CASE WHEN ABS(ca_fan_rpm - (SELECT AVG(ca_fan_rpm) FROM cement_data)) > 3 * (SELECT STDDEV(ca_fan_rpm) FROM cement_data) THEN 1 END) AS ca_fan_rpm_outliers,
    COUNT(CASE WHEN ABS(ca_fan_kw - (SELECT AVG(ca_fan_kw) FROM cement_data)) > 3 * (SELECT STDDEV(ca_fan_kw) FROM cement_data) THEN 1 END) AS ca_fan_kw_outliers,
    COUNT(CASE WHEN ABS(mill_folaphone - (SELECT AVG(mill_folaphone) FROM cement_data)) > 3 * (SELECT STDDEV(mill_folaphone) FROM cement_data) THEN 1 END) AS mill_folaphone_outliers,
    COUNT(CASE WHEN ABS(mill_il_draft - (SELECT AVG(mill_il_draft) FROM cement_data)) > 3 * (SELECT STDDEV(mill_il_draft) FROM cement_data) THEN 1 END) AS mill_il_draft_outliers,
    COUNT(CASE WHEN ABS(mill_ol_draft - (SELECT AVG(mill_ol_draft) FROM cement_data)) > 3 * (SELECT STDDEV(mill_ol_draft) FROM cement_data) THEN 1 END) AS mill_ol_draft_outliers,
    COUNT(CASE WHEN ABS(sep_vent_il_draft - (SELECT AVG(sep_vent_il_draft) FROM cement_data)) > 3 * (SELECT STDDEV(sep_vent_il_draft) FROM cement_data) THEN 1 END) AS sep_vent_il_draft_outliers,
    COUNT(CASE WHEN ABS(sep_vent_ol_draft - (SELECT AVG(sep_vent_ol_draft) FROM cement_data)) > 3 * (SELECT STDDEV(sep_vent_ol_draft) FROM cement_data) THEN 1 END) AS sep_vent_ol_draft_outliers,
    COUNT(CASE WHEN ABS(sep_vent_bag_filter_fan_kw - (SELECT AVG(sep_vent_bag_filter_fan_kw) FROM cement_data)) > 3 * (SELECT STDDEV(sep_vent_bag_filter_fan_kw) FROM cement_data) THEN 1 END) AS sep_vent_bag_filter_fan_kw_outliers,
    COUNT(CASE WHEN ABS(sep_vent_bag_filter_fan_rpm - (SELECT AVG(sep_vent_bag_filter_fan_rpm) FROM cement_data)) > 3 * (SELECT STDDEV(sep_vent_bag_filter_fan_rpm) FROM cement_data) THEN 1 END) AS sep_vent_bag_filter_fan_rpm_outliers,
    COUNT(CASE WHEN ABS(residue_45_lu - (SELECT AVG(residue_45_lu) FROM cement_data)) > 3 * (SELECT STDDEV(residue_45_lu) FROM cement_data) THEN 1 END) AS residue_45_lu_outliers
FROM cement_data;

/* New table without outliers */
CREATE TABLE cement_data_clean AS
SELECT * FROM cement_data;

/* Drop records where there are outliers */
-- Create a temporary table to store records with outliers
CREATE TEMPORARY TABLE temp_outliers1 AS
SELECT *
FROM cement_data_clean
WHERE 
    (ABS(mill_tph - (SELECT AVG(mill_tph) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_tph) FROM cement_data_clean))
    OR (ABS(clinker_tph - (SELECT AVG(clinker_tph) FROM cement_data_clean)) > 3 * (SELECT STDDEV(clinker_tph) FROM cement_data_clean))
    OR (ABS(gypsum_tph - (SELECT AVG(gypsum_tph) FROM cement_data_clean)) > 3 * (SELECT STDDEV(gypsum_tph) FROM cement_data_clean))
    OR (ABS(dfa_tph - (SELECT AVG(dfa_tph) FROM cement_data_clean)) > 3 * (SELECT STDDEV(dfa_tph) FROM cement_data_clean))
    OR (ABS(wfa_tph - (SELECT AVG(wfa_tph) FROM cement_data_clean)) > 3 * (SELECT STDDEV(wfa_tph) FROM cement_data_clean))
    OR (ABS(mill_kw - (SELECT AVG(mill_kw) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_kw) FROM cement_data_clean))
    OR (ABS(mill_il_temp - (SELECT AVG(mill_il_temp) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_il_temp) FROM cement_data_clean))
    OR (ABS(mill_ol_temp - (SELECT AVG(mill_ol_temp) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_ol_temp) FROM cement_data_clean))
    OR (ABS(mill_ol_be_amp - (SELECT AVG(mill_ol_be_amp) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_ol_be_amp) FROM cement_data_clean))
    OR (ABS(mill_vent_fan_rpm - (SELECT AVG(mill_vent_fan_rpm) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_vent_fan_rpm) FROM cement_data_clean))
    OR (ABS(mill_vent_fan_kw - (SELECT AVG(mill_vent_fan_kw) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_vent_fan_kw) FROM cement_data_clean))
    OR (ABS(mill_vent_bf_il_draft - (SELECT AVG(mill_vent_bf_il_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_vent_bf_il_draft) FROM cement_data_clean))
    OR (ABS(mill_vent_bf_ol_draft - (SELECT AVG(mill_vent_bf_ol_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_vent_bf_ol_draft) FROM cement_data_clean))
    OR (ABS(reject - (SELECT AVG(reject) FROM cement_data_clean)) > 3 * (SELECT STDDEV(reject) FROM cement_data_clean))
    OR (ABS(sep_rpm - (SELECT AVG(sep_rpm) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_rpm) FROM cement_data_clean))
    OR (ABS(sep_kw - (SELECT AVG(sep_kw) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_kw) FROM cement_data_clean))
    OR (ABS(sep_amp - (SELECT AVG(sep_amp) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_amp) FROM cement_data_clean))
    OR (ABS(ca_fan_rpm - (SELECT AVG(ca_fan_rpm) FROM cement_data_clean)) > 3 * (SELECT STDDEV(ca_fan_rpm) FROM cement_data_clean))
    OR (ABS(ca_fan_kw - (SELECT AVG(ca_fan_kw) FROM cement_data_clean)) > 3 * (SELECT STDDEV(ca_fan_kw) FROM cement_data_clean))
    OR (ABS(mill_folaphone - (SELECT AVG(mill_folaphone) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_folaphone) FROM cement_data_clean))
    OR (ABS(mill_il_draft - (SELECT AVG(mill_il_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_il_draft) FROM cement_data_clean))
    OR (ABS(mill_ol_draft - (SELECT AVG(mill_ol_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_ol_draft) FROM cement_data_clean))
    OR (ABS(sep_vent_il_draft - (SELECT AVG(sep_vent_il_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_vent_il_draft) FROM cement_data_clean))
    OR (ABS(sep_vent_ol_draft - (SELECT AVG(sep_vent_ol_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_vent_ol_draft) FROM cement_data_clean))
    OR (ABS(sep_vent_bag_filter_fan_kw - (SELECT AVG(sep_vent_bag_filter_fan_kw) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_vent_bag_filter_fan_kw) FROM cement_data_clean))
    OR (ABS(sep_vent_bag_filter_fan_rpm - (SELECT AVG(sep_vent_bag_filter_fan_rpm) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_vent_bag_filter_fan_rpm) FROM cement_data_clean))
    OR (ABS(residue_45_lu - (SELECT AVG(residue_45_lu) FROM cement_data_clean)) > 3 * (SELECT STDDEV(residue_45_lu) FROM cement_data_clean));


-- Delete records with outliers from the original table
DELETE FROM cement_data_clean
WHERE ( Mill_TPH, Clinker_TPH, Gypsum_TPH, DFA_TPH, WFA_TPH, 
Mill_KW, Mill_IL_Temp, Mill_OL_Temp, Mill_OL_BE_Amp, Mill_Vent_Fan_RPM, 
Mill_Vent_Fan_KW, Mill_Vent_BF_IL_Draft, Mill_Vent_BF_OL_Draft, Reject, 
SEP_RPM, SEP_KW, SEP_Amp, CA_Fan_RPM, CA_Fan_KW, Mill_Folaphone, Mill_IL_Draft,
Mill_OL_Draft, SEP_Vent_IL_Draft, SEP_Vent_OL_Draft, SEP_Vent_Bag_Filter_Fan_KW, 
SEP_Vent_Bag_Filter_Fan_RPM, Residue_45_LU) IN (SELECT Mill_TPH, Clinker_TPH, Gypsum_TPH, DFA_TPH, WFA_TPH, 
Mill_KW, Mill_IL_Temp, Mill_OL_Temp, Mill_OL_BE_Amp, Mill_Vent_Fan_RPM, 
Mill_Vent_Fan_KW, Mill_Vent_BF_IL_Draft, Mill_Vent_BF_OL_Draft, Reject, 
SEP_RPM, SEP_KW, SEP_Amp, CA_Fan_RPM, CA_Fan_KW, Mill_Folaphone, Mill_IL_Draft,
Mill_OL_Draft, SEP_Vent_IL_Draft, SEP_Vent_OL_Draft, SEP_Vent_Bag_Filter_Fan_KW, 
SEP_Vent_Bag_Filter_Fan_RPM, Residue_45_LU FROM temp_outliers1);

-- Drop the temporary table
DROP TEMPORARY TABLE temp_outliers1;

/* count */
select count(*) from cement_data_clean;

/* outlier for cleaned data */
SELECT
    COUNT(CASE WHEN ABS(mill_tph - (SELECT AVG(mill_tph) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_tph) FROM cement_data_clean) THEN 1 END) AS mill_tph_outliers,
    COUNT(CASE WHEN ABS(clinker_tph - (SELECT AVG(clinker_tph) FROM cement_data_clean)) > 3 * (SELECT STDDEV(clinker_tph) FROM cement_data_clean) THEN 1 END) AS clinker_tph_outliers,
    COUNT(CASE WHEN ABS(gypsum_tph - (SELECT AVG(gypsum_tph) FROM cement_data_clean)) > 3 * (SELECT STDDEV(gypsum_tph) FROM cement_data_clean) THEN 1 END) AS gypsum_tph_outliers,
    COUNT(CASE WHEN ABS(dfa_tph - (SELECT AVG(dfa_tph) FROM cement_data_clean)) > 3 * (SELECT STDDEV(dfa_tph) FROM cement_data_clean) THEN 1 END) AS dfa_tph_outliers,
    COUNT(CASE WHEN ABS(wfa_tph - (SELECT AVG(wfa_tph) FROM cement_data_clean)) > 3 * (SELECT STDDEV(wfa_tph) FROM cement_data_clean) THEN 1 END) AS wfa_tph_outliers,
    COUNT(CASE WHEN ABS(mill_kw - (SELECT AVG(mill_kw) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_kw) FROM cement_data_clean) THEN 1 END) AS mill_kw_outliers,
    COUNT(CASE WHEN ABS(mill_il_temp - (SELECT AVG(mill_il_temp) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_il_temp) FROM cement_data_clean) THEN 1 END) AS mill_il_temp_outliers,
    COUNT(CASE WHEN ABS(mill_ol_temp - (SELECT AVG(mill_ol_temp) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_ol_temp) FROM cement_data_clean) THEN 1 END) AS mill_ol_temp_outliers,
    COUNT(CASE WHEN ABS(mill_ol_be_amp - (SELECT AVG(mill_ol_be_amp) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_ol_be_amp) FROM cement_data_clean) THEN 1 END) AS mill_ol_be_amp_outliers,
    COUNT(CASE WHEN ABS(mill_vent_fan_rpm - (SELECT AVG(mill_vent_fan_rpm) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_vent_fan_rpm) FROM cement_data_clean) THEN 1 END) AS mill_vent_fan_rpm_outliers,
    COUNT(CASE WHEN ABS(mill_vent_fan_kw - (SELECT AVG(mill_vent_fan_kw) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_vent_fan_kw) FROM cement_data_clean) THEN 1 END) AS mill_vent_fan_kw_outliers,
    COUNT(CASE WHEN ABS(mill_vent_bf_il_draft - (SELECT AVG(mill_vent_bf_il_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_vent_bf_il_draft) FROM cement_data_clean) THEN 1 END) AS mill_vent_bf_il_draft_outliers,
    COUNT(CASE WHEN ABS(mill_vent_bf_ol_draft - (SELECT AVG(mill_vent_bf_ol_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_vent_bf_ol_draft) FROM cement_data_clean) THEN 1 END) AS mill_vent_bf_ol_draft_outliers,
    COUNT(CASE WHEN ABS(reject - (SELECT AVG(reject) FROM cement_data_clean)) > 3 * (SELECT STDDEV(reject) FROM cement_data_clean) THEN 1 END) AS reject_outliers,
    COUNT(CASE WHEN ABS(sep_rpm - (SELECT AVG(sep_rpm) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_rpm) FROM cement_data_clean) THEN 1 END) AS sep_rpm_outliers,
    COUNT(CASE WHEN ABS(sep_kw - (SELECT AVG(sep_kw) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_kw) FROM cement_data_clean) THEN 1 END) AS sep_kw_outliers,
    COUNT(CASE WHEN ABS(sep_amp - (SELECT AVG(sep_amp) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_amp) FROM cement_data_clean) THEN 1 END) AS sep_amp_outliers,
    COUNT(CASE WHEN ABS(ca_fan_rpm - (SELECT AVG(ca_fan_rpm) FROM cement_data_clean)) > 3 * (SELECT STDDEV(ca_fan_rpm) FROM cement_data_clean) THEN 1 END) AS ca_fan_rpm_outliers,
    COUNT(CASE WHEN ABS(ca_fan_kw - (SELECT AVG(ca_fan_kw) FROM cement_data_clean)) > 3 * (SELECT STDDEV(ca_fan_kw) FROM cement_data_clean) THEN 1 END) AS ca_fan_kw_outliers,
    COUNT(CASE WHEN ABS(mill_folaphone - (SELECT AVG(mill_folaphone) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_folaphone) FROM cement_data_clean) THEN 1 END) AS mill_folaphone_outliers,
    COUNT(CASE WHEN ABS(mill_il_draft - (SELECT AVG(mill_il_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_il_draft) FROM cement_data_clean) THEN 1 END) AS mill_il_draft_outliers,
    COUNT(CASE WHEN ABS(mill_ol_draft - (SELECT AVG(mill_ol_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(mill_ol_draft) FROM cement_data_clean) THEN 1 END) AS mill_ol_draft_outliers,
    COUNT(CASE WHEN ABS(sep_vent_il_draft - (SELECT AVG(sep_vent_il_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_vent_il_draft) FROM cement_data_clean) THEN 1 END) AS sep_vent_il_draft_outliers,
    COUNT(CASE WHEN ABS(sep_vent_ol_draft - (SELECT AVG(sep_vent_ol_draft) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_vent_ol_draft) FROM cement_data_clean) THEN 1 END) AS sep_vent_ol_draft_outliers,
    COUNT(CASE WHEN ABS(sep_vent_bag_filter_fan_kw - (SELECT AVG(sep_vent_bag_filter_fan_kw) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_vent_bag_filter_fan_kw) FROM cement_data_clean) THEN 1 END) AS sep_vent_bag_filter_fan_kw_outliers,
    COUNT(CASE WHEN ABS(sep_vent_bag_filter_fan_rpm - (SELECT AVG(sep_vent_bag_filter_fan_rpm) FROM cement_data_clean)) > 3 * (SELECT STDDEV(sep_vent_bag_filter_fan_rpm) FROM cement_data_clean) THEN 1 END) AS sep_vent_bag_filter_fan_rpm_outliers,
    COUNT(CASE WHEN ABS(residue_45_lu - (SELECT AVG(residue_45_lu) FROM cement_data_clean)) > 3 * (SELECT STDDEV(residue_45_lu) FROM cement_data_clean) THEN 1 END) AS residue_45_lu_outliers
FROM cement_data_clean;

/* Min */
SELECT MIN(mill_tph), MIN(clinker_tph), MIN(gypsum_tph), MIN(dfa_tph), MIN(wfa_tph), MIN(mill_kw), MIN(mill_il_temp), MIN(mill_ol_temp), MIN(mill_ol_be_amp), MIN(mill_vent_fan_rpm), MIN(mill_vent_fan_kw), MIN(mill_vent_bf_il_draft), MIN(mill_vent_bf_ol_draft), MIN(reject), MIN(sep_rpm), MIN(sep_kw), MIN(sep_amp), MIN(ca_fan_rpm), MIN(ca_fan_kw), MIN(mill_folaphone), MIN(mill_il_draft), MIN(mill_ol_draft), MIN(sep_vent_il_draft), MIN(sep_vent_ol_draft), MIN(sep_vent_bag_filter_fan_kw), MIN(sep_vent_bag_filter_fan_rpm), MIN(residue_45_lu)
FROM cement_data_clean;

/* MAX */
SELECT  MAX(mill_tph), MAX(clinker_tph), MAX(gypsum_tph), MAX(dfa_tph), MAX(wfa_tph), MAX(mill_kw), MAX(mill_il_temp), MAX(mill_ol_temp), MAX(mill_ol_be_amp), MAX(mill_vent_fan_rpm), MAX(mill_vent_fan_kw), MAX(mill_vent_bf_il_draft), MAX(mill_vent_bf_ol_draft), MAX(reject), MAX(sep_rpm), MAX(sep_kw), MAX(sep_amp), MAX(ca_fan_rpm), MAX(ca_fan_kw), MAX(mill_folaphone), MAX(mill_il_draft), MAX(mill_ol_draft), MAX(sep_vent_il_draft), MAX(sep_vent_ol_draft), MAX(sep_vent_bag_filter_fan_kw), MAX(sep_vent_bag_filter_fan_rpm), MAX(residue_45_lu)
FROM cement_data_clean;

/* MEAN */
SELECT AVG(mill_tph), AVG(clinker_tph), AVG(gypsum_tph), AVG(dfa_tph), AVG(wfa_tph), AVG(mill_kw), AVG(mill_il_temp), AVG(mill_ol_temp), AVG(mill_ol_be_amp), AVG(mill_vent_fan_rpm), AVG(mill_vent_fan_kw), AVG(mill_vent_bf_il_draft), AVG(mill_vent_bf_ol_draft), AVG(reject), AVG(sep_rpm), AVG(sep_kw), AVG(sep_amp), AVG(ca_fan_rpm), AVG(ca_fan_kw), AVG(mill_folaphone), AVG(mill_il_draft), AVG(mill_ol_draft), AVG(sep_vent_il_draft), AVG(sep_vent_ol_draft), AVG(sep_vent_bag_filter_fan_kw), AVG(sep_vent_bag_filter_fan_rpm), AVG(residue_45_lu)
FROM cement_data_clean;


/*Variance*/
SELECT
  VARIANCE(mill_tph) AS variance_mill_tph,
  VARIANCE(clinker_tph) AS variance_clinker_tph,
  VARIANCE(gypsum_tph) AS variance_gypsum_tph,
  VARIANCE(dfa_tph) AS variance_dfa_tph,
  VARIANCE(wfa_tph) AS variance_wfa_tph,
  VARIANCE(mill_kw) AS variance_mill_kw,
  VARIANCE(mill_il_temp) AS variance_mill_il_temp,
  VARIANCE(mill_ol_temp) AS variance_mill_ol_temp,
  VARIANCE(mill_ol_be_amp) AS variance_mill_ol_be_amp,
  VARIANCE(mill_vent_fan_rpm) AS variance_mill_vent_fan_rpm,
  VARIANCE(mill_vent_fan_kw) AS variance_mill_vent_fan_kw,
  VARIANCE(mill_vent_bf_il_draft) AS variance_mill_vent_bf_il_draft,
  VARIANCE(mill_vent_bf_ol_draft) AS variance_mill_vent_bf_ol_draft,
  VARIANCE(reject) AS variance_reject,
  VARIANCE(sep_rpm) AS variance_sep_rpm,
  VARIANCE(sep_kw) AS variance_sep_kw,
  VARIANCE(sep_amp) AS variance_sep_amp,
  VARIANCE(ca_fan_rpm) AS variance_ca_fan_rpm,
  VARIANCE(ca_fan_kw) AS variance_ca_fan_kw,
  VARIANCE(mill_folaphone) AS variance_mill_folaphone,
  VARIANCE(mill_il_draft) AS variance_mill_il_draft,
  VARIANCE(mill_ol_draft) AS variance_mill_ol_draft,
  VARIANCE(sep_vent_il_draft) AS variance_sep_vent_il_draft,
  VARIANCE(sep_vent_ol_draft) AS variance_sep_vent_ol_draft,
  VARIANCE(sep_vent_bag_filter_fan_kw) AS variance_sep_vent_bag_filter_fan_kw,
  VARIANCE(sep_vent_bag_filter_fan_rpm) AS variance_sep_vent_bag_filter_fan_rpm,
  VARIANCE(residue_45_lu) AS variance_residue_45_lu
FROM cement_data_clean;

/* Standard Deviatiomn */
SELECT
  STDDEV(mill_tph) AS std_mill_tph,
  STDDEV(clinker_tph) AS std_clinker_tph,
  STDDEV(gypsum_tph) AS std_gypsum_tph,
  STDDEV(dfa_tph) AS std_dfa_tph,
  STDDEV(wfa_tph) AS std_wfa_tph,
  STDDEV(mill_kw) AS std_mill_kw,
  STDDEV(mill_il_temp) AS std_mill_il_temp,
  STDDEV(mill_ol_temp) AS std_mill_ol_temp,
  STDDEV(mill_ol_be_amp) AS std_mill_ol_be_amp,
  STDDEV(mill_vent_fan_rpm) AS std_mill_vent_fan_rpm,
  STDDEV(mill_vent_fan_kw) AS std_mill_vent_fan_kw,
  STDDEV(mill_vent_bf_il_draft) AS std_mill_vent_bf_il_draft,
  STDDEV(mill_vent_bf_ol_draft) AS std_mill_vent_bf_ol_draft,
  STDDEV(reject) AS std_reject,
  STDDEV(sep_rpm) AS std_sep_rpm,
  STDDEV(sep_kw) AS std_sep_kw,
  STDDEV(sep_amp) AS std_sep_amp,
  STDDEV(ca_fan_rpm) AS std_ca_fan_rpm,
  STDDEV(ca_fan_kw) AS std_ca_fan_kw,
  STDDEV(mill_folaphone) AS std_mill_folaphone,
  STDDEV(mill_il_draft) AS std_mill_il_draft,
  STDDEV(mill_ol_draft) AS std_mill_ol_draft,
  STDDEV(sep_vent_il_draft) AS std_sep_vent_il_draft,
  STDDEV(sep_vent_ol_draft) AS std_sep_vent_ol_draft,
  STDDEV(sep_vent_bag_filter_fan_kw) AS std_sep_vent_bag_filter_fan_kw,
  STDDEV(sep_vent_bag_filter_fan_rpm) AS std_sep_vent_bag_filter_fan_rpm,
  STDDEV(residue_45_lu) AS std_residue_45_lu
FROM cement_data_clean;

/* Range */
SELECT 
  MAX(mill_tph) - MIN(mill_tph) AS range_mill_tph,
  MAX(clinker_tph) - MIN(clinker_tph) AS range_clinker_tph,
  MAX(gypsum_tph) - MIN(gypsum_tph) AS range_gypsum_tph,
  MAX(dfa_tph) - MIN(dfa_tph) AS range_dfa_tph,
  MAX(wfa_tph) - MIN(wfa_tph) AS range_wfa_tph,
  MAX(mill_kw) - MIN(mill_kw) AS range_mill_kw,
  MAX(mill_il_temp) - MIN(mill_il_temp) AS range_mill_il_temp,
  MAX(mill_ol_temp) - MIN(mill_ol_temp) AS range_mill_ol_temp,
  MAX(mill_ol_be_amp) - MIN(mill_ol_be_amp) AS range_mill_ol_be_amp,
  MAX(mill_vent_fan_rpm) - MIN(mill_vent_fan_rpm) AS range_mill_vent_fan_rpm,
  MAX(mill_vent_fan_kw) - MIN(mill_vent_fan_kw) AS range_mill_vent_fan_kw,
  MAX(mill_vent_bf_il_draft) - MIN(mill_vent_bf_il_draft) AS range_mill_vent_bf_il_draft,
  MAX(mill_vent_bf_ol_draft) - MIN(mill_vent_bf_ol_draft) AS range_mill_vent_bf_ol_draft,
  MAX(reject) - MIN(reject) AS range_reject,
  MAX(sep_rpm) - MIN(sep_rpm) AS range_sep_rpm,
  MAX(sep_kw) - MIN(sep_kw) AS range_sep_kw,
  MAX(sep_amp) - MIN(sep_amp) AS range_sep_amp,
  MAX(ca_fan_rpm) - MIN(ca_fan_rpm) AS range_ca_fan_rpm,
  MAX(ca_fan_kw) - MIN(ca_fan_kw) AS range_ca_fan_kw,
  MAX(mill_folaphone) - MIN(mill_folaphone) AS range_mill_folaphone,
  MAX(mill_il_draft) - MIN(mill_il_draft) AS range_mill_il_draft,
  MAX(mill_ol_draft) - MIN(mill_ol_draft) AS range_mill_ol_draft,
  MAX(sep_vent_il_draft) - MIN(sep_vent_il_draft) AS range_sep_vent_il_draft,
  MAX(sep_vent_ol_draft) - MIN(sep_vent_ol_draft) AS range_sep_vent_ol_draft,
  MAX(sep_vent_bag_filter_fan_kw) - MIN(sep_vent_bag_filter_fan_kw) AS range_sep_vent_bag_filter_fan_kw,
  MAX(sep_vent_bag_filter_fan_rpm) - MIN(sep_vent_bag_filter_fan_rpm) AS range_sep_vent_bag_filter_fan_rpm,
  MAX(residue_45_lu) - MIN(residue_45_lu) AS range_residue_45_lu
FROM cement_data_clean;