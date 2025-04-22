<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Medical Record</title>
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

.record-form {
    display: grid;
    gap: 20px;
}

.form-section {
    background-color: var(--light-color);
    padding: 15px;
    border-radius: 6px;
}

.form-section h3 {
    margin-top: 0;
    color: var(--dark-color);
    border-bottom: 2px solid var(--primary-color);
    padding-bottom: 8px;
}

.form-group {
    margin-bottom: 15px;
}

.form-label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #555;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-family: inherit;
    font-size: 14px;
}

textarea.form-control {
    min-height: 150px;
    resize: vertical;
}

.readonly-info {
    background-color: #f9f9f9;
    padding: 10px;
    border-radius: 4px;
    border-left: 3px solid var(--primary-color);
}

.readonly-label {
    font-weight: bold;
    color: #555;
}

.form-actions {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    margin-top: 20px;
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
    .form-actions {
        flex-direction: column;
    }
    
    .btn {
        width: 100%;
    }
}
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Edit Medical Record</h2>
            <div class="actions">
                <a href="${pageContext.request.contextPath}/ViewRecordServlet?recordId=${record.recordId}" 
                   class="btn btn-primary">View Record</a>
                <a href="${pageContext.request.contextPath}/PatientRecordsServlet" 
                   class="btn btn-danger">Cancel</a>
            </div>
        </div>
        
        <form action="${pageContext.request.contextPath}/EditRecordServlet" method="post" class="record-form">
            <input type="hidden" name="recordId" value="${record.recordId}">
            
            <div class="form-section">
                <h3>Record Information</h3>
                <div class="form-group">
                    <div class="readonly-info">
                        <div class="readonly-label">Record ID</div>
                        <div>${record.recordId}</div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="readonly-info">
                        <div class="readonly-label">Patient Name</div>
                        <div>${record.patientName}</div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="readonly-info">
                        <div class="readonly-label">Doctor</div>
                        <div>Dr. ${record.doctorName}</div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="readonly-info">
                        <div class="readonly-label">Date Created</div>
                        <div><fmt:formatDate value="${record.createdAt}" pattern="MMMM dd, yyyy hh:mm a" /></div>
                    </div>
                </div>
            </div>
            
            <div class="form-section">
                <h3>Medical Details</h3>
                <div class="form-group">
                    <label for="diagnosis" class="form-label">Diagnosis</label>
                    <textarea id="diagnosis" name="diagnosis" class="form-control" required>${record.diagnosis}</textarea>
                </div>
                <div class="form-group">
                    <label for="treatment" class="form-label">Treatment</label>
                    <textarea id="treatment" name="treatment" class="form-control" required>${record.treatment}</textarea>
                </div>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Save Changes</button>
                <a href="${pageContext.request.contextPath}/ViewRecordServlet?recordId=${record.recordId}" 
                   class="btn btn-danger">Cancel</a>
            </div>
        </form>
        
        <a href="${pageContext.request.contextPath}/PatientRecordsServlet" class="back-link">
            &larr; Back to all records
        </a>
    </div>
</body>
</html>