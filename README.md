# Energy-Aware Production Scheduling

**Analyzing Industrial Energy Consumption with Python and SQL**

## Overview

Energy consumption is an important factor in manufacturing operations, affecting both operating costs and resource efficiency. Understanding when energy demand is highest and how consumption varies across operating periods can help identify opportunities to improve production planning.

This project analyzes industrial energy consumption data using Python and SQL, with a focus on hourly consumption patterns, weekday versus weekend behavior, load categories, and power factor performance.

The objective is to turn operational data into actionable insights that can support energy-aware production planning.

## Business Questions

The analysis focuses on the following questions:

* How does average energy consumption vary by hour and day type?
* How is the distribution of load categories different between weekdays and weekends?
* During which hours is low lagging power factor more prevalent?
* Which hours account for the largest share of total energy consumption?
* How can these findings inform production scheduling and energy management decisions?

## Dataset

**File:** `steel_energy_SYNTHETIC.csv`

The dataset contains time-based energy measurements and operational indicators, including:

| Variable                               | Description                       |
| -------------------------------------- | --------------------------------- |
| `date`                                 | Date and time of the observation  |
| `Usage_kWh`                            | Energy consumption in kWh         |
| `Lagging_Current_Reactive.Power_kVarh` | Lagging reactive energy           |
| `Leading_Current_Reactive_Power_kVarh` | Leading reactive energy           |
| `CO2(tCO2)`                            | Recorded CO₂-related metric       |
| `Lagging_Current_Power_Factor`         | Lagging power factor              |
| `Leading_Current_Power_Factor`         | Leading power factor              |
| `NSM`                                  | Number of seconds from midnight   |
| `WeekStatus`                           | Weekday or weekend classification |
| `Day_of_week`                          | Day of the week                   |
| `Load_Type`                            | Load category                     |

The dataset is synthetic and is used for analytical and portfolio purposes.

## Analytical Approach

### 1. Data Preparation

The dataset is loaded into Python for initial inspection and preparation. The timestamp and numerical fields are checked to ensure they are suitable for subsequent analysis.

### 2. Exploratory Data Analysis

Python is used to examine consumption patterns, compare operating periods, and visualize relevant relationships in the data.

The analysis emphasizes hourly energy usage, variations between weekdays and weekends, and differences across load categories.

### 3. SQL Analysis

SQL is used to validate and summarize the data from an operational perspective. The queries cover:

* Total record count.
* Average hourly energy consumption by week status.
* Load-type distribution by week status.
* Percentage of observations with low lagging power factor by hour.
* Top five hours by total energy consumption and their contribution to overall usage.

### 4. Operational Interpretation

The results are interpreted in terms of potential opportunities for energy management and production planning.

High-consumption periods can be investigated alongside production requirements, while recurring low power factor periods may warrant further technical review.

These findings are intended to support decision-making rather than assume that shifting production will automatically reduce energy costs.

## Tools & Technologies

* **Python:** Data analysis and exploratory analysis.
* **Pandas & NumPy:** Data preparation and numerical operations.
* **Matplotlib & Seaborn:** Data visualization.
* **SQL (PostgreSQL):** Data aggregation, time-based analysis, and analytical queries.
* **Jupyter Notebook:** Analysis and documentation.

## Repository Structure

```text
energy-aware-production-scheduling/
├── Analysis.sql
├── Energy_Aware_Production_Scheduling.ipynb
├── steel_energy_SYNTHETIC.csv
└── README.md
```

## Getting Started

Clone the repository:

```bash
git clone https://github.com/Refaldi-coder/energy-aware-production-scheduling.git
cd energy-aware-production-scheduling
```

Install the Python dependencies:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

Launch the notebook:

```bash
jupyter notebook Energy_Aware_Production_Scheduling.ipynb
```

Ensure the CSV file is available at the path referenced in the notebook before running the analysis.

For SQL analysis, create the `steel_energy` table in PostgreSQL, import the dataset, and execute `Analysis.sql`. The table schema and timestamp format should match the SQL script.

## Business Relevance

The analysis provides a starting point for investigating how energy consumption varies across operating periods. In a manufacturing environment, this information can help production and operations teams:

* Identify periods with consistently high energy demand.
* Review whether production activities align with energy-use patterns.
* Investigate potential power factor issues.
* Establish a baseline for further energy-efficiency analysis.

Actual scheduling recommendations require additional information, such as production orders, machine availability, processing times, delivery deadlines, and time-of-use electricity tariffs.

## Limitations

This project focuses on energy consumption analysis and does not, by itself, establish an optimized production schedule. The dataset is synthetic, and the analysis does not demonstrate verified cost savings or reductions in emissions.

Further development could incorporate production constraints, electricity pricing, and scheduling optimization to evaluate the operational and financial impact of alternative production plans.

## Author

**Muhammad Refaldi**

Industrial Engineering | Data Analytics

[GitHub Profile](https://github.com/Refaldi-coder)
