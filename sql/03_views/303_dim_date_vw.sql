USE nexopay;

DROP VIEW IF EXISTS dim_date_vw;

CREATE OR REPLACE VIEW dim_date_vw AS
WITH RECURSIVE d AS (
  SELECT DATE_SUB(CURDATE(), INTERVAL 365 DAY) AS dt
  UNION ALL
  SELECT DATE_ADD(dt, INTERVAL 1 DAY) FROM d
  WHERE dt < DATE_ADD(CURDATE(), INTERVAL 365 DAY)
)
SELECT
  dt                                        AS `date`,
  YEAR(dt)                                  AS `year`,
  QUARTER(dt)                                AS `quarter`,
  MONTH(dt)                                  AS `month`,
  DATE_FORMAT(dt,'%M')                       AS month_name,
  WEEK(dt, 3)                                AS iso_week,
  DAY(dt)                                    AS day_of_month,
  DAYNAME(dt)                                AS day_name,
  IF(DAYOFWEEK(dt) IN (1,7), 0, 1)           AS is_business_day
FROM d;

SHOW CREATE VIEW dim_date_vw;
DESCRIBE dim_date_vw;
SELECT * FROM dim_date_vw
WHERE `date` BETWEEN '2020-01-01' AND '2025-12-31';