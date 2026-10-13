CREATE TABLE steel_energy (
  "date" VARCHAR(20),
  "Usage_kWh" NUMERIC,
  "Lagging_Current_Reactive.Power_kVarh" NUMERIC,
  "Leading_Current_Reactive_Power_kVarh" NUMERIC,
  "CO2(tCO2)" NUMERIC,
  "Lagging_Current_Power_Factor" NUMERIC,
  "Leading_Current_Power_Factor" NUMERIC,
  "NSM" INT,
  "WeekStatus" VARCHAR(10),
  "Day_of_week" VARCHAR(12),
  "Load_Type" VARCHAR(15)
);

ALTER TABLE steel_energy ALTER COLUMN "date" TYPE TIMESTAMP
USING TO_TIMESTAMP("date",'DD/MM/YYYY HH24:MI');

SELECT COUNT(*) FROM steel_energy;

SELECT "WeekStatus", EXTRACT(HOUR FROM "date") AS jam, ROUND(AVG("Usage_kWh")::numeric,2) AS avg_kwh
FROM steel_energy GROUP BY 1,2 ORDER BY 1,2;

SELECT "WeekStatus", "Load_Type", COUNT(*) AS n,
       ROUND(100.0*COUNT(*)/SUM(COUNT(*)) OVER (PARTITION BY "WeekStatus"),1) AS pct
FROM steel_energy GROUP BY 1,2 ORDER BY 1,2;

SELECT EXTRACT(HOUR FROM "date") AS jam,
       ROUND(100.0*AVG(("Lagging_Current_Power_Factor" < 90)::int),1) AS pct_low_pf
FROM steel_energy GROUP BY 1 ORDER BY 1;

WITH h AS (SELECT EXTRACT(HOUR FROM "date") AS jam, SUM("Usage_kWh") AS kwh FROM steel_energy GROUP BY 1)
SELECT jam, kwh, ROUND(100*kwh/SUM(kwh) OVER (),1) AS pct_total FROM h ORDER BY kwh DESC LIMIT 5;