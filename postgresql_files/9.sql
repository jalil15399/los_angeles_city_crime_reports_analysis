SELECT crime_code_description, victim_age, victim_sex, victim_descent, premis_description, date_occur,
time_occur
FROM los_angeles_crime_reports
WHERE (crime_code_description ILIKE '%sex%'
OR crime_code_description ILIKE 'rape%') AND 
victim_sex = 'M' AND victim_age < 26 AND victim_age > 10
ORDER BY victim_age, victim_descent;