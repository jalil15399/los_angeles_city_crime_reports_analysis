ALTER TABLE los_angeles_crime_reports ADD CONSTRAINT division_key PRIMARY KEY (division_record)
;
ALTER TABLE los_angeles_crime_reports_backup ADD CONSTRAINT division_backup_key PRIMARY KEY (division_record)
;

CREATE INDEX crime_idx ON los_angeles_crime_reports (crime_code_description);

UPDATE los_angeles_crime_reports o
SET victim_descent = b.victim_descent
FROM los_angeles_crime_reports_backup b
WHERE o.division_record = b.division_record
;