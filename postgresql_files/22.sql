COPY
(
SELECT victim_descent, case_status_description, count(*)
FROM los_angeles_crime_reports
WHERE victim_descent !~* 'unknown' AND case_status_description !~* 'unk'
	AND case_status_description ~* 'invest cont'
GROUP BY victim_descent, case_status_description
ORDER BY count(*) DESC
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/victim_descent_case_invest_cont.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT * 
FROM los_angeles_crime_reports
WHERE victim_age > 0 AND victim_sex !~* 'x' AND victim_descent !~* 'unknown'
	AND (longitude BETWEEN -117.630 AND -118.997 
	OR latitude BETWEEN 33.707 AND 34.841)
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/all_crime_data.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_descent, victim_sex, victim_age, crime_code_description, longitude, latitude 
FROM los_angeles_crime_reports
WHERE victim_age > 0 AND victim_sex !~* 'x' AND victim_descent !~* 'unknown'
	AND crime_code_description ~* 'stolen|burglary|Vandalism|theft|robbery|shoplift|pickpocket|snatching'
	AND (longitude BETWEEN -117.630 AND -118.997 
		 OR latitude BETWEEN 33.707 AND 34.841)
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_data_theft.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_descent, victim_sex, victim_age, crime_code_description, longitude, latitude 
FROM los_angeles_crime_reports
WHERE victim_age > 0 AND victim_sex !~* 'x' AND victim_descent !~* 'unknown'
	AND crime_code_description ~* 'assault|intimate|weapon|firearms|fired|arson|battery|lynching
 |manslaughter' AND crime_code_description !~* 'sex|sexual'
	AND (longitude BETWEEN -117.630 AND -118.997 
		 OR latitude BETWEEN 33.707 AND 34.841)
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_data_assault.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_descent, victim_sex, victim_age, crime_code_description, longitude, latitude 
FROM los_angeles_crime_reports
WHERE victim_age > 0 AND victim_sex !~* 'x' AND victim_descent !~* 'unknown'
	AND crime_code_description ~* 'trespassing|threats|letters|violation|document|contempt|failure|peace
 |arrest|riot'
	AND (longitude BETWEEN -117.630 AND -118.997 
		 OR latitude BETWEEN 33.707 AND 34.841)
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_data_legal.csv'
WITH (FORMAT CSV, HEADER);


COPY
(
SELECT victim_descent, victim_sex, victim_age, crime_code_description, longitude, latitude 
FROM los_angeles_crime_reports
WHERE victim_age > 0 AND victim_sex !~* 'x' AND victim_descent !~* 'unknown'
	AND crime_code_description ~* 'rape|sex|sexual|oral|pimping|indecent|trafficking|firefight
 |bigamy|imprisonment|extortion'
	AND (longitude BETWEEN -117.630 AND -118.997 
		 OR latitude BETWEEN 33.707 AND 34.841)
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/crime_data_body.csv'
WITH (FORMAT CSV, HEADER);