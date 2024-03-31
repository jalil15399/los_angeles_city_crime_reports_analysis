ALTER TABLE los_angeles_crime_reports ADD COLUMN year_occur text;
ALTER TABLE los_angeles_crime_reports ADD COLUMN month_occur text;
ALTER TABLE los_angeles_crime_reports ADD COLUMN day_occur text;
ALTER TABLE los_angeles_crime_reports ADD COLUMN week_occur text;
ALTER TABLE los_angeles_crime_reports ADD COLUMN quarter_occur text;

UPDATE los_angeles_crime_reports
SET year_occur = date_part('year', date_occur)
;
UPDATE los_angeles_crime_reports
SET month_occur = date_part('month', date_occur)
;
UPDATE los_angeles_crime_reports
SET quarter_occur = date_part('quarter', date_occur)
;
UPDATE los_angeles_crime_reports
SET day_occur = date_part('day', date_occur)
;
UPDATE los_angeles_crime_reports
SET week_occur = date_part('week', date_occur)
;