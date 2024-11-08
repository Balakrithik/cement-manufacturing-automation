select * from data;
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
  COUNT(CASE WHEN ABS(Reject - (SELECT AVG(Reject) FROM data)) > 3 * (SELECT STDDEV(Reject) FROM data) THEN 1 END)
-- Sep_RPM
SELECT COUNT(CASE WHEN ABS(Sep_RPM - (SELECT AVG(Sep_RPM) FROM data)) > 3 * (SELECT STDDEV(Sep_RPM) FROM data) THEN 1 END) AS Sep_RPM_outliers FROM data;

-- Sep_KW
SELECT COUNT(CASE WHEN ABS(Sep_KW - (SELECT AVG(Sep_KW) FROM data)) > 3 * (SELECT STDDEV(Sep_KW) FROM data) THEN 1 END) AS Sep_KW_outliers FROM data;

-- Sep_Amp
SELECT COUNT(CASE WHEN ABS(Sep_Amp - (SELECT AVG(Sep_Amp) FROM data)) > 3 * (SELECT STDDEV(Sep_Amp) FROM data) THEN 1 END) AS Sep_Amp_outliers FROM data;

-- CAFan_RPM
SELECT COUNT(CASE WHEN ABS(CAFan_RPM - (SELECT AVG(CAFan_RPM) FROM data)) > 3 * (SELECT STDDEV(CAFan_RPM) FROM data) THEN 1 END) AS CAFan_RPM_outliers FROM data;

-- CAFan_KW
SELECT COUNT(CASE WHEN ABS(CAFan_KW - (SELECT AVG(CAFan_KW) FROM data)) > 3 * (SELECT STDDEV(CAFan_KW) FROM data) THEN 1 END) AS CAFan_KW_outliers FROM data;

-- Mill_soundnoise
SELECT COUNT(CASE WHEN ABS(Mill_soundnoise - (SELECT AVG(Mill_soundnoise) FROM data)) > 3 * (SELECT STDDEV(Mill_soundnoise) FROM data) THEN 1 END) AS Mill_soundnoise_outliers FROM data;

-- Mill_inletDraft
SELECT COUNT(CASE WHEN ABS(Mill_inletDraft - (SELECT AVG(Mill_inletDraft) FROM data)) > 3 * (SELECT STDDEV(Mill_inletDraft) FROM data) THEN 1 END) AS Mill_inletDraft_outliers FROM data;

-- Mill_outletDraft
SELECT COUNT(CASE WHEN ABS(Mill_outletDraft - (SELECT AVG(Mill_outletDraft) FROM data)) > 3 * (SELECT STDDEV(Mill_outletDraft) FROM data) THEN 1 END) AS Mill_outletDraft_outliers FROM data;

-- Sep_Vent_inletdraft
SELECT COUNT(CASE WHEN ABS(Sep_Vent_inletdraft - (SELECT AVG(Sep_Vent_inletdraft) FROM data)) > 3 * (SELECT STDDEV(Sep_Vent_inletdraft) FROM data) THEN 1 END) AS Sep_Vent_inletdraft_outliers FROM data;

-- Sep_Vent_outletdraft
SELECT COUNT(CASE WHEN ABS(Sep_Vent_outletdraft - (SELECT AVG(Sep_Vent_outletdraft) FROM data)) > 3 * (SELECT STDDEV(Sep_Vent_outletdraft) FROM data) THEN 1 END) AS Sep_Vent_outletdraft_outliers FROM data;

-- Sep_ventbagfilter_fankw
SELECT COUNT(CASE WHEN ABS(Sep_ventbagfilter_fankw - (SELECT AVG(Sep_ventbagfilter_fankw) FROM data)) > 3 * (SELECT STDDEV(Sep_ventbagfilter_fankw) FROM data) THEN 1 END) AS Sep_ventbagfilter_fankw_outliers FROM data;

-- Sep_ventbagfilter_fanrpm
SELECT COUNT(CASE WHEN ABS(Sep_ventbagfilter_fanrpm - (SELECT AVG(Sep_ventbagfilter_fanrpm) FROM data)) > 3 * (SELECT STDDEV(Sep_ventbagfilter_fanrpm) FROM data) THEN 1 END) AS Sep_ventbagfilter_fanrpm_outliers FROM data;

-- Residue
SELECT COUNT(CASE WHEN ABS(Residue - (SELECT AVG(Residue) FROM data)) > 3 * (SELECT STDDEV(Residue) FROM data) THEN 1 END) AS Residue_outliers FROM data;
