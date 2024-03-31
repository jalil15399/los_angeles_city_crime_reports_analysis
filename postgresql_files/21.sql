COPY
(
SELECT

(SELECT count(*) FROM los_angeles_crime_reports WHERE 
crime_code_description ~* 'stolen|burglary|Vandalism|theft|robbery|shoplift|pickpocket|snatching') 
AS theft,

(SELECT count(*) FROM los_angeles_crime_reports
WHERE crime_code_description ~* 'assault|intimate|weapon|firearms|fired|arson|battery|lynching
 |manslaughter'
	AND crime_code_description !~* 'sex|sexual')
AS assault,

(SELECT count(*) FROM los_angeles_crime_reports WHERE 
crime_code_description ~* 'trespassing|threats|letters|violation|document|contempt|failure|peace
 |arrest|riot') 
AS legal,

(SELECT count(*) FROM los_angeles_crime_reports
WHERE crime_code_description ~* 'rape|sex|sexual|oral|pimping|indecent|trafficking|firefight
 |bigamy|imprisonment|extortion') 
AS body
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_by_type.csv'
WITH (FORMAT CSV, HEADER)
;


COPY
(
SELECT area_name, count(*) 
FROM los_angeles_crime_reports 
GROUP BY area_name
ORDER BY count(*) DESC
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_by_area.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT premis_description, count(*) 
FROM los_angeles_crime_reports 
GROUP BY premis_description
ORDER BY count(*) DESC
LIMIT 25
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_by_premis.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_sex, count(*)
FROM los_angeles_crime_reports 
WHERE victim_sex !~* 'x'
GROUP BY victim_sex
ORDER BY count(*) DESC
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_by_victim_sex.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_age, count(*)
FROM los_angeles_crime_reports
WHERE victim_age > 0
GROUP BY victim_age
ORDER BY victim_age ASC
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_by_victim_age.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT case_status_description, count(*)
FROM los_angeles_crime_reports
GROUP BY case_status_description
ORDER BY count(*) DESC
LIMIT 5
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_by_case_status.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT date_occur, time_occur, crime_code_description, victim_sex, victim_age, victim_descent,
	premis_description, longitude, latitude
FROM los_angeles_crime_reports
WHERE victim_age > 0 AND victim_sex !~* 'x' AND victim_descent !~* 'unknown'
	AND (longitude BETWEEN -117.630 AND -118.997 
	OR latitude BETWEEN 33.707 AND 34.841)
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/location_wise_data.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_descent, count(*)
FROM los_angeles_crime_reports
WHERE victim_descent !~* 'unknown'
GROUP BY victim_descent
ORDER BY count(*) DESC
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_by_victim_descent.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_descent, crime_code_description, count(*)
FROM los_angeles_crime_reports
WHERE victim_descent !~* 'Unknown'
GROUP BY victim_descent, crime_code_description
ORDER BY victim_descent, count(*) DESC
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_by_victim_descent_description.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_descent, victim_sex, count(*)
FROM los_angeles_crime_reports
WHERE victim_descent !~* 'unknown' AND victim_sex !~* 'x' AND victim_age > 0
	AND victim_sex ~* 'f'
GROUP BY victim_descent, victim_sex
ORDER BY count(*) DESC
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/victim_descent_sex_female.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_descent, victim_sex, count(*)
FROM los_angeles_crime_reports
WHERE victim_descent !~* 'unknown' AND victim_sex !~* 'x' AND victim_age > 0
	AND victim_sex ~* 'M'
GROUP BY victim_descent, victim_sex
ORDER BY count(*) DESC
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/victim_descent_sex_male.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_descent, victim_sex, count(*)
FROM los_angeles_crime_reports
WHERE victim_descent !~* 'unknown' AND victim_sex !~* 'x' AND victim_age > 0
	AND victim_sex ~* 'h'
GROUP BY victim_descent, victim_sex
ORDER BY count(*) DESC
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/victim_descent_sex_homo.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_sex, victim_age, count(*)
FROM los_angeles_crime_reports
WHERE victim_sex !~* 'unknown' AND victim_sex !~* 'x' AND victim_age > 0
	AND victim_sex ~* 'H'
GROUP BY victim_sex, victim_age
ORDER BY victim_age
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/victim_sex_age_homo.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_sex, victim_age, count(*)
FROM los_angeles_crime_reports
WHERE victim_sex !~* 'unknown' AND victim_sex !~* 'x' AND victim_age > 0
	AND victim_sex ~* 'f'
GROUP BY victim_sex, victim_age
ORDER BY victim_age
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/victim_sex_age_female.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_sex, victim_age, count(*)
FROM los_angeles_crime_reports
WHERE victim_sex !~* 'unknown' AND victim_sex !~* 'x' AND victim_age > 0
	AND victim_sex ~* 'm'
GROUP BY victim_sex, victim_age
ORDER BY victim_age
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/victim_sex_age_male.csv'
WITH (FORMAT CSV, HEADER);