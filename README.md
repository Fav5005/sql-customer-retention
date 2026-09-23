# E-Commerce Customer Retention & Cohort Analysis

An end-to-end SQL data analytics and data warehousing project focused on evaluating customer retention, tracking purchasing behaviors, and executing multi-dimensional RFM segmentation using advanced PostgreSQL techniques.

---

## 📌 Executive Summary

Understanding customer lifetime value (LTV) and churn behavior is critical for scaling e-commerce platforms. This project builds a dedicated relational data model and executes three key analytical pipelines:
1. **Monthly Cohort Retention Analysis**: Tracks customer retention across cohort sign-up months.
2. **RFM (Recency, Frequency, Monetary) Segmentation**: Categorizes users into strategic tiers using statistical window functions (`NTILE`).
3. **Rolling Revenue & Moving Averages**: Computes daily performance and 7-day smoothed revenue metrics to identify trend baselines.

---

## 📁 Repository Structure

```text
sql-customer-retention/
├── schema/
│   ├── 01_tables.sql       # DDL for core relational database tables & constraints
│   └── 02_indexes.sql      # B-tree performance indexes for JOIN and WHERE clauses
├── seed/
│   └── seed_data.sql       # Mock data representing multi-month customer transactions
├── queries/
│   ├── 01_retention_cohorts.sql  # Cohort matrix calculation using CTEs & date math
│   ├── 02_rfm_segmentation.sql   # RFM scoring & customer classification model
│   └── 03_rolling_metrics.sql    # Time-series analysis with 7-day moving averages
└── README.md
