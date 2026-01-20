# 💳 Credit Card Annual Revenue & Risk Analysis

---

## 📑 Table of Contents
- [Project Overview](#-project-overview)
- [Project Objective](#-project-objective)
- [Dataset Description](#-dataset-description)
- [Tools & Technologies Used](#-tools--technologies-used)
- [Data Analysis Workflow](#-data-analysis-workflow)
- [Dashboard Highlights](#-dashboard-highlights)
- [Key Business Insights](#-key-business-insights)
- [Recommendations](#-recommendations)
- [Project Structure](#-project-structure)
- [Learning Outcome](#-learning-outcome)
- [Disclaimer](#-disclaimer)
- [Author](#-author)

---

## 📌 Project Overview
This project analyzes **annual credit card transaction and customer data** to identify revenue trends, customer behavior, and potential risk indicators.

The objective is to demonstrate how structured data analysis can support **data-driven decision-making** in credit card operations using **SQL and Power BI**.

This is a **portfolio / learning project**, created for educational and demonstration purposes.

---

## 🎯 Project Objective
To analyze one year of credit card transaction and customer data in order to:
- Understand revenue distribution across customer segments
- Identify high-performing and high-risk customer groups
- Analyze card usage patterns and delinquency behavior
- Convert raw data into meaningful business insights using dashboards

---

## 📂 Dataset Description

| Table Name | Description |
|-----------|------------|
| `credit_card_detail` | Transaction-level data including revenue, transaction amount, interest earned, card category, delinquency status, and transaction dates |
| `customer_detail` | Customer demographic data including age, gender, income group, job type, and satisfaction score |

**Dataset Characteristics:**
- ~10,000+ records
- Two CSV files
- Joined using `Client_Num`
- Includes numeric, categorical, and date fields

---

## 🧰 Tools & Technologies Used
- **SQL Server (SSMS)** – Data loading, cleaning, validation, and analysis  
- **Power BI** – Data modeling, DAX calculations, and dashboard creation  
- **Excel** – Initial data review and understanding  
- **GitHub** – Project documentation and version control  

---

## 🔍 Data Analysis Workflow

### 1️⃣ Data Understanding
- Reviewed dataset structure and column definitions
- Identified data types and quality issues
- Understood relationship between customer and transaction data

### 2️⃣ Data Cleaning
- Imported CSV files into SQL Server
- Corrected incorrect data types
- Removed duplicates and invalid records
- Validated null values and row counts

### 3️⃣ Data Transformation
- Converted text fields to numeric formats
- Parsed date columns correctly
- Created derived fields such as **Age Group** and **Income Group**

### 4️⃣ Feature Engineering
Created calculated fields and measures using **DAX**, including:
- **Total Revenue** = Annual Fees + Transaction Amount + Interest Earned
- Age Group segmentation
- Income Group segmentation
- Time-based metrics for annual and quarterly analysis

---

## 📊 Dashboard Highlights

### 🔑 Key Metrics
- **Total Revenue:** ~56–57M  
- **Total Transaction Amount:** ~45–46M  
- **Total Interest Earned:** ~8M  
- **Total Transactions:** ~667K  
- **Customer Satisfaction Score:** ~3.19  

### 📈 Visual Insights
- Revenue by Income Group
- Revenue by Job Type
- Revenue by Card Category
- Revenue by Age Group
- Quarterly Revenue Trends
- Top 5 States by Revenue

---

## 📈 Key Business Insights
- High-income customers contribute a major share of revenue, creating **revenue concentration risk**
- Blue and Silver cards account for the majority of transactions
- Business and white-collar customers show strong revenue with **lower delinquency**
- Top 3 states contribute nearly **70% of total revenue**
- Lower interest contribution indicates most customers repay on time

---

## 💡 Recommendations
- Increase credit limits **only for low-delinquency, disciplined customers**
- Avoid aggressive limit increases for delinquent customers
- Strengthen retention strategies for high-performing segments
- Implement early warning indicators using delinquency and utilization
- Balance revenue growth with risk management and regulatory compliance

---

## 📁 Project Structure
```text
Credit-Card-Annual-Revenue-Risk-Analysis/
│
├── data/
│   ├── credit_card_detail.csv
│   └── customer_detail.csv
│
├── sql/
│   └── data_cleaning_and_analysis.sql
│
├── powerbi/
│   └── credit_card_dashboard.pbix
│
├── presentation/
│   └── Credit_Card_Annual_Analysis.pptx
│
└── README.md
```
---

## 🎓 Learning Outcome
This project helped me strengthen my skills in:
- **SQL-based data cleaning and validation**
- **Business-focused data analysis**
- **Power BI dashboarding and DAX calculations**
- **Converting analytical findings into actionable business insights**

---


## ⚠️ Disclaimer
This project uses **sample / simulated data** for educational purposes only.  
It does not represent real bank or customer data and is not intended for production or regulatory use.

---

## 👤 Author
**Anirudh Kumar**  
Aspiring Business / Data Analyst
