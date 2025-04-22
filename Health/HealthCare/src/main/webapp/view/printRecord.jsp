<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Print Medical Record</title>
<style>
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 20px;
    color: #333;
}

.print-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ddd;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.header {
    text-align: center;
    margin-bottom: 30px;
    border-bottom: 2px solid #3498db;
    padding-bottom: 10px;
}

.header h1 {
    color: #3498db;
    margin: 0;
}

.header p {
    margin: 5px 0;
    color: #666;
}

.patient-info, .record-details {
    margin-bottom: 20px;
}

.section-title {
    background-color: #f5f5f5;
    padding: 8px 12px;
    font-weight: bold;
    border-left: 4px solid #3498db;
    margin-bottom: 10px;
}

.info-row {
    display: flex;
    margin-bottom: 8px;
}

.info-label {
    font-weight: bold;
    width: 150px;
}

.info-value {
    flex: 1;
}

.diagnosis, .treatment {
    margin-top: 15px;
}

.footer {
    text-align: center;
    margin-top: 30px;
    padding-top: 10px;
    border-top: 1px solid #ddd;
    font-size: 0.9em;
    color: #666;
}

@media print {
    .no-print {
        display: none;
    }
    
    body {
        padding: 0;
    }
    
    .print-container {
        border: none;
        box-shadow: none;
        padding: 0;
    }
}
</style>
</head>
<body>
    <div class="print-container">
        <div class="header">
            <h1>Medical Record</h1>
            <p>Hospital Management System</p>
        </div>
        
        <div class="patient-info">
            <div class="section-title">Patient Information</div>
            <div class="info-row">
                <div class="info-label">Record ID:</div>
                <div class="info-value">${record.recordId}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Patient Name:</div>
                <div class="info-value">${record.patientName}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Doctor:</div>
                <div class="info-value">Dr. ${record.doctorName}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Date:</div>
                <div class="info-value"><fmt:formatDate value="${record.createdAt}" pattern="MMMM dd, yyyy hh:mm a" /></div>
            </div>
        </div>
        
        <div class="record-details">
            <div class="section-title">Medical Details</div>
            
            <div class="diagnosis">
                <div class="info-label">Diagnosis:</div>
                <div class="info-value">${record.diagnosis}</div>
            </div>
            
            <div class="treatment">
                <div class="info-label">Treatment:</div>
                <div class="info-value">${record.treatment}</div>
            </div>
        </div>
        
        <div class="footer">
            <p>This is an official medical record from Hospital Management System</p>
            <p>Printed on: <fmt:formatDate value="<%= new java.util.Date() %>" pattern="MMMM dd, yyyy" /></p>
        </div>
    </div>
    
    <div class="no-print" style="text-align: center; margin-top: 20px;">
        <button onclick="window.print()" style="padding: 10px 20px; background-color: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer;">Print Record</button>
        <button onclick="window.close()" style="padding: 10px 20px; background-color: #e74c3c; color: white; border: none; border-radius: 4px; cursor: pointer; margin-left: 10px;">Close Window</button>
    </div>
</body>
</html>