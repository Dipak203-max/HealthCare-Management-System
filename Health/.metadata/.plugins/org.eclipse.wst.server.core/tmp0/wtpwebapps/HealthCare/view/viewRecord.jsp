<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Medical Record</title>
<style>
:root {
    --primary-color: #3498db;
    --secondary-color: #2980b9;
    --light-color: #ecf0f1;
    --dark-color: #2c3e50;
    --danger-color: #e74c3c;
    --success-color: #2ecc71;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 1000px;
    margin: 20px auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #eee;
}

.header h2 {
    color: var(--dark-color);
    margin: 0;
}

.actions {
    display: flex;
    gap: 10px;
}

.btn {
    padding: 8px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    text-decoration: none;
    font-size: 14px;
    transition: background-color 0.3s;
}

.btn-primary {
    background-color: var(--primary-color);
    color: white;
}

.btn-primary:hover {
    background-color: var(--secondary-color);
}

.btn-danger {
    background-color: var(--danger-color);
    color: white;
}

.btn-danger:hover {
    background-color: #c0392b;
}

.record-details {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    margin-bottom: 20px;
}

.detail-card {
    background-color: var(--light-color);
    padding: 15px;
    border-radius: 6px;
}

.detail-card h3 {
    margin-top: 0;
    color: var(--dark-color);
    border-bottom: 2px solid var(--primary-color);
    padding-bottom: 8px;
}

.detail-row {
    display: flex;
    margin-bottom: 10px;
}

.detail-label {
    font-weight: bold;
    width: 120px;
    color: #555;
}

.detail-value {
    flex: 1;
}

.diagnosis-treatment {
    margin-top: 20px;
}

.section {
    margin-bottom: 20px;
}

.section h3 {
    color: var(--dark-color);
    border-bottom: 1px solid #eee;
    padding-bottom: 8px;
}

.section-content {
    background-color: white;
    border: 1px solid #eee;
    border-radius: 6px;
    padding: 15px;
    min-height: 100px;
}

.back-link {
    display: inline-block;
    margin-top: 20px;
    color: var(--primary-color);
    text-decoration: none;
}

.back-link:hover {
    text-decoration: underline;
}

@media (max-width: 768px) {
    .record-details {
        grid-template-columns: 1fr;
    }
}
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Medical Record Details</h2>
            <div class="actions">
                <a href="${pageContext.request.contextPath}/PrintRecordServlet?recordId=${record.recordId}" 
                   class="btn btn-primary">Print Record</a>
                <a href="${pageContext.request.contextPath}/PatientRecordsServlet" 
                   class="btn btn-danger">Back to Records</a>
            </div>
        </div>
        
        <div class="record-details">
            <div class="detail-card">
                <h3>Patient Information</h3>
                <div class="detail-row">
                    <div class="detail-label">Record ID:</div>
                    <div class="detail-value">${record.recordId}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Patient Name:</div>
                    <div class="detail-value">${record.patientName}</div>
                </div>
            </div>
            
            <div class="detail-card">
                <h3>Medical Information</h3>
                <div class="detail-row">
                    <div class="detail-label">Doctor:</div>
                    <div class="detail-value">Dr. ${record.doctorName}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Date:</div>
                    <div class="detail-value"><fmt:formatDate value="${record.createdAt}" pattern="MMMM dd, yyyy hh:mm a" /></div>
                </div>
            </div>
        </div>
        
        <div class="diagnosis-treatment">
            <div class="section">
                <h3>Diagnosis</h3>
                <div class="section-content">${record.diagnosis}</div>
            </div>
            
            <div class="section">
                <h3>Treatment</h3>
                <div class="section-content">${record.treatment}</div>
            </div>
        </div>
        
        <a href="${pageContext.request.contextPath}/PatientRecordsServlet" class="back-link">
            &larr; Back to all records
        </a>
    </div>
</body>
</html>