COPY
(
SELECT	to_date(CONCAT(year_occur, '/', month_occur), 'YYYY/MM') AS year_month, count(*)
FROM los_angeles_crime_reports
GROUP BY year_month
ORDER BY year_month
LIMIT 50
)
TO 
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/monthly_crime_data.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT	to_date(CONCAT(year_occur, '/', quarter_occur), 'YYYY/MM') AS year_month, count(*)
FROM los_angeles_crime_reports
GROUP BY year_month
ORDER BY year_month
LIMIT 50
)
TO 
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/quarterly_crime_data.csv'
WITH (FORMAT CSV, HEADER);