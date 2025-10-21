# SQLite Quickstart

## Install
- **Windows/macOS/Linux:** Install either the `sqlite3` command-line tool or a GUI like **DB Browser for SQLite**.
  - CLI test: run `sqlite3 --version` in your terminal.

## Create DB and load data
From the project root (folder contains `sql/sqlite_ddl.sql`):

```bash
# create database file
sqlite3 energy_sql_bi.db ".read sql/sqlite_ddl.sql"

# import CSVs (adjust path if needed)
sqlite3 energy_sql_bi.db ".mode csv" ".import data/global_power_plant_database.csv power_plants"
sqlite3 energy_sql_bi.db ".mode csv" ".import data/emission_factors.csv emission_factors"

# run sample queries
sqlite3 energy_sql_bi.db ".read sql/sample_queries_sqlite.sql"
```

## Power BI
- Get Data → **SQLite** (needs the SQLite ODBC driver) *oder* export Views als CSV und in Power BI importieren.
- Alternativ: Nutze **DuckDB** als Zwischenschritt (kann direkt in Power BI via ODBC).

> Tipp: Für den schnellsten Start ist SQLite perfekt. Für realitätsnähere Szenarien wechselst du später auf PostgreSQL oder BigQuery.