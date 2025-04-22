<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Medical Records</title>
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
    max-width: 1200px;
    margin: 30px auto;
    padding: 0 20px;
}

/* Messages */
.message {
    padding: 15px;
    margin-bottom: 25px;
    border-radius: 8px;
    color: white;
    font-weight: 500;
    animation: fadeIn 0.5s ease;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

.message-success {
    background-color: var(--success-color);
}

.message-error {
    background-color: var(--danger-color);
}

/* Records Section */
.records-section {
    background-color: white;
    border-radius: 10px;
    padding: 25px;
    margin-bottom: 30px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.section-title {
    font-size: 1.5rem;
    color: var(--dark-color);
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid var(--light-color);
}

.record-card {
    background-color: #FFF9F0;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
    border-left: 4px solid var(--accent-color);
    transition: transform 0.3s ease;
}

.record-card:hover {
    transform: translateX(5px);
}

.record-header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 15px;
    padding-bottom: 10px;
    border-bottom: 1px solid #eee;
}

.record-title {
    font-size: 1.1rem;
    color: var(--dark-color);
    font-weight: 600;
}

.record-doctor {
    color: var(--secondary-color);
    font-weight: 500;
}

.record-date {
    color: #666;
    font-size: 0.9rem;
}

.record-content {
    margin-top: 15px;
}

.record-section {
    margin-bottom: 15px;
}

.record-label {
    font-weight: bold;
    color: var(--dark-color);
    margin-bottom: 8px;
}

.record-value {
    padding: 12px;
    background-color: rgba(255, 255, 255, 0.7);
    border-radius: 6px;
    white-space: pre-wrap;
    line-height: 1.6;
}

.no-records {
    text-align: center;
    padding: 40px;
    color: #666;
    background-color: #FFF9F0;
    border-radius: 8px;
}

.no-records h4 {
    margin-bottom: 10px;
    color: var(--dark-color);
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
    
    .record-header {
        flex-direction: column;
        gap: 10px;
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
    <h1 class="section-title">My Medical Records</h1>
    
    <!-- Display messages -->
    <c:if test="${not empty message}">
        <div class="message message-success">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="message message-error">${error}</div>
    </c:if>

    <div class="records-section">
        <c:choose>
            <c:when test="${not empty records}">
                <c:forEach var="record" items="${records}">
                    <div class="record-card">
                        <div class="record-header">
                            <div>
                                <div class="record-title">Medical Record #${record.recordId}</div>
                                <div class="record-date">
                                    <fmt:formatDate value="${record.createdAt}" pattern="EEE, MMM d, yyyy 'at' h:mm a" />
                                </div>
                            </div>
                            <div class="record-doctor">
                                Dr. ${record.doctorName} (${record.specialization})
                            </div>
                        </div>
                        
                        <div class="record-content">
                            <div class="record-section">
                                <div class="record-label">Diagnosis</div>
                                <div class="record-value">${record.diagnosis}</div>
                            </div>
                            
                            <div class="record-section">
                                <div class="record-label">Treatment</div>
                                <div class="record-value">${record.treatment}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="no-records">
                    <h4>No medical records found</h4>
                    <p>Your medical records will appear here after your doctor creates them</p>
                </div>
            </c:otherwise>
        </c:choose>
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