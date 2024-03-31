CREATE TABLE los_angeles_crime_reports_backup AS
(SELECT * FROM los_angeles_crime_reports);

SELECT date_part('year', date_occur)
FROM los_angeles_crime_reports
ORDER BY date_part('year', date_occur) ASC;