SELECT	to_date(CONCAT(year_occur, '/', month_occur), 'YYYY/MM') AS year_month, count(*)
FROM los_angeles_crime_reports
GROUP BY year_month
ORDER BY year_month;