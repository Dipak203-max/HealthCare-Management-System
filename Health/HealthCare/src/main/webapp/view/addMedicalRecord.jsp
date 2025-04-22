<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Medical Record</title>
    <style>
        :root {
            --primary-color: #6c5ce7;
            --secondary-color: #a29bfe;
            --accent-color: #fd79a8;
            --success-color: #00b894;
            --warning-color: #fdcb6e;
            --danger-color: #d63031;
            --info-color: #0984e3;
            --dark-color: #2d3436;
            --darker-color: #1e272e;
            --light-color: #f5f6fa;
            --text-color: #dfe6e9;
            --card-bg: #16213e;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        body {
            background-color: var(--darker-color);
            color: var(--text-color);
            line-height: 1.6;
            padding: 20px;
        }

        .record-form {
            max-width: 800px;
            margin: 0 auto;
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.05);
        }

        .form-title {
            font-size: 1.5rem;
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--secondary-color);
        }

        .form-group textarea {
            width: 100%;
            padding: 1rem;
            background-color: rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 6px;
            color: var(--text-color);
            min-height: 150px;
            resize: vertical;
            transition: border 0.3s ease;
        }

        .form-group textarea:focus {
            outline: none;
            border-color: var(--primary-color);
        }

        .btn-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: #5a4bd4;
        }

        .btn-secondary {
            background-color: var(--dark-color);
            color: var(--text-color);
        }

        .btn-secondary:hover {
            background-color: #252d33;
        }
    </style>
</head>
<body>
    <div class="record-form">
        <h2 class="form-title">Add Medical Record</h2>
        <form action="${pageContext.request.contextPath}/AddMedicalRecordServlet" method="post">
            <input type="hidden" name="appointmentId" value="${param.appointmentId}">
            <input type="hidden" name="patientId" value="${param.patientId}">
            <input type="hidden" name="doctorId" value="${user.id}">
            
            <div class="form-group">
                <label for="diagnosis">Diagnosis:</label>
                <textarea id="diagnosis" name="diagnosis" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="treatment">Treatment:</label>
                <textarea id="treatment" name="treatment" required></textarea>
            </div>
            
            <div class="btn-group">
                <button type="submit" class="btn btn-primary">Save Record</button>
                <a href="${pageContext.request.contextPath}/DashboardServlet" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>