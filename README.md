# 📊 SAP ABAP ALV Sales Report

## 📌 Project Description
This project is a beginner-level SAP ABAP report developed as part of a capstone assignment. It displays sales order data using ALV (ABAP List Viewer) in a structured and user-friendly format.

The program fetches data from the standard SAP table **VBAK** and presents it in an interactive grid with basic filtering and total calculation features.

---

## ✅ Features
- Selection screen to filter data by date range  
- Fetches sales order data from VBAK table  
- Displays output using ALV grid  
- Supports sorting and filtering  
- Automatic total calculation for amount column  
- Clean and simple layout  

---

## 🛠️ Tech Stack
- **Language:** SAP ABAP  
- **Module:** SAP SD (Sales and Distribution)  
- **Database Table:** VBAK  
- **ALV Tool:** REUSE_ALV_GRID_DISPLAY  
- **Development Tool:** SE38  

---

## 🚀 How to Run 
1. Log in to SAP system  
2. Go to transaction **SE38**  
3. Create a new program: `zsales_report_arpita`  
4. Paste the ABAP code  
5. Activate the program (Ctrl + F3)  
6. Execute the program (F8)  
7. Enter date range and view the report  

---

## 📊 Sample Input & Output

### 🔹 Input (Selection Screen)
User provides a date range:

From Date: 01.01.2023  
To Date:   31.12.2023  

---

### 🔹 Output (ALV Report)

| Order ID | Order Date | Customer ID | Total Amount |
|----------|-----------|-------------|--------------|
| 50000123 | 05.01.2023 | 100200 | 12000 |
| 50000124 | 10.01.2023 | 100300 | 8500 |
| 50000125 | 15.01.2023 | 100400 | 15000 |

---

### 🔹 Description
The program fetches sales order data from the VBAK table based on the selected date range and displays it in an ALV grid format. The output supports sorting, filtering, and automatic total calculation.
