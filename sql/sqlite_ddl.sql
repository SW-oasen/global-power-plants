-- Kapazität je Brennstoff
DROP VIEW IF EXISTS v_capacity_by_fuel;
CREATE VIEW v_capacity_by_fuel AS
SELECT
  COALESCE(primary_fuel,'Unknown') AS primary_fuel,
  SUM(capacity_mw) AS capacity_mw,
  COUNT(*) AS plant_count
FROM global_power_plants
GROUP BY 1;

-- Commissioning-Trend (achte auf deinen Integer-Fix: commissioning_year)
DROP VIEW IF EXISTS v_commissioning;
CREATE VIEW v_commissioning AS
SELECT
  commissioning_year AS commissioning_year,
  SUM(capacity_mw) AS capacity_mw,
  COUNT(*) AS plant_count
FROM global_power_plants
WHERE commissioning_year IS NOT NULL
GROUP BY commissioning_year
ORDER BY commissioning_year;

-- Master-View mit den wichtigsten Spalten für Karten & Filter
DROP VIEW IF EXISTS v_plants_master;
CREATE VIEW v_plants_master AS
SELECT
  name, country, country_long, capacity_mw,
  latitude, longitude, primary_fuel,
  commissioning_year
FROM global_power_plants;
