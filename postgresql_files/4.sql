SELECT * 
FROM los_angeles_crime_reports
WHERE crime_code_description ILIKE 'vehicle%' OR crime_code_description ILIKE 'bike%'
;