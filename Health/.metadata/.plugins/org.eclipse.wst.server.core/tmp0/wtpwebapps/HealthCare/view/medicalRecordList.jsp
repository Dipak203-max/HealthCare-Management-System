<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Medical Records | HealthCare</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
<style>
:root {
    --primary: #7c3aed;
    --primary-light: #8b5cf6;
    --primary-dark: #6d28d9;
    --secondary: #10b981;
    --accent: #f59e0b;
    --danger: #ef4444;
    --info: #0ea5e9;
    
    --bg-dark: #0f172a;
    --bg-darker: #020617;
    --bg-card: #1e293b;
    --text-primary: #f8fafc;
    --text-secondary: #94a3b8;
    --border-color: #334155;
    --highlight: rgba(124, 58, 237, 0.1);
    
    --sidebar-width: 280px;
    --nav-height: 80px;
    --card-radius: 16px;
    --transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', 'Poppins', -apple-system, BlinkMacSystemFont, sans-serif;
}

body {
    background-color: var(--bg-dark);
    color: var(--text-primary);
    line-height: 1.6;
    overflow-x: hidden;
}

.dashboard-container {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

/* Top Navigation */
.top-nav {
    background: var(--bg-darker);
    padding: 0 2rem;
    position: sticky;
    top: 0;
    z-index: 1000;
    border-bottom: 1px solid var(--border-color);
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

.nav-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: var(--nav-height);
    max-width: 1800px;
    margin: 0 auto;
}

.brand {
    display: flex;
    align-items: center;
    gap: 14px;
}

.brand-logo {
    font-size: 1.6rem;
    font-weight: 700;
    color: var(--text-primary);
    display: flex;
    align-items: center;
    gap: 10px;
    letter-spacing: -0.5px;
}

.brand-logo i {
    color: var(--primary-light);
    font-size: 1.8rem;
}

.mobile-menu-btn {
    display: none;
    background: none;
    border: none;
    color: var(--text-primary);
    font-size: 1.6rem;
    cursor: pointer;
    transition: var(--transition);
}

.mobile-menu-btn:hover {
    color: var(--primary-light);
}

.nav-menu {
    display: flex;
    list-style: none;
    gap: 1.5rem;
    margin-left: 3rem;
}

.nav-link {
    color: var(--text-secondary);
    text-decoration: none;
    padding: 0.75rem 1rem;
    border-radius: var(--card-radius);
    transition: var(--transition);
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 0.95rem;
    position: relative;
}

.nav-link i {
    font-size: 1.1rem;
    width: 24px;
    text-align: center;
}

.nav-link:hover, .nav-link.active {
    color: var(--primary-light);
    background-color: var(--highlight);
}

.nav-link.active::after {
    content: '';
    position: absolute;
    bottom: -12px;
    left: 50%;
    transform: translateX(-50%);
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background-color: var(--primary-light);
}

.user-actions {
    display: flex;
    align-items: center;
    gap: 1.5rem;
}

.user-info {
    display: flex;
    align-items: center;
    gap: 12px;
    cursor: pointer;
    position: relative;
}

.user-avatar {
    width: 44px;
    height: 44px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--primary), var(--info));
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    color: white;
    font-size: 1.1rem;
    transition: var(--transition);
}

.user-info:hover .user-avatar {
    transform: scale(1.05);
}

.user-name {
    font-weight: 600;
    max-width: 140px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.user-dropdown {
    position: absolute;
    top: 120%;
    right: 0;
    background: var(--bg-card);
    border-radius: var(--card-radius);
    box-shadow: 0 10px 15px -3px rgba(0,0,0,0.2);
    padding: 0.75rem 0;
    min-width: 220px;
    z-index: 100;
    opacity: 0;
    visibility: hidden;
    transform: translateY(10px);
    transition: var(--transition);
    border: 1px solid var(--border-color);
}

.user-info:hover .user-dropdown {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}

.user-dropdown-link {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 0.85rem 1.5rem;
    color: var(--text-primary);
    text-decoration: none;
    transition: var(--transition);
    font-size: 0.95rem;
}

.user-dropdown-link:hover {
    background-color: rgba(255,255,255,0.05);
    color: var(--primary-light);
}

.user-dropdown-link i {
    width: 20px;
    color: var(--text-secondary);
    font-size: 1rem;
}

.logout-btn {
    background-color: var(--danger);
    color: white;
    border: none;
    padding: 0.75rem 1.5rem;
    border-radius: var(--card-radius);
    cursor: pointer;
    font-weight: 600;
    transition: var(--transition);
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 0.95rem;
    box-shadow: 0 4px 6px -1px rgba(239, 68, 68, 0.2);
}

.logout-btn:hover {
    background-color: #dc2626;
    transform: translateY(-2px);
    box-shadow: 0 10px 15px -3px rgba(239, 68, 68, 0.2);
}

/* Main Content */
.main-content {
    flex: 1;
    padding: 2.5rem;
    max-width: 1800px;
    margin: 0 auto;
    width: 100%;
}

.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 3rem;
    flex-wrap: wrap;
    gap: 1.5rem;
}

