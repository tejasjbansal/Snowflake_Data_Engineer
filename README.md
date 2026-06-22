<div align="center">

<img src="https://upload.wikimedia.org/wikipedia/commons/f/ff/Snowflake_Logo.svg" alt="Snowflake Logo" width="260"/>

# ❄️ Snowflake on AWS — Complete Hands-On Course

### From Fundamentals to Advanced Data Engineering on the Snowflake Data Cloud

[![Snowflake](https://img.shields.io/badge/Snowflake-Data%20Cloud-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)](https://www.snowflake.com/)
[![AWS](https://img.shields.io/badge/AWS-Integrated-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)](https://aws.amazon.com/)
[![SQL](https://img.shields.io/badge/SQL-Hands--On%20Labs-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)](#)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](#license)

</div>

---

## 📖 About This Repository

This repository is a **structured, section-by-section learning path** for mastering the **Snowflake Data Cloud** with deep integration into **AWS services**. It is designed for aspiring and practicing **Data Engineers, Data Analysts, and Cloud Architects** who want to go from absolute basics to advanced, production-grade Snowflake concepts.

Each section below lives in its own folder, complete with SQL scripts, notes, and hands-on exercises. Simply click on a section title to jump straight into that folder.

> 💡 **Tip:** Work through the sections in order — each one builds on concepts introduced earlier — but feel free to jump to a topic if you already have the fundamentals down.

---

## 🗂️ Course Curriculum

### 🔰 Getting Started

| # | Topic | Description |
|---|-------|-------------|
| 01 | [**Introduction to Snowflake**](./Section%201%20Introduction) | Overview of the Snowflake Data Cloud, its value proposition, and integration with AWS services. |
| 02 | [**Getting Started & Workspaces UI**](./Section%202%20Getting%20Started%20&%20Workspaces%20UI) | Account setup, connecting via Snowsight, Workspaces UI and other clients, navigating the Snowflake interface. |
| 03 | [**Snowflake Architecture**](./Section%203%20Snowflake%20Architecture) | Understanding Snowflake's unique multi-cluster shared data architecture, virtual warehouses, and cloud services layer. |

### 📥 Data Loading & Integration

| # | Topic | Description |
|---|-------|-------------|
| 04 | [**Storage Integration with AWS S3**](./Section%204%20Storage%20Integration) | Configuring and managing external stages for seamless data access and loading from AWS S3. |
| 05 | [**Loading Data to Snowflake**](./Section%205%20Loading%20Data%20to%20Snowflake) | Best practices and techniques for bulk loading structured data using `COPY INTO` statements. |
| 06 | [**Loading Semi-Structured Data**](./Section%206%20Loading%20Semi-Structured%20Data%20to%20Snowflake) | Efficiently loading and querying JSON, Avro, Parquet, and other semi-structured data formats. |
| 07 | [**Snowpipe**](./Section%207%20Snowpipe) | Implementing continuous data ingestion pipelines for real-time and near real-time data loading. |
| 10 | [**Unloading Data from Snowflake**](./Section%2010%20Unloading%20Data%20from%20Snowflake) | Exporting data out of Snowflake back to external storage in various formats. |
| 11 | [**Snowflake Internal Stages**](./Section%2011%20Snowflake%20Internal%20Stages) | Working with User, Table, and Named internal stages for file management. |

### ⚙️ Automation & Data Pipelines

| # | Topic | Description |
|---|-------|-------------|
| 08 | [**Tasks**](./Section%208%20Tasks) | Automating data processing workflows, scheduling SQL statements, and managing dependencies. |
| 09 | [**Streams**](./Section%209%20Streams) | Tracking data changes in tables for efficient ETL/ELT processes and incremental updates. |
| 22 | [**Dynamic Tables**](./Section%2022%20Dynamic%20Tables) | Understanding and implementing declarative data transformation pipelines with automatic refresh. |

### 🛡️ Data Protection & Recovery

| # | Topic | Description |
|---|-------|-------------|
| 12 | [**Time Travel & Fail-Safe**](./Section%2012%20Time%20Travel%20&%20Fail-Safe) | Understanding and utilizing Snowflake's data recovery and historical data access features. |
| 13 | [**Snowflake Table Types**](./Section%2013%20Snowflake%20Table%20Types) | Deep dive into Permanent, Transient, and Temporary tables and their use cases. |
| 14 | [**Zero Copy Cloning**](./Section%2014%20Zero%20Copy%20Cloning) | Leveraging instant, zero-cost cloning for development, testing, and disaster recovery. |

### 🔐 Security & Governance

| # | Topic | Description |
|---|-------|-------------|
| 15 | [**Roles and Access Control**](./Section%2015%20Roles%20and%20Access%20Control) | Implementing robust security models using Snowflake's role-based access control (RBAC) framework. |
| 16 | [**Dynamic Data Masking**](./Section%2016%20Dynamic%20Data%20Masking) | Protecting sensitive data with dynamic masking policies based on user roles. |
| 17 | [**Data Sharing**](./Section%2017%20Data%20Sharing) | Securely sharing data with internal and external stakeholders without copying or moving data. |

### 🚀 Performance & Optimization

| # | Topic | Description |
|---|-------|-------------|
| 18 | [**Materialized Views**](./Section%2018%20Materialized%20Views) | Optimizing query performance by creating and managing materialized views. |
| 19 | [**Performance Tuning & Cost Optimization**](./Section%2019%20Performance%20Tuning%20&%20Cost%20Optimization) | Strategies for analyzing query performance, optimizing SQL, and managing warehouse costs. |
| 20 | [**Data Sampling**](./Section%2020%20Data%20Sampling) | Techniques for extracting representative subsets of data for analysis and testing. |

### 🧩 Advanced Table Types

| # | Topic | Description |
|---|-------|-------------|
| 21 | [**External Tables**](./Section%2021%20External%20Tables) | Querying data directly from external storage locations like AWS S3 without loading. |
| 23 | [**Event Tables**](./Section%2023%20Event%20Tables) | Capturing and analyzing event data within Snowflake. |
| 24 | [**Hybrid Tables**](./Section%2024%20Hybrid%20Tables) | Exploring the capabilities and use cases of Snowflake's Hybrid Tables. |
| 25 | [**Iceberg Tables**](./Section%2025%20Iceberg%20Tables) | Working with open Apache Iceberg table format directly inside Snowflake. |

### 🎯 Career Prep

| # | Topic | Description |
|---|-------|-------------|
| 26 | [**Snowflake Data Engineer Interview**](./Section%2026%20Snowflake%20Data%20Engineer%20Interview) | Commonly asked interview questions and answers for Snowflake Data Engineer roles. |

---

## 🏗️ Snowflake Architecture at a Glance

Snowflake's architecture separates **storage**, **compute**, and **cloud services** into independently scalable layers:

```
┌─────────────────────────────────────────────────┐
│                CLOUD SERVICES LAYER              │
│   Authentication · Query Parsing · Optimization  │
│        Metadata Management · Security            │
├─────────────────────────────────────────────────┤
│              MULTI-CLUSTER COMPUTE LAYER         │
│   Virtual Warehouse 1   Virtual Warehouse 2 ...  │
├─────────────────────────────────────────────────┤
│                CENTRALIZED STORAGE LAYER          │
│         Stored on AWS S3 (or Azure / GCP)        │
└─────────────────────────────────────────────────┘
```

---

## 🧰 Prerequisites

- A free [Snowflake Trial Account](https://signup.snowflake.com/)
- An AWS account (Free Tier is sufficient for most labs)
- Basic familiarity with SQL
- A SQL client (Snowsight, DBeaver, or VS Code with SQL extensions)

---

## 🚀 How to Use This Repository

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/<your-repo-name>.git
   cd <your-repo-name>
   ```
2. Navigate into any `Section X` folder to find the SQL scripts and notes for that topic.
3. Run the scripts inside your own Snowflake worksheet/Workspace and follow along with the explanations.
4. Progress sequentially for the best learning experience, or jump to the section most relevant to your current project.

---

## 🤝 Contributing

Contributions, corrections, and additional examples are welcome! Feel free to open an issue or submit a pull request.

## ⭐ Support

If you find this repository helpful, please consider giving it a **star** — it helps others discover this resource too!

## 📜 License

This project is licensed under the **MIT License**.

---

<div align="center">

Made with ❄️ for the Data Engineering community

</div>
