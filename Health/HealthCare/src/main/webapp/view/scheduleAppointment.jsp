<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule Appointment</title>
<style>
:root {
    --primary-color: #8B4513;  /* SaddleBrown */
    --secondary-color: #A0522D;  /* Sienna */
    --accent-color: #D2691E;  /* Chocolate */
    --light-color: #F5F5DC;  /* Beige */
    --dark-color: #2C1E1E;  /* Dark Brown */
    --text-color: #333;
    --danger-color: #B22222;  /* FireBrick */
    --success-color: #228B22;  /* ForestGreen */
    --info-color: #4682B4;  /* SteelBlue */
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: var(--light-color);
    color: var(--text-color);
}

/* Top Navigation Bar */
.top-nav {
    background: linear-gradient(to right, var(--dark-color), var(--primary-color));
    color: white;
    padding: 0 20px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    position: sticky;
    top: 0;
    z-index: 100;
}

.nav-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
}

.brand {
    font-size: 1.5rem;
    font-weight: bold;
    padding: 15px 0;
}

.nav-menu {
    display: flex;
    list-style: none;
}

.nav-item {
    position: relative;
}

.nav-link {
    display: block;
    padding: 20px 15px;
    color: white;
    text-decoration: none;
    transition: all 0.3s ease;
}

.nav-link:hover {
    background-color: rgba(255, 255, 255, 0.1);
}

.nav-link.active {
    background-color: var(--accent-color);
}

.nav-link.active::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 3px;
    background-color: var(--light-color);
}

.user-info {
    display: flex;
    align-items: center;
    gap: 15px;
}

.logout-btn {
    background-color: var(--danger-color);
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 20px;
    cursor: pointer;
    transition: all 0.3s ease;
    font-weight: 500;
}

.logout-btn:hover {
    background-color: #8B0000;  /* DarkRed */
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Main Content */
.main-container {
    max-width: 800px;
    margin: 30px auto;
    padding: 0 20px;
}

/* Form Container */
.form-container {
    background-color: white;
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
}

.section-title {
    font-size: 1.5rem;
    color: var(--dark-color);
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid var(--light-color);
}

.back-link {
    display: inline-block;
    margin-bottom: 20px;
    color: var(--primary-color);
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s ease;
}

.back-link:hover {
    color: var(--accent-color);
    text-decoration: underline;
}

/* Form Styles */
.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: 500;
    color: var(--dark-color);
}

input, select {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid #ddd;
    border-radius: 6px;
    background-color: #FFF9F0;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
    font-size: 1rem;
}

input:focus, select:focus {
    outline: none;
    border-color: var(--accent-color);
    box-shadow: 0 0 0 3px rgba(210, 105, 30, 0.2);
}

.btn {
    padding: 12px 25px;
    background-color: var(--primary-color);
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 500;
    font-size: 1rem;
    transition: all 0.3s ease;
    margin-top: 10px;
}

.btn:hover {
    background-color: var(--secondary-color);
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Error Message */
.error-message {
    color: var(--danger-color);
    background-color: rgba(178, 34, 34, 0.1);
    padding: 15px;
    border-radius: 6px;
    margin-bottom: 20px;
    border-left: 4px solid var(--danger-color);
}

/* Footer */
.footer {
    background: linear-gradient(to right, var(--dark-color), var(--primary-color));
    color: white;
    padding: 40px 0 20px;
    margin-top: 50px;
}

.footer-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 30px;
}

.footer-logo {
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 15px;
}

.footer-about p {
    margin-bottom: 15px;
    line-height: 1.6;
}

.footer-links h3, .footer-contact h3 {
    font-size: 1.2rem;
    margin-bottom: 20px;
    position: relative;
    padding-bottom: 10px;
}

.footer-links h3::after, .footer-contact h3::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 50px;
    height: 2px;
    background-color: var(--accent-color);
}

.footer-links ul {
    list-style: none;
}

.footer-links li {
    margin-bottom: 10px;
}

.footer-links a {
    color: #ddd;
    text-decoration: none;
    transition: color 0.3s ease;
}