.page-title {
    font-size: 2rem;
    font-weight: 700;
    display: flex;
    align-items: center;
    gap: 14px;
    letter-spacing: -0.5px;
}

.page-title i {
    color: var(--primary-light);
    font-size: 2.2rem;
}

.breadcrumb {
    font-size: 0.95rem;
    color: var(--text-secondary);
    display: flex;
    align-items: center;
    gap: 10px;
}

.breadcrumb a {
    color: var(--text-secondary);
    text-decoration: none;
    transition: var(--transition);
    font-weight: 500;
}

.breadcrumb a:hover {
    color: var(--primary-light);
}

.breadcrumb .separator {
    opacity: 0.5;
}

/* Records Table */
.records-container {
    background-color: var(--bg-card);
    border-radius: var(--card-radius);
    padding: 2rem;
    border: 1px solid var(--border-color);
    box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
}

.records-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
}

.records-title {
    font-size: 1.5rem;
    font-weight: 600;
    color: var(--text-primary);
}

.add-record-btn {
    background-color: var(--primary);
    color: white;
    border: none;
    padding: 0.75rem 1.5rem;
    border-radius: var(--card-radius);
    cursor: pointer;
    font-weight: 600;
    transition: var(--transition);
    display: flex;
    align-items: center;
    gap: 8px;
    text-decoration: none;
    font-size: 0.95rem;
}

.add-record-btn:hover {
    background-color: var(--primary-dark);
    transform: translateY(-2px);
    box-shadow: 0 10px 15px -3px rgba(124, 58, 237, 0.3);
}

.add-record-btn i {
    font-size: 0.9rem;
}

.records-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1.5rem;
}

.records-table th {
    text-align: left;
    padding: 1rem;
    background-color: var(--bg-darker);
    color: var(--text-primary);
    font-weight: 600;
    border-bottom: 1px solid var(--border-color);
}

.records-table td {
    padding: 1rem;
    border-bottom: 1px solid var(--border-color);
    color: var(--text-secondary);
}

.records-table tr:last-child td {
    border-bottom: none;
}

.records-table tr:hover td {
    background-color: rgba(255,255,255,0.03);
    color: var(--text-primary);
}

.record-details {
    max-width: 300px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.action-btn {
    padding: 0.5rem 1rem;
    border: none;
    border-radius: var(--card-radius);
    cursor: pointer;
    font-weight: 500;
    transition: var(--transition);
    display: inline-flex;
    align-items: center;
    gap: 6px;
    font-size: 0.9rem;
    text-decoration: none;
}

.view-btn {
    background-color: var(--info);
    color: white;
}

.view-btn:hover {
    background-color: #0284c7;
}

.report-btn {
    background-color: var(--secondary);
    color: white;
}

.report-btn:hover {
    background-color: #0d9488;
}

/* Modal styles for detailed view */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.7);
}

.modal-content {
    background-color: var(--bg-card);
    margin: 10% auto;
    padding: 2rem;
    border-radius: var(--card-radius);
    width: 80%;
    max-width: 800px;
    border: 1px solid var(--border-color);
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    position: relative;
}

.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
    padding-bottom: 1rem;
    border-bottom: 1px solid var(--border-color);
}

.modal-title {
    font-size: 1.5rem;
    font-weight: 600;
    color: var(--text-primary);
}

.close-modal {
    color: var(--text-secondary);
    font-size: 1.8rem;
    font-weight: bold;
    cursor: pointer;
    transition: var(--transition);
}

.close-modal:hover {
    color: var(--danger);
}

.modal-body {
    margin-bottom: 1.5rem;
}

.modal-row {
    display: flex;
    margin-bottom: 1rem;
}

.modal-label {
    width: 150px;
    color: var(--text-secondary);
    font-weight: 500;
}

.modal-value {
    flex: 1;
    color: var(--text-primary);
}

.modal-footer {
    display: flex;
    justify-content: flex-end;
    padding-top: 1.5rem;
    border-top: 1px solid var(--border-color);
}

/* Footer */
.footer {
    background-color: var(--bg-darker);
    color: var(--text-secondary);
    padding: 2rem;
    text-align: center;
    border-top: 1px solid var(--border-color);
    margin-top: auto;
}

