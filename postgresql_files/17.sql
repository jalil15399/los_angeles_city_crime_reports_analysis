COPY
(
SELECT year_occur, count(*)
FROM los_angeles_crime_reports
GROUP BY year_occur
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/year_crime_data.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT date_occur::date, count(*)
FROM los_angeles_crime_reports
GROUP BY date_occur
ORDER BY date_occur
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/daily_crime_data.csv'
WITH (FORMAT CSV, HEADER);