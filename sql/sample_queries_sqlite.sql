-- Sample SQL queries for SQLite

-- 1) Basic row count
SELECT COUNT(*) AS rows_total FROM power_plants;

-- 2) Capacity by primary fuel (top 10)
SELECT primary_fuel, SUM(capacity_mw) AS capacity_mw
FROM power_plants
GROUP BY primary_fuel
ORDER BY capacity_mw DESC
LIMIT 10;

-- 3) Plants and capacity by country (top 15)
SELECT country_long, COUNT(*) AS plants, SUM(capacity_mw) AS capacity_mw
FROM power_plants
GROUP BY country_long
ORDER BY capacity_mw DESC
LIMIT 15;

-- 4) Commissioning trend (last 30 years)
SELECT commissioning_year, SUM(capacity_mw) AS capacity_mw
FROM power_plants
WHERE commissioning_year BETWEEN CAST(strftime('%Y','now') AS INTEGER) - 30 AND CAST(strftime('%Y','now') AS INTEGER)
GROUP BY commissioning_year
ORDER BY commissioning_year;

-- 5) Join with emission factors (capacity-weighted factor example)
SELECT
  p.primary_fuel,
  SUM(p.capacity_mw) AS capacity_mw,
  ef.kg_co2_per_mwh
FROM power_plants p
LEFT JOIN emission_factors ef ON ef.primary_fuel = p.primary_fuel
GROUP BY p.primary_fuel, ef.kg_co2_per_mwh
ORDER BY capacity_mw DESC;