.footer-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1800px;
    margin: 0 auto;
    flex-wrap: wrap;
    gap: 1.5rem;
}

.footer-links {
    display: flex;
    gap: 1.5rem;
    flex-wrap: wrap;
    justify-content: center;
}

.footer-link {
    color: var(--text-secondary);
    text-decoration: none;
    transition: var(--transition);
    font-size: 0.9rem;
    font-weight: 500;
}

.footer-link:hover {
    color: var(--primary-light);
}

.copyright {
    color: var(--text-secondary);
    font-size: 0.9rem;
    font-weight: 500;
}

/* Responsive adjustments */
@media (max-width: 1200px) {
    .nav-menu {
        gap: 1rem;
    }
}

@media (max-width: 992px) {
    .mobile-menu-btn {
        display: block;
    }
    
    .nav-menu {
        position: fixed;
        top: var(--nav-height);
        left: -100%;
        width: 300px;
        height: calc(100vh - var(--nav-height));
        background: var(--bg-darker);
        flex-direction: column;
        gap: 0;
        padding: 2rem 0;
        transition: var(--transition);
        z-index: 999;
        overflow-y: auto;
        box-shadow: 0 20px 25px -5px rgba(0,0,0,0.1);
        border-right: 1px solid var(--border-color);
    }
    
    .nav-menu.active {
        left: 0;
    }
    
    .nav-link {
        padding: 1rem 2rem;
        border-radius: 0;
        border-left: 4px solid transparent;
    }
    
    .nav-link.active {
        border-left-color: var(--primary);
        background-color: var(--highlight);
    }
    
    .nav-link.active::after {
        display: none;
    }
    
    .user-actions {
        margin-left: auto;
    }
}

@media (max-width: 768px) {
    .top-nav {
        padding: 0 1.5rem;
    }
    
    .brand-logo {
        font-size: 1.4rem;
    }
    
    .page-header {
        flex-direction: column;
        align-items: flex-start;
        margin-bottom: 2rem;
    }
    
    .page-title {
        font-size: 1.8rem;
    }
    
    .main-content {
        padding: 1.5rem;
    }
    
    .records-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 1rem;
    }
    
    .user-name {
        display: none;
    }
    
    .footer-content {
        flex-direction: column;
        gap: 1rem;
    }
}

