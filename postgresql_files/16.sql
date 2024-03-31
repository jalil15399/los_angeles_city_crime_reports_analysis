ALTER TABLE los_angeles_crime_reports ADD COLUMN geog_point geography(POINT, 4326);

UPDATE los_angeles_crime_reports 
SET geog_point = 
	ST_SetSRID 
	(
		ST_MakePoint(longitude, latitude)::geography, 4326
	);

CREATE INDEX crime_location_idx ON los_angeles_crime_reports USING GIST(geog_point);

COPY
(
SELECT crime_code_description, count(*)
FROM los_angeles_crime_reports
GROUP BY crime_code_description
ORDER BY count(*) DESC
LIMIT 20
)
TO
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/top_20_crimes.csv'
WITH (FORMAT CSV, HEADER);