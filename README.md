# Chicago Taxi Market Analysis — GCP BigQuery + Looker Studio + ML (Fare + Demand Forecasting)

## 📌 Project Overview

This project analyses the **Chicago Taxi Trips dataset** (Google BigQuery Public Dataset) to simulate a **market entry strategy for Grab** as it considers expansion into the U.S. market.

Chicago serves as our case study city due to its large population, established ride-hailing demand, and competitive taxi/ride-hailing landscape.

We use:

* **Google BigQuery** for data querying and aggregation
* **Looker Studio (Google Data Studio)** for interactive dashboards and storytelling
* **Google Colab (Python ML models)** for predictive **fare pricing** and **demand forecasting**

---

## 🎯 Problem Statement

Pretend scenario: **Grab is evaluating entry into the U.S. ride-hailing market, starting with Chicago.**

Key questions:

* What is the current market situation?
* Who are the competitors?
* When is demand strongest?
* Where should Grab focus first?
* How should Grab price its services to compete effectively?
* How can Grab **forecast future demand** to optimize supply?

---

## 📊 Dashboard Pages

### 1️⃣ Market Overview

**Filters:** Month, Year

* Daily average trip count
* Average fare
* Market size overview
* Pickup hotspots by trip count (heatmap)
* Trip count by hour (bar graph)
* Fare distribution chart
* **Insights summary text box**

---

### 2️⃣ Competitor Analysis (Who?)

**Filters:** Company, Month, Year

* Pickup intensity heatmap
* Market share by trip count
* Comparison table: total trips, fleet size, avg fare, avg fare per mile, avg trip duration

---

### 3️⃣ Demand Patterns & Time Analysis (When?)

**Filters:** Year

* Peak month/day/hour (KPIs)
* Total trip count
* Monthly demand trends
* Hourly demand intensity (heatmap)
* Daily demand patterns
* **Operational recommendations**

---

### 4️⃣ Geographic Penetration Strategy (Where?)

**Filters:** Month, Year

* Trip count heatmap
* Top pickup areas (table)
* Top 5 taxi routes by trip count
* Underserved but high-demand areas
* **Market penetration recommendations**

---

### 5️⃣ Pricing Intelligence (How Much?)

**Filters:** Month, Year

* Average fare, fare per mile, and trip duration
* Trip type distribution (short, medium, long)
* Fare metrics by trip type
* **Market entry pricing recommendations**
* **Route-specific penetration strategies**

---

## 🤖 Machine Learning Models

### 1. Fare Prediction Model

Helps Grab estimate **expected fare levels** for any trip.

**Features used:**

* Trip distance (miles)
* Trip duration (seconds)
* Pickup/dropoff location (community area)
* Time features (hour, day of week, month)
* Company (where applicable)

**Target:** `fare`

**Models tested:**

* Linear Regression
* Random Forest Regressor
* Gradient Boosted Trees

**Outcome:**

* **Random Forest** achieved the best accuracy (highest R², lowest RMSE).
* Enables:

  * Optimized **dynamic pricing strategies**
  * Identification of **overpriced/underpriced routes**
  * Smarter **market penetration tactics**

---

### 2. Demand Forecasting Model

Predicts **future trip demand** across time, geography, and conditions.

**Features engineered (via BigQuery + SQL):**

* Temporal: hour, day of week, month, season, holidays
* Geographic: pickup area, dropoff area
* Lagged demand (1-day, 1-week, 1-month)
* Moving averages (7-day, 30-day)
* Volatility metrics
* External factors: rush hour, tourism hotspots, seasonal weather adjustments
* Cyclical time encodings (sin/cos for hour, day, month)

**Target:** `trip_count` (per area × hour × day)

**Models tested:**

* LightGBM

**Outcome:**

* Captures **demand peaks** (rush hours, weekends, holidays, summer tourism).
* Provides **forecasting insights** for:

  * Driver supply allocation
  * Surge pricing triggers
  * Market entry timing strategy

---

## ⚙️ Tech Stack

* **Google BigQuery** — SQL feature engineering + aggregation
* **Google Looker Studio** — Dashboard storytelling
* **Google Colab (Python)** — ML models

  * `pandas`, `scikit-learn`, `matplotlib`, `numpy`

---

## 🚀 Key Takeaways

* Chicago’s taxi market is **competitive but penetrable**.
* Demand has **clear temporal + geographic patterns** that Grab can exploit.
* **Two ML models power decisions**:

  * **Fare Prediction** → helps set competitive, dynamic prices.
  * **Demand Forecasting** → ensures supply is aligned with demand surges.
* Combining **market dashboards + ML insights** = stronger U.S. entry strategy for Grab.

---

## 🔗 Links

* **Dataset**: [Chicago Taxi Trips (BigQuery Public Dataset)](https://console.cloud.google.com/marketplace/product/city-of-chicago-public-data/chicago-taxi-trips)
* **Dashboard**: [Looker Studio](https://lookerstudio.google.com/reporting/222b720e-85a1-417b-b17e-a605036c4ffe)
* **Google Colab Notebooks**:

  * [Fare Prediction](https://github.com/wneo97/Data-Analysis-Projects/tree/main/notebooks/fare_prediction)
  * [Demand Forecasting](https://github.com/wneo97/Data-Analysis-Projects/tree/main/notebooks/demand_forecast)

---

## 👤 Author

Project by *Neo Wayne*

Blending **SQL, BI, and ML** for actionable market intelligence.


🔗 [LinkedIn](https://www.linkedin.com/in/yourprofile)

---