@media (max-width: 576px) {
    .top-nav {
        padding: 0 1rem;
    }
    
    .logout-btn span {
        display: none;
    }
    
    .logout-btn {
        padding: 0.75rem;
        width: 48px;
        height: 48px;
        justify-content: center;
    }
    
    .records-container {
        padding: 1.5rem;
    }
    
    .records-table {
        display: block;
        overflow-x: auto;
    }
}
</style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Top Navigation -->
        <nav class="top-nav">
            <div class="nav-container">
                <div class="brand">
                    <button class="mobile-menu-btn" id="mobileMenuBtn">
                        <i class="fas fa-bars"></i>
                    </button>
                    <span class="brand-logo">
                        <i class="fas fa-heart-pulse"></i> HealthCare
                    </span>
                </div>
                
                <ul class="nav-menu" id="navMenu">
                    <li>
                        <a href="${pageContext.request.contextPath}/DashboardServlet" class="nav-link">
                            <i class="fas fa-chart-line"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/DoctorListServlet" class="nav-link">
                            <i class="fas fa-user-md"></i>
                            <span>Doctors</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/PatientListServlet" class="nav-link">
                            <i class="fas fa-procedures"></i>
                            <span>Patients</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/AppointmentListServlet" class="nav-link">
                            <i class="fas fa-calendar-check"></i>
                            <span>Appointments</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/MedicalRecordListServlet" class="nav-link active">
                            <i class="fas fa-file-waveform"></i>
                            <span>Medical Records</span>
                        </a>
                    </li>
                </ul>
                
                <div class="user-actions">
                    <div class="user-info">
                        <div class="user-avatar">${user.username.charAt(0)}</div>
                        <span class="user-name">${user.username}</span>
                        <div class="user-dropdown">
                            <a href="#" class="user-dropdown-link">
                                <i class="fas fa-user-circle"></i> My Profile
                            </a>
                            <a href="${pageContext.request.contextPath}/UserSettingsServlet" class="user-dropdown-link">
                                <i class="fas fa-cog"></i> Settings
                            </a>
                            <a href="#" class="user-dropdown-link">
                                <i class="fas fa-bell"></i> Notifications
                            </a>
                        </div>
                    </div>
                    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
                        <button type="submit" class="logout-btn">
                            <i class="fas fa-sign-out-alt"></i>
                            <span>Logout</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-file-waveform"></i> Medical Records
                </h1>
                <div class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/DashboardServlet">Home</a> 
                    <span class="separator">/</span> 
                    <span>Medical Records</span>
                </div>
            </div>

            <div class="records-container">
                <div class="records-header">
                    <h2 class="records-title">Patient Records</h2>
                    <a href="#" class="add-record-btn">
                        <i class="fas fa-plus"></i> Add New Record
                    </a>
                </div>
                
                <table class="records-table">
                    <thead>
                        <tr>
                            <th>Record ID</th>
                            <th>Patient</th>
                            <th>Doctor</th>
                            <th>Date</th>
                            <th>Diagnosis</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="record" items="${records}">
                            <tr>
                                <td>${record.recordId}</td>
                                <td>${record.patientName}</td>
                                <td>Dr. ${record.doctorName}</td>
                                <td><fmt:formatDate value="${record.createdAt}" pattern="yyyy-MM-dd HH:mm" /></td>
                                <td class="record-details" title="${record.diagnosis}">
                                    ${record.diagnosis}
                                </td>
                                <td>
                                    <button onclick="showRecordDetails(${record.recordId})" class="action-btn view-btn">
                                        <i class="fas fa-eye"></i> View
                                    </button>
                                    <a href="GenerateReportServlet?recordId=${record.recordId}" class="action-btn report-btn">
                                        <i class="fas fa-file-pdf"></i> Report
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>

        <!-- Modal for detailed view -->
        <div id="recordModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Medical Record Details</h3>
                    <span class="close-modal" onclick="closeModal()">&times;</span>
                </div>
                <div class="modal-body" id="modalContent">
                    <!-- Content will be loaded via JavaScript -->
                </div>
                <div class="modal-footer">
                    <button class="action-btn report-btn" onclick="window.location.href='GenerateReportServlet?recordId=' + currentRecordId">
                        <i class="fas fa-file-pdf"></i> Generate Report
                    </button>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-links">
                    <a href="#" class="footer-link">About</a>
                    <a href="#" class="footer-link">Privacy</a>
                    <a href="#" class="footer-link">Terms</a>
                    <a href="#" class="footer-link">Contact</a>
                    <a href="#" class="footer-link">Support</a>
                </div>
                <div class="copyright">
                    &copy; 2023 HealthCare. All rights reserved.
                </div>
            </div>
        </footer>
    </div>

    <script>
        // Mobile menu toggle
        document.getElementById('mobileMenuBtn').addEventListener('click', function() {
            document.getElementById('navMenu').classList.toggle('active');
        });
        
        // Modal functionality
        const modal = document.getElementById("recordModal");
        let currentRecordId = null;
        
        function showRecordDetails(recordId) {
            currentRecordId = recordId;
            
            // In a real application, you would fetch this data from the server
            // For demo, we'll use the data from the table
            const recordRow = document.querySelector(`tr:has(td:first-child:contains("${recordId}")`);
            
            const patient = recordRow.cells[1].textContent;
            const doctor = recordRow.cells[2].textContent;
            const date = recordRow.cells[3].textContent;
            const diagnosis = recordRow.cells[4].title;
            
            // Find treatment (this would normally come from server)
            const treatment = "Treatment details would appear here. This would include prescribed medications, procedures performed, follow-up instructions, and any other relevant medical information for this patient's case.";
            
            const modalContent = `
                <div class="modal-row">
                    <div class="modal-label">Record ID:</div>
                    <div class="modal-value">${recordId}</div>
                </div>
                <div class="modal-row">
                    <div class="modal-label">Patient:</div>
                    <div class="modal-value">${patient}</div>
                </div>
                <div class="modal-row">
                    <div class="modal-label">Doctor:</div>
                    <div class="modal-value">${doctor}</div>
                </div>
                <div class="modal-row">
                    <div class="modal-label">Date:</div>
                    <div class="modal-value">${date}</div>
                </div>
                <div class="modal-row">
                    <div class="modal-label">Diagnosis:</div>
                    <div class="modal-value">${diagnosis}</div>
                </div>
                <div class="modal-row">
                    <div class="modal-label">Treatment:</div>
                    <div class="modal-value">${treatment}</div>
                </div>
            `;
            
            document.getElementById("modalContent").innerHTML = modalContent;
            modal.style.display = "block";
        }
        
        function closeModal() {
            modal.style.display = "none";
        }
        
        window.onclick = function(event) {
            if (event.target == modal) {
                closeModal();
            }
        }
    </script>
</body>
</html>