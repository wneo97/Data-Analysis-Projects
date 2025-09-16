# Chicago Taxi Market Analysis — GCP BigQuery + Looker Studio + ML Pricing Model

## 📌 Project Overview
This project analyzes the **Chicago Taxi Trips dataset** (Google BigQuery Public Dataset) to simulate a **market entry strategy for Grab** as it considers expansion into the U.S. market.  

Chicago serves as our case study city due to its large population, established ride-hailing demand, and competitive taxi/ride-hailing landscape.  

We use:  
- **Google BigQuery** for data querying and aggregation  
- **Looker Studio (Google Data Studio)** for interactive dashboards and storytelling  
- **Google Colab (Python ML model)** for predictive fare modeling  

---

## 🎯 Problem Statement
Pretend scenario: **Grab is evaluating entry into the U.S. ride-hailing market starting with Chicago.**  

Key questions:  
- What is the current market situation?  
- Who are the competitors?  
- When is demand strongest?  
- Where should Grab focus first?  
- How should Grab price its services to compete effectively?  

---

## 📊 Dashboard Pages

### 1️⃣ Market Overview
**Filters:** Month, Year  
- Daily average trip count  
- Average fare  
- Market size overview  
- Pickup hotspots by trip count (heatmap)  
- Trip count by hour (bar graph)  
- Fare distribution chart  
- **Insights summary text box**  

---

### 2️⃣ Competitor Analysis (Who?)  
**Filters:** Company, Month, Year  
- Pickup intensity heatmap  
- Market share by trip count  
- Comparison table: total trips, fleet size, avg fare, avg fare per mile, avg trip duration  

---

### 3️⃣ Demand Patterns & Time Analysis (When?)  
**Filters:** Year  
- Peak month/day/hour (KPIs)  
- Total trip count  
- Monthly demand trends  
- Hourly demand intensity (heatmap)  
- Daily demand patterns  
- **Operational recommendations**  

---

### 4️⃣ Geographic Penetration Strategy (Where?)  
**Filters:** Month, Year  
- Trip count heatmap  
- Top pickup areas (table)  
- Top 5 taxi routes by trip count  
- Underserved but high-demand areas  
- **Market penetration recommendations**  

---

### 5️⃣ Pricing Intelligence (How Much?)  
**Filters:** Month, Year  
- Average fare, fare per mile, and trip duration  
- Trip type distribution (short, medium, long)  
- Fare metrics by trip type  
- **Market entry pricing recommendations**  
- **Route-specific penetration strategies**  

---

## 🤖 Machine Learning: Fare Prediction Model
In addition to dashboard insights, a **Google Colab-based machine learning model** was developed to help Grab make **data-driven pricing decisions**.

### Approach
- Data Source: Chicago Taxi Trips (queried via BigQuery → Colab)  
- Features:  
  - Trip distance (miles)  
  - Trip duration (seconds)  
  - Pickup/dropoff location (community area)  
  - Time features (hour, day of week, month)  
  - Company (where applicable)  
- Target: `fare`  

### Models Tested
- **Linear Regression**  
- **Random Forest Regressor**  
- **Gradient Boosted Trees**  

### Outcome
- **Random Forest** performed best (highest R², lowest RMSE).  
- Model allows Grab to **predict fare levels for new trips**, enabling:  
  - Optimized **dynamic pricing strategies**  
  - Identification of **overpriced/underpriced routes**  
  - Smarter **market penetration tactics** by aligning fares with demand  

---

## ⚙️ Tech Stack
- **Google BigQuery** — SQL data aggregation  
- **Google Looker Studio** — Dashboard visualization  
- **Google Colab (Python)** — Machine learning model  
  - `pandas`, `scikit-learn`, `matplotlib`  

---

## 🚀 Key Takeaways
- Chicago’s taxi market is **competitive but penetrable**.  
- Demand has **strong temporal and geographic trends**.  
- **Pricing strategy** is key — competitive analysis + predictive modeling shows optimal price bands.  
- Grab can leverage **ML-powered fare predictions** to build a **dynamic, competitive pricing system**.  

---

## 🔗 Links
- **Dataset**: [Chicago Taxi Trips (BigQuery Public Dataset)](https://console.cloud.google.com/marketplace/product/city-of-chicago-public-data/chicago-taxi-trips)  
- **Dashboard**: *(Insert Looker Studio link)*  
- **Colab Notebook**: *(Insert Colab link)*  

---

## 👤 Author
Project by *Neo Wayne*
Combining **SQL, BI, and ML** for actionable market intelligence.
