SELECT * 
FROM los_angeles_crime_reports
WHERE (crime_code_description ILIKE 'rape%'
OR crime_code_description ILIKE 'sex%'
OR crime_code_description ILIKE 'penis%')
AND victim_sex = 'M'
AND victim_age > 5 AND victim_age < 30 AND victim_descent = 'W'
;