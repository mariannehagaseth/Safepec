SELECT DISTINCT IMO_No,
          (CASE Classed_By 
             WHEN '' THEN 'http://data.safepec.eu/2016/bn/0.3/hooks_Non_IACS'
             WHEN Class_society  THEN  'http://data.safepec.eu/2016/bn/0.3/hooks_IACS'
             ELSE 'http://data.safepec.eu/2016/bn/0.3/hooks_Non_IACS'
         END)
         AS IACS_membership,
        (CASE kb_flag_fatigue.flag_colour
             WHEN 'white' THEN  'http://data.safepec.eu/2016/bn/0.3/hooks_white'
             WHEN 'grey'  THEN  'http://data.safepec.eu/2016/bn/0.3/hooks_grey'
             WHEN 'black' THEN  'http://data.safepec.eu/2016/bn/0.3/hooks_black'
             ELSE 'http://data.safepec.eu/2016/bn/0.3/hooks_black'
         END)
         AS Flag_col,
       (CASE  STR_TO_DATE (keel_laid, '%d-%b-%y') >= DATE_SUB(NOW(), INTERVAL 5 YEAR)
             WHEN TRUE THEN  'http://data.safepec.eu/2016/bn/0.3/hooks_young'
             ELSE 'http://data.safepec.eu/2016/bn/0.3/hooks_old'
         END)
       AS age
         FROM (ihs_tblship LEFT JOIN kb_iacs_membership ON (Classed_By=Class_society)) LEFT JOIN kb_flag_fatigue ON (Flag_state=Flag)
