UPDATE los_angeles_crime_reports
SET victim_descent =
CASE 
	WHEN victim_descent = 'A' THEN 'Other Asian'
	WHEN victim_descent = 'B' THEN 'Black'
	WHEN victim_descent = 'C' THEN 'Chinese'
	WHEN victim_descent = 'D' THEN 'Cambodian'
	WHEN victim_descent = 'F' THEN 'Filipino'
	WHEN victim_descent = 'G' THEN 'Guamanian'
	WHEN victim_descent = 'H' THEN 'Hispanic'
	WHEN victim_descent = 'I' THEN 'America Indian'
	WHEN victim_descent = 'J' THEN 'Japanese'
	WHEN victim_descent = 'K' THEN 'Korean'
	WHEN victim_descent = 'L' THEN 'Laotian'
	WHEN victim_descent = 'O' THEN 'Other'
	WHEN victim_descent = 'P' THEN 'Pacific'
	WHEN victim_descent = 'S' THEN 'Samoan'
	WHEN victim_descent = 'U' THEN 'Hawaiian'
	WHEN victim_descent = 'V' THEN 'Vietnamese'
	WHEN victim_descent = 'W' THEN 'White'
	WHEN victim_descent = 'X' THEN 'Unknown'
	WHEN victim_descent = 'Z' THEN 'Asian Indian'
	ELSE 'Unknown'
END;


SELECT * FROM los_angeles_crime_reports
WHERE victim_descent NOT IN ('Other Asian', 'Black', 'Chinese', 'Cambodian', 'Filipino', 'Guamanian', 
							 'Hispanic', 'American Indian', 'Japanese', 'Korean', 'Laotian', 'Other', 
							 'Pacific', 'Samoan', 'Hawaiian', 'Vietnamese', 'White', 'Unknown', 
							 'Asian Indian');