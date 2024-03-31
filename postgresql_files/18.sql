SELECT year_occur, month_occur, 
	to_date(CONCAT(year_occur, '/', month_occur), 'YYYY/MM') AS year_month
FROM los_angeles_crime_reports;