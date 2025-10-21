# Global Power Plants – SQLite + Power BI Project

## 🌍 Overview
This portfolio project analyzes the **global power plant landscape** using an integrated pipeline:
- **SQLite** for data storage and SQL analysis
- **Power BI** for visualization and KPI reporting
- **Emission factors** for a simplified CO₂ estimation
- **What-If parameter** to simulate the impact of capacity factor changes

---

## 🔧 Data Source
**Dataset:** [Global Power Plant Database (World Resources Institute)](https://datasets.wri.org/dataset/globalpowerplantdatabase)  
**Files used:**
- `global_power_plant_database.csv`
- `emission_factors.csv` (custom table for CO₂ intensities)

**SQLite schema:**
- `global_power_plants` – main plant dataset
- `emission_factors` – CO₂ intensity per primary fuel
- `v_capacity_by_fuel` – installed capacity aggregated by fuel
- `v_commissioning` – commissioning trend over years

---

## 🧮 Key KPIs
| Metric | Description |
|---------|-------------|
| **Total Capacity (MW)** | Installed power generation capacity |
| **Plants Count** | Total number of plants worldwide |
| **Average Capacity per Plant (MW)** | Mean capacity |
| **Annual CO₂ (kt)** | Estimated annual CO₂ emissions based on capacity factor |
| **Fuel Mix** | Share of total capacity by primary fuel |
| **Commissioning Trend** | Annual installed capacity over time |
| **Country Ranking** | Top 10 countries by installed capacity |

---

## 📊 Power BI Dashboard

**Page 1 – Global Overview**
- KPI Cards: Total Capacity, Plants Count, CO₂ (kt)
- Fuel Mix (Stacked Column)
- Commissioning Trend (Line)
- Interactive Map of Plants
- What-If Slider: *Capacity Factor*

**Page 2 – Country Comparison**
- Top 10 Countries by Installed Capacity
- Plant Map by Region

**Page 3 – Fuel and Emission Analysis**
- Fuel Capacity (MW) by Country
- Annual CO₂ (kt) by Country
- Adjustable *Capacity Factor* (0.0–0.95)

---

## ⚙️ Technical Setup

### 1. SQLite
- Load SQL DDL: `sql/sqlite_ddl.sql`
- Import CSVs into tables

### 2. Power BI

- Get Data → ODBC → SQLite3 ODBC Driver
- Connect to energy_sql_bi.db
- Add relationship: global_power_plants[primary_fuel] → emission_factors[primary_fuel]
- Load measures from measure_definitions.txt


## 📈 DAX Measures (highlights)
Total Capacity (MW) = SUM(global_power_plants[capacity_mw])
Plants Count = COUNTROWS(global_power_plants)
Average Capacity (MW) = AVERAGE(global_power_plants[capacity_mw])
Annual CO2 (kt) =
SUMX(
    global_power_plants,
    global_power_plants[capacity_mw] * 8760 * [Capacity Factor Value] *
    RELATED(EmissionFactors[kg_co2_per_mwh]) / 1000
)


## 🧩 Tools

- SQLite + DB Browser for SQLite
- Power BI Desktop (Import Mode via ODBC)
- Python / SQL for preprocessing
- GitHub for version control

## 📄 Author

Yuchuan Liu – Data Analyst / Software Engineer
Berlin, Germany · GitHub: [SW-oasen](https://github.com/SW-oasen)

