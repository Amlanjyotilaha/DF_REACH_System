<p align="center">
<img width="200" height="200" alt="DF Reach Logo crop" src="https://github.com/user-attachments/assets/5b49f178-57a7-47f8-87cb-ea87c6e9bf40" />
</p>


# REACH: Beneficiary Program Management System


A comprehensive database schema for **REACH**, a robust Beneficiary Program Management System.

---

## 📖 Table of Contents

1. [🌟 Overview](#-overview)
2. [🚀 Key Features](#-key-features)
3. [📊 Database Schema](#-database-schema)
    1. [Core Entities](#core-entities)
    2. [Relationship Diagram (Conceptual)](#relationship-diagram-conceptual)

---

## 🌟 Overview

This repository houses the intricate database schema for **REACH**, a critical system designed to efficiently manage and track social programs and their beneficiaries. The schema provides a well-structured foundation for all data related to program enrollment, beneficiary demographics, employee roles, and geographical classifications.

Our goal with REACH is to create a transparent and effective platform for program execution and impact measurement.

[🔝 Top](#-table-of-contents)
---

## 🚀 Key Features

* **Comprehensive Beneficiary Profiles:** Stores detailed information about beneficiaries including personal details, addresses, educational backgrounds, and income.
* **Program & Sub-Program Management:** Organizes various social initiatives and their specific components.
* **Enrollment Tracking:** Monitors beneficiary participation in different programs and outreach channels.
* **Employee & Role Management:** Defines user roles and permissions for system access and administrative tasks.
* **Hierarchical Geographical Data:** Structures locations from state down to village level for accurate beneficiary mapping.
* **Status & Master Data:** Centralized tables for managing common statuses and other master data throughout the system.

[🔝 Top](#-table-of-contents)
---

## 📊 Database Schema

The database schema is designed for scalability and data integrity, with clear relationships between entities.

### Core Entities

Here's a high-level look at some of the primary tables:

* **`master_beneficiary`**: Central table for all beneficiary information.
* **`beneficiary_programs`**: Links beneficiaries to programs and sub-programs, tracking enrollment.
* **`employees`**: Stores details of system users and program managers.
* **`programs`** & **`sub_programs`**: Defines the different social initiatives.
* **`address`**, **`state`**, **`district`**, **`taluka`**, **`village`**: Geographical hierarchy for beneficiary addresses.
* **`income`**: Details about beneficiary and family income.
* **`master_education_details`** & **`master_education_levels`**: Educational background information.
* **`master_outreach_channels`**: How beneficiaries were reached.
* **`roles`** & **`emp_roles`**: Manages user roles and permissions.
* **`master_status`**: Universal status definitions used across various tables.

[🔝 Top](#-table-of-contents)

### Relationship Diagram (Conceptual)

<img width="4470" height="2101" alt="df_reach database" src="https://github.com/user-attachments/assets/7cf3a36f-1cc0-4910-b255-8e739560dddd" />


[🔝 Top](#-table-of-contents)

---

<br><br>
<div align="center">
  <sub>© 2025 Amlanjyoti Laha & Deshpande Foundation. All Rights Reserved.</sub>
</div>
