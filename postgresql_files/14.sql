UPDATE los_angeles_crime_reports
SET victim_sex = 
CASE
	WHEN victim_sex NOT IN ('M', 'F', 'H') THEN 'X'
	ELSE 'X'
END;