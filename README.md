<p align="center">
  <img width="300" height="300" alt="DF Reach Logo crop" src="https://github.com/user-attachments/assets/c0529fe7-103b-462b-a9ff-cc4232bae5e5" />
</p>





# REACH: Registration, Engagement and Analytics for Community Help


A comprehensive database schema for **REACH**, a robust Beneficiary Program Management System.


# 🧾 DF_REACH System Overview
![DF REACH SRC Infographics_page-0001](https://github.com/user-attachments/assets/8a0b9c41-40e2-4fea-8455-fe0d7eeded5a)


---

# 🏛️ DF Reach: Multi-Layered Application Architecture

This document provides a comprehensive overview of the **DF Reach** application, a scalable and robust platform for **beneficiary management**, **program enrollment**, and **administrative oversight**. The system is architected with a clean separation of concerns across three primary layers: **Presentation**, **Application**, and **Data**.

---

## 📚 Table of Contents

1. [📌 Introduction](#-1-introduction)
2. [👥 User Roles and Pages](#-2-user-roles-and-pages)  
   - [2.1 User Roles](#21-user-roles)  
   - [2.2 Application Pages Overview](#22-application-pages-overview)
3. [🖥️ Presentation Layer (Frontend)](#%EF%B8%8F-3-presentation-layer-frontend)  
4. [🧠 Application Layer (Backend)](#-4-application-layer-backend)
5. [🗃️ Data Layer (Database)](#%EF%B8%8F-5-data-layer-database) 
   - [5.1 Database Overview](#51-database-overview)  
   - [5.2 Core Tables by Function](#52-core-tables-by-function)  
   - [5.3 Table Descriptions](#53-table-descriptions)
6. [🔄 Data Flow](#-6-data-flow)
7. [⚙️ Software Requirements](#%EF%B8%8F-7-software-requirements)

---

## 📌 1. Introduction

DF Reach is structured using a **three-tiered architecture**:  
- 🖼️ **Presentation Layer (ReactJS SPA)**  
- 🔧 **Application Layer (Node.js + Express.js)**  
- 🗄️ **Data Layer (MySQL RDBMS)**  

This modular architecture ensures **security, maintainability**, and **scalability** of the system.


[🔝 Top](#-table-of-contents)
---

## 👥 2. User Roles and Pages

### 2.1 User Roles

| Role              | Responsibilities                                                  | Pages Accessed                                               |
|-------------------|-------------------------------------------------------------------|---------------------------------------------------------------|
| 👨‍🌾 Field Facilitator | Manage beneficiary details and enrollments                     | Dashboard, Beneficiary, Programs, Contact Us                 |
| 👩‍💼 Manager           | Monitor field activities and analytics                         | Dashboard, Programs, Analytics, Contact Us                   |
| 👨‍💻 Admin             | Full system access including configuration and user management | Dashboard, Programs, Analytics, Config Page, Contact Us      |

### 2.2 Application Pages Overview

- **📊 Dashboard:** Role-based summaries and quick actions  
- **🧾 Beneficiary:** Beneficiary input & management (FF only)  
- **📋 Programs:** Lists programs and sub-programs  
- **📈 Analytics:** View insights and trends (Manager/Admin)  
- **📬 Contact Us:** Support contact information  
- **⚙️ Config Page:** System config and master data (Admin only)



[🔝 Top](#-table-of-contents)
---

## 🖥️ 3. Presentation Layer (Frontend)

- **🔧 Tech Stack:** `ReactJS`, `Axios`, `SweetAlert2`
- **Responsibilities:**
  - UI Rendering and Routing (SPA)
  - Client-side Form Validation
  - API Integration via Axios
  - Feedback with SweetAlert2
  - State Management


[🔝 Top](#-table-of-contents)
---

## 🧠 4. Application Layer (Backend)

- **🔧 Tech Stack:** `Node.js`, `Express.js`, `JWT`, `Multer`, `Nodemailer`, `express-validator`, `Bcrypt`
- **Key Features:**
  - REST API Endpoint Management
  - Business Logic & Workflows (e.g., Reimbursements)
  - Authentication (JWT) & Authorization
  - File Uploads (Multer)
  - Email Integration (Nodemailer)
  - Data Validation (express-validator)
  - Integration Ready: e.g., Tally, Bank APIs, Document Generation


[🔝 Top](#-table-of-contents)
---

## 🗃️ 5. Data Layer (Database)

- **🔧 Tech Stack:** `MySQL`
- **Access:** Only through Application Layer

### 5.1 Database Overview

## DF Reach Database Schema Screenshot
<img width="4470" height="2101" alt="df_reach database" src="https://github.com/user-attachments/assets/560edbb5-655c-4d55-b5af-e4f8d74881cf" />


[View Interactive Schema on dbdiagram.io](https://dbdiagram.io/d/df_reach-database-686d004bf413ba3508d3e70d)

- Supports: Beneficiaries, Programs, Employees, Geography
- Ensures: Data integrity, relations (FK/PK), indexing

### 5.2 Core Tables by Function

#### 🧑‍💼 User & Role Management
- `employees`, `roles`, `emp_roles`, `employee_history`

#### 👥 Beneficiary & Related
- `master_beneficiary`, `gender`, `master_education_details`, `income`, `master_certification`

#### 🗂️ Programs & Enrollment
- `programs`, `sub_programs`, `beneficiary_programs`, `master_outreach_channels`

#### 🌐 Geography
- `state`, `district`, `taluka`, `village`, `address`

#### ⚙️ System Configuration
- `master_status`, `menus`, `role_actions`, `role_menu`

### 5.3 Table Descriptions

Each table is well-documented for:
- 🎯 Purpose
- 🔗 Relationships
- 🗃️ Sample columns (e.g., `state.name`, `programs.title`, `beneficiary_programs.status_id`)


[🔝 Top](#-table-of-contents)
---

## 🔄 6. Data Flow


User (ReactJS) ➝ API (Axios ➝ Express.js)
    
  #####  ⮡ Auth (JWT)
   
  #####  ⮡ Validate (express-validator)
   
   ##### ⮡ Files (Multer)
   
   ##### ⮡ DB Ops (MySQL)
   
   ##### ⮡ Notify (Nodemailer)
   
⬅ Response (JSON) ➝ UI Update (SweetAlert2)


[🔝 Top](#-table-of-contents)

---

## ⚙️ 7. Software Requirements

The following tools, libraries, and frameworks are required to develop, run, and maintain the DF Reach application:

| 🛠️ Tool / Technology     | 💼 Purpose                                                                 |
|--------------------------|----------------------------------------------------------------------------|
| 🧑‍💻 **VS Code**           | Primary Integrated Development Environment (IDE) for coding                 |
| 📦 **Multer**             | Handles `multipart/form-data` for file uploads in the backend              |
| 🌐 **REST API**           | Enables communication between frontend and backend (stateless interactions)|
| 🧪 **Postman**            | Testing and validating RESTful API endpoints                              |
| 🎨 **Kelvin CSS**         | Frontend styling framework *(Assumed custom – not widely known)*           |
| 🔐 **JWT (JSON Web Token)**| Authentication and secure transmission of user identity                   |
| 🌍 **Axios**              | Promise-based HTTP client used in ReactJS for making API calls             |
| 🔔 **SweetAlert2**        | User-friendly, responsive pop-up messages for success and error alerts     |
| 📧 **Nodemailer**         | Sends transactional emails like confirmations, status updates, etc.        |
| 🚀 **Express.js**         | Fast, minimalist web framework used to build API routes in Node.js         |
| 🧰 **express-validator**  | Middleware to validate and sanitize user input on the backend              |
| 🔑 **Bcrypt**             | Secure password hashing for storing user credentials                      |

[🔝 Top](#-table-of-contents)
---

<br><br>
<div align="center">
  <sub>© 2025 Amlanjyoti Laha. All Rights Reserved.</sub>
</div>
