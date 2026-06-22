# Advanced University Management System (ORDBMS)

A specialized Object-Relational Database Management System (ORDBMS) built from scratch using advanced features in PostgreSQL to organize, link, and handle complex data attributes within a university ecosystem.

## 🛠️ Technologies Used
* **Database Engine:** PostgreSQL
* **Language:** SQL / Object-Relational SQL

## 🚀 Advanced Features Implemented
Unlike standard relational databases, this project leverages advanced **ORDBMS features** to model data more naturally:
* **Custom Composite Types:** Created user-defined types (`address_type` and `contact_info_type`) to group related attributes like multi-part physical addresses and contact handles into single, structured columns.
* **Array Data Types:** Utilized multi-value array data types (`TEXT[]`) to store a student's semester course registrations dynamically within a single row, reducing unnecessary table joins.
* **Relational Integrity:** Implemented solid data constraints using sequential auto-incrementing primary keys (`SERIAL`) and strict foreign keys (`REFERENCES`) across Departments, Students, Courses, and Enrollments to ensure seamless cascade protection and zero data fragmentation.

## 📂 Project Structure & Mock Data
The database includes fully relational mock data mapping:
* Academic Departments (e.g., Computer Science, Mathematics)
* Comprehensive Student profiles
* Detailed Course credits
* Transactional student enrollments and grade logs

## 📊 Sample Demonstration Queries Included
The scripts demonstrate complex data fetching operations:
1. **Composite Attribute Extraction:** Pulling nested elements out of composite rows (e.g., extracting just the `city` from an address type block).
2. **Array Traversal:** Directly accessing dynamic arrays containing registered course codes.
3. **Multi-Table Joins:** Combining data across three structural tables (Enrollments, Students, and Courses) to map final performance metrics accurately.

---
*Developed as an advanced laboratory project to bridge the gap between traditional relational concepts and modern object-relational schema modeling.*
