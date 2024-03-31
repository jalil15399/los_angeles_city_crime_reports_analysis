CREATE TABLE los_angeles_crime_reports (
	division_record text,
	date_rptd timestamp with time zone,
	date_occur timestamp with time zone,
	time_occur text,
	area_code smallint,
	area_name text,
	sub_area_code integer,
	part smallint,
	crime_code smallint,
	crime_code_description text,
	mo_codes text,
	victim_age smallint,
	victim_sex text,
	victim_descent text,
	premis_code smallint,
	premis_description text,
	weapon_code smallint,
	weapon_description text,
	case_status text,
	case_status_description text,
	crime_code_1 smallint,
	crime_code_2 smallint,
	crime_code_3 smallint,
	crime_code_4 smallint,
	location text,
	cross_street text,
	latitude numeric(9,5),
	longitude numeric(9,5)
);

COPY los_angeles_crime_reports FROM
'C:/Users/Jalil Ahamd/Desktop/project_5/csv_files/cleaned.csv'
WITH (FORMAT CSV, HEADER);