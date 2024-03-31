SELECT victim_sex, count(*) 
FROM los_angeles_crime_reports
GROUP BY victim_sex;