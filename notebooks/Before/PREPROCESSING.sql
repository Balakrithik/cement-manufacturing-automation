CREATE TABLE data_clean AS
SELECT * FROM data;

/* Drop records where there are outliers */
-- Create a temporary table to store records with outliers
CREATE TEMPORARY TABLE temp_outliers1 AS
SELECT *
FROM data_clean
WHERE
(ABS(Mill_TPH - (SELECT AVG(Mill_TPH) FROM data)) <= 3 * (SELECT STDDEV(Mill_TPH) FROM data))
  OR (ABS(Clinker_TPH - (SELECT AVG(Clinker_TPH) FROM data)) <= 3 * (SELECT STDDEV(Clinker_TPH) FROM data))
  OR (ABS(Gypsum_TPH - (SELECT AVG(Gypsum_TPH) FROM data)) <= 3 * (SELECT STDDEV(Gypsum_TPH) FROM data))
  OR (ABS(DFA_TPH - (SELECT AVG(DFA_TPH) FROM data)) <= 3 * (SELECT STDDEV(DFA_TPH) FROM data))
  OR (ABS(WFA_TPH - (SELECT AVG(WFA_TPH) FROM data)) <= 3 * (SELECT STDDEV(WFA_TPH) FROM data))
  OR (ABS(Mill_KW - (SELECT AVG(Mill_KW) FROM data)) <= 3 * (SELECT STDDEV(Mill_KW) FROM data))
  OR (ABS(Mill_inletTemp - (SELECT AVG(Mill_inletTemp) FROM data)) <= 3 * (SELECT STDDEV(Mill_inletTemp) FROM data))
  OR (ABS(Mill_outletTemp - (SELECT AVG(Mill_outletTemp) FROM data)) <= 3 * (SELECT STDDEV(Mill_outletTemp) FROM data))
  OR (ABS(Mill_outletAmp - (SELECT AVG(Mill_outletAmp) FROM data)) <= 3 * (SELECT STDDEV(Mill_outletAmp) FROM data))
  OR (ABS(Mill_VentFan_RPM - (SELECT AVG(Mill_VentFan_RPM) FROM data)) <= 3 * (SELECT STDDEV(Mill_VentFan_RPM) FROM data))
  OR (ABS(Mill_VentFan_KW - (SELECT AVG(Mill_VentFan_KW) FROM data)) <= 3 * (SELECT STDDEV(Mill_VentFan_KW) FROM data))
  OR (ABS(Mill_VentBF_inletDraft - (SELECT AVG(Mill_VentBF_inletDraft) FROM data)) <= 3 * (SELECT STDDEV(Mill_VentBF_inletDraft) FROM data))
  OR (ABS(mill_vent_bf_ol_draft - (SELECT AVG(mill_vent_bf_ol_draft) FROM data)) <= 3 * (SELECT STDDEV(mill_vent_bf_ol_draft) FROM data))
  OR (ABS(Reject - (SELECT AVG(Reject) FROM data)) <= 3 * (SELECT STDDEV(Reject) FROM data))
  OR (ABS(Sep_RPM - (SELECT AVG(Sep_RPM) FROM data_clean)) > 3 * (SELECT STDDEV(Sep_RPM) FROM data_clean))
  OR (ABS(Sep_KW - (SELECT AVG(Sep_KW) FROM data_clean)) > 3 * (SELECT STDDEV(Sep_KW) FROM data_clean))
  OR (ABS(Sep_Amp - (SELECT AVG(Sep_Amp) FROM data_clean)) > 3 * (SELECT STDDEV(Sep_Amp) FROM data_clean))
  OR (ABS(CAFan_RPM - (SELECT AVG(CAFan_RPM) FROM data_clean)) > 3 * (SELECT STDDEV(CAFan_RPM) FROM data_clean))
  OR (ABS(CAFan_KW - (SELECT AVG(CAFan_KW) FROM data_clean)) > 3 * (SELECT STDDEV(CAFan_KW) FROM data_clean))
  OR (ABS(Mill_soundnoise - (SELECT AVG(Mill_soundnoise) FROM data_clean)) > 3 * (SELECT STDDEV(Mill_soundnoise) FROM data_clean))
  OR (ABS(Mill_inletDraft - (SELECT AVG(Mill_inletDraft) FROM data_clean)) > 3 * (SELECT STDDEV(Mill_inletDraft) FROM data_clean))
  OR (ABS(Mill_outletDraft - (SELECT AVG(Mill_outletDraft) FROM data_clean)) > 3 * (SELECT STDDEV(Mill_outletDraft) FROM data_clean))
  OR (ABS(Sep_Vent_inletdraft - (SELECT AVG(Sep_Vent_inletdraft) FROM data_clean)) > 3 * (SELECT STDDEV(Sep_Vent_inletdraft) FROM data_clean))
  OR (ABS(Sep_Vent_outletdraft - (SELECT AVG(Sep_Vent_outletdraft) FROM data_clean)) > 3 * (SELECT STDDEV(Sep_Vent_outletdraft) FROM data_clean))
  OR (ABS(Sep_ventbagfilter_fankw - (SELECT AVG(Sep_ventbagfilter_fankw) FROM data_clean)) > 3 * (SELECT STDDEV(Sep_ventbagfilter_fankw) FROM data_clean))
  OR (ABS(Sep_ventbagfilter_fanrpm - (SELECT AVG(Sep_ventbagfilter_fanrpm) FROM data_clean)) > 3 * (SELECT STDDEV(Sep_ventbagfilter_fanrpm) FROM data_clean))
  OR (ABS(Residue - (SELECT AVG(Residue) FROM data_clean)) > 3 * (SELECT STDDEV(Residue) FROM data_clean));

