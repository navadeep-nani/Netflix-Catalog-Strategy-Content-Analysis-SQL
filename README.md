# 🎬 Netflix Catalog Strategy & Content Analysis

MySQL data analysis project evaluating **8,790 catalog records** to extract actionable business insights for content acquisition, catalog optimization, and data quality management.

---

## 📌 Project Summary
This project performs an end-to-end analytical breakdown of the Netflix catalog. It covers data cleaning and deduplication, regional content production analysis, genre classification, and duration distribution to assist decision-makers in strategic content investment.

---

## 🛠️ Tech Stack & Skills
* **Database Management System:** MySQL
* **SQL Techniques:** `INNER JOIN` (Self-Joins for Data Deduplication), `GROUP BY`, `HAVING`, `SUBSTRING_INDEX()`, `CAST()`, Conditional Filtering, Aggregations.

---

## 📊 Business Queries & SQL Breakdown

| # | Business Goal / Query Focus | Core SQL Concepts |
|---|---|---|
| **1** | Total Movies vs. TV Shows ratio | `GROUP BY`, `COUNT(*)` |
| **2** | Top 5 content-producing countries | `WHERE IS NOT NULL`, `LIMIT` |
| **3** | Catalog entries released in 2020 | Filter by `release_year` |
| **4** | Movies directed by 'Kirsten Johnson' | Exact string matching |
| **5** | Most common content rating distribution | `GROUP BY`, `ORDER BY DESC` |
| **6** | TV Shows with >= 5 seasons | `CAST()`, `SUBSTRING_INDEX()` |
| **7** | Indian Comedy movies | Multi-condition `LIKE` filtering |
| **8** | Yearly release volume trends | `GROUP BY release_year` |
| **9** | Top 5 movie directors by total titles | Multi-condition `WHERE`, `LIMIT` |
| **10** | Peak year for content additions | `SUBSTRING_INDEX()` date parsing |
| **11** | Oldest 5 Indian movies on the platform | Multi-column sort (`ORDER BY ASC`) |
| **12** | Documentaries released post-2015 | `LIKE '%Documentaries%'`, `release_year` |
| **13** | Longest movie runtime in minutes | `CAST()`, `SUBSTRING_INDEX()`, `ORDER BY DESC` |
| **14** | Years with >50 Indian movie releases | `GROUP BY`, `HAVING COUNT(*) > 50` |
| **15** | Duplicate movie detection & cleanup | `INNER JOIN` (Self-Join), `TRIM()`, `LENGTH()` |

---

## 💡 Key Business Insights
* **Catalog Mix:** The dataset consists primarily of Movies over TV Shows, with international production led heavily by the US and India.
* **Content Scaling:** Identified peak content acquisition years and shifting trends toward short-form TV series vs. feature films.
* **Data Integrity:** Resolved duplicate catalog entries using self-`INNER JOIN` filtering logic, ensuring accurate metric aggregation without inflated counts.

---

## 📁 Repository Structure

```text
├── Netflix_Data.csv       # Raw Dataset (8,790 Records)
├── NETFLIX SQL PROJECT.sql   # SQL Script with Queries 1 to 15
└── README.md                # Project Documentation & Insights
