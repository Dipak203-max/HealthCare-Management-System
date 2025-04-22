🏥 Healthcare Appointment System
A secure, role-based appointment management system for clinics

🔍 Overview
This Java EE web application streamlines patient-doctor scheduling with:

Role-based access (Admin/Doctor/Patient)

CRUD operations for appointments, doctors, and patients

3NF-compliant MySQL database

MVC architecture (JSP + Servlets + JDBC)

✨ Features
Role	Key Capabilities
Admin	Manage users, generate reports, bulk actions
Doctor	View schedules, confirm/cancel appointments
Patient	Book appointments, view medical history
🛠️ Tech Stack
Frontend: JSP, CSS3 (Flexbox/Grid), Vanilla JS

Backend: Java EE 8 (Servlets), JDBC

Database: MySQL (XAMPP)

Security: BCrypt hashing, role-based sessions

Tools: Figma (Wireframing), MySQL Workbench

🚀 Setup Guide
Prerequisites
Java JDK 11+

XAMPP (MySQL + Apache)

Git

📂 Project Structure
src/  
├── main/  
│   ├── java/  
│   │   ├── controllers/  # Servlets  
│   │   ├── models/       # POJOs (Patient, Doctor)  
│   │   └── services/     # AuthService, AppointmentService  
│   └── webapp/  
│       ├── WEB-INF/  
│       ├── css/          # Custom styles  
│       └── js/           # Client-side validation  
docs/                     # Report, wireframes, ER diagrams  
🤝 Team Contributions
Member	Key Tasks
Member 1	Authentication, Session Management
Dipak Tolangi	Doctor CRUD Operations, Admin UI
Member 3	Patient Booking System
Member 4	Database Design, Reporting

💡 Key README Features:
✅ Visual Hierarchy: Icons + tables for scannability
✅ Setup-Ready: Clear installation steps
✅ Team Recognition: Transparent contributions
✅ Multimedia: Embedded screenshots
