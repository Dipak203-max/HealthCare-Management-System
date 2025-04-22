<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Patient</title>
    <style>
        .edit-form {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .btn-primary {
            background-color: #3498db;
            color: white;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Include your sidebar here -->
        
        <div class="main-content">
            <header class="header">
                <h3>Edit Patient</h3>
            </header>
            
            <div class="edit-form">
                <form action="${pageContext.request.contextPath}/EditPatientServlet" method="post">
                    <input type="hidden" name="patientId" value="${patient.patientId}">
                    
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" value="${patient.name}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="text" id="phone" name="phone" value="${patient.phone}" required>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Update Patient</button>
                    <a href="${pageContext.request.contextPath}/PatientListServlet" class="btn">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>