.footer-links a:hover {
    color: white;
    padding-left: 5px;
}

.footer-contact p {
    margin-bottom: 15px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.footer-bottom {
    text-align: center;
    padding-top: 20px;
    margin-top: 30px;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
}

/* Responsive */
@media (max-width: 768px) {
    .nav-container {
        flex-direction: column;
        padding: 10px 0;
    }
    
    .nav-menu {
        width: 100%;
        justify-content: space-around;
        margin-top: 10px;
    }
    
    .nav-link {
        padding: 15px 10px;
    }
    
    .user-info {
        margin-top: 15px;
    }
    
    .footer-container {
        grid-template-columns: 1fr;
    }
    
    .main-container {
        padding: 0 15px;
    }
    
    .form-container {
        padding: 20px;
    }
}
</style>
</head>
<body>
<!-- Top Navigation Bar -->
<nav class="top-nav">
    <div class="nav-container">
        <div class="brand">Patient Portal</div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/PatientDashboardServlet" 
                   class="nav-link ${activePage == 'dashboard' ? 'active' : ''}">
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/PatientAppointmentsServlet" 
                   class="nav-link ${activePage == 'appointments' ? 'active' : ''}">
                    <span>My Appointments</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/ScheduleAppointmentServlet" 
                   class="nav-link ${activePage == 'make-appointment' ? 'active' : ''}">
                    <span>Make Appointment</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/PatientMedicalRecordsServlet" 
                   class="nav-link ${activePage == 'records' ? 'active' : ''}">
                    <span>Medical Records</span>
                </a>
            </li>
        </ul>
        <div class="user-info">
            <span>Welcome, <strong>${user.username}</strong></span>
            <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
                <button type="submit" class="logout-btn">Logout</button>
            </form>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="main-container">
    <a href="${pageContext.request.contextPath}/PatientDashboardServlet" class="back-link">← Back to Dashboard</a>
    
    <div class="form-container">
        <h2 class="section-title">Schedule New Appointment</h2>
        
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/AddAppointmentServlet" method="post">
            <input type="hidden" name="patientId" value="${user.id}">
            
            <div class="form-group">
                <label for="doctorId">Select Doctor:</label>
                <select id="doctorId" name="doctorId" required>
                    <option value="">-- Select Doctor --</option>
                    <c:forEach var="doctor" items="${doctors}">
                        <option value="${doctor.doctorId}">Dr. ${doctor.name} - ${doctor.specialization}</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-group">
                <label for="date">Appointment Date:</label>
                <input type="date" id="date" name="date" required 
                       min="<fmt:formatDate value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd' />">
            </div>
            
            <div class="form-group">
                <label for="time">Appointment Time:</label>
                <input type="time" id="time" name="time" required min="09:00" max="17:00">
            </div>
            
            <input type="hidden" name="status" value="scheduled">
            
            <button type="submit" class="btn">Schedule Appointment</button>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="footer-container">
        <div class="footer-about">
            <div class="footer-logo">Patient Portal</div>
            <p>Your trusted healthcare partner providing comprehensive medical services with care and compassion.</p>
        </div>
        
        <div class="footer-links">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/PatientDashboardServlet">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/PatientAppointmentsServlet">Appointments</a></li>
                <li><a href="${pageContext.request.contextPath}/ScheduleAppointmentServlet">Book Appointment</a></li>
                <li><a href="${pageContext.request.contextPath}/PatientMedicalRecordsServlet">Medical Records</a></li>
            </ul>
        </div>
        
        <div class="footer-contact">
            <h3>Contact Us</h3>
            <p><i class="fas fa-map-marker-alt"></i> 123 Medical Drive, Health City, HC 12345</p>
            <p><i class="fas fa-phone"></i> (123) 456-7890</p>
            <p><i class="fas fa-envelope"></i> info@patientportal.com</p>
        </div>
    </div>
    
    <div class="footer-bottom">
        <p>&copy; 2023 Patient Portal. All rights reserved.</p>
    </div>
</footer>
</body>
</html>