COPY
(
SELECT crime_code_description
FROM los_angeles_crime_reports
GROUP BY crime_code_description
) TO
'C:/Users/Jalil Ahamd/Desktop/project_5/crime_description_explaination.csv'
WITH (FORMAT CSV, HEADER);