-- Delete records with outliers from the original table
DELETE FROM data_clean
WHERE ( Mill_TPH,Clinker_TPH,Gypsum_TPH,DFA_TPH,WFA_TPH,Mill_KW,Mill_inletTemp,Mill_outletTemp,Mill_outletAmp,Mill_VentFan_RPM,Mill_VentFan_KW,Mill_VentBF_inletDraft,mill_vent_bf_ol_draft,Reject,Sep_RPM, Sep_KW, Sep_Amp, CAFan_RPM, CAFan_KW, Mill_soundnoise, Mill_inletDraft,
Mill_outletDraft, Sep_Vent_inletdraft, Sep_Vent_outletdraft, Sep_ventbagfilter_fankw,
Sep_ventbagfilter_fanrpm, Residue) IN (SELECT Mill_TPH,Clinker_TPH,Gypsum_TPH,DFA_TPH,WFA_TPH,Mill_KW,Mill_inletTemp,Mill_outletTemp,Mill_outletAmp,Mill_VentFan_RPM,Mill_VentFan_KW,Mill_VentBF_inletDraft,mill_vent_bf_ol_draft,Reject,Sep_RPM, Sep_KW, Sep_Amp, CAFan_RPM, CAFan_KW,
Mill_soundnoise, Mill_inletDraft, Mill_outletDraft, Sep_Vent_inletdraft, Sep_Vent_outletdraft,
Sep_ventbagfilter_fankw, Sep_ventbagfilter_fanrpm, Residue FROM temp_outliers1);

-- Delete records with outliers from the original table
DELETE FROM data_clean
WHERE (Mill_TPH,Clinker_TPH,Gypsum_TPH,DFA_TPH,WFA_TPH,Mill_KW,Mill_inletTemp,Mill_outletTemp,Mill_outletAmp,Mill_VentFan_RPM,Mill_VentFan_KW,Mill_VentBF_inletDraft,mill_vent_bf_ol_draft,Reject,Sep_RPM, Sep_KW, Sep_Amp, CAFan_RPM, CAFan_KW, Mill_soundnoise, Mill_inletDraft,
Mill_outletDraft, Sep_Vent_inletdraft, Sep_Vent_outletdraft, Sep_ventbagfilter_fankw,
Sep_ventbagfilter_fanrpm, Residue) IN (SELECT Mill_TPH,Clinker_TPH,Gypsum_TPH,DFA_TPH,WFA_TPH,Mill_KW,Mill_inletTemp,Mill_outletTemp,Mill_outletAmp,Mill_VentFan_RPM,Mill_VentFan_KW,Mill_VentBF_inletDraft,mill_vent_bf_ol_draft,Reject,Sep_RPM, Sep_KW, Sep_Amp, CAFan_RPM, CAFan_KW, Mill_soundnoise, Mill_inletDraft,
Mill_outletDraft, Sep_Vent_inletdraft, Sep_Vent_outletdraft, Sep_ventbagfilter_fankw,
Sep_ventbagfilter_fanrpm, Residue FROM temp_outliers1);


DELETE FROM data_clean
WHERE Mill_TPH IN (SELECT Mill_TPH FROM temp_outliers1);
-- Drop the temporary table
DROP TEMPORARY TABLE temp_outliers1;
