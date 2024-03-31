CREATE EXTENSION postgis;

SELECT crime_code_description, victim_age, victim_sex, victim_descent, premis_description
FROM los_angeles_crime_reports
WHERE crime_code_description ~* 'sex|rape' AND crime_code_description !~* 'offender registrant'
AND victim_sex ~ 'M' AND victim_descent !~* '(black|india|unknown)' 
AND victim_age < 26 AND victim_age > 15
;