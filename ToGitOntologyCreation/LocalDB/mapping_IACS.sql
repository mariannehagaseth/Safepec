SELECT DISTINCT IMO_No, 
Classed_By, Class_society,
(CASE Classed_By
    WHEN "" THEN "<http://data.safepec.eu/2016/bn/0.3/iacs_membership_unknown>"
    WHEN Class_society  THEN  "<http://data.safepec.eu/2016/bn/0.3/iacs_membership_true>"
    ELSE "<http://data.safepec.eu/2016/bn/0.3/iacs_membership_false>"
END)
AS IACS_membership_status
FROM ihs_tblship LEFT JOIN kb_iacs_membership_status ON (Classed_By=Class_society)
;
 

