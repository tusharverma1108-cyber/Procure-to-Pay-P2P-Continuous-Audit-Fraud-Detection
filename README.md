# Procure-to-Pay (P2P) Continuous Audit & Fraud Detection System

## Executive Summary
This project presents an automated **SQL-based Continuous Control Monitoring (CCM)** engine designed for the Procure-to-Pay (P2P) cycle. By executing analytical tests over transactional ledgers, this pipeline detects internal control deficiencies, Segregation of Duties (SoD) conflicts, and potential fraud schemes, directly aligning with the **COSO Framework** and **Internal Financial Controls (IFC)** compliance requirements.

## Key Audit Tests & Analytics Logic

### 1. Duplicate Invoice Payment Engine
* **Risk:** Financial loss via double payment on single vendor deliverables.
* **SQL Method:** `GROUP BY` aggregations and `HAVING` filters on identical `(vendor_id, invoice_number, invoice_amount)`.

### 2. Split Purchase Order Detection
* **Risk:** Evasion of formal management authorization thresholds (e.g., $10,000 limits).
* **SQL Method:** Aggregates user activity logs per vendor per day to identify multiple sub-threshold POs created concurrently.

### 3. Segregation of Duties (SoD) Exception Audit
* **Risk:** Unauthorized expenditure and internal fraud through unmonitored transactional authority.
* **SQL Method:** Relational `JOIN` testing matching `po_creator` attributes against `invoice_entry_user`.

## Tech Stack
* **Database:** PostgreSQL / MySQL / SQLite
* **Methodology:** COSO Framework, Continuous Auditing, SQL Analytical Queries
