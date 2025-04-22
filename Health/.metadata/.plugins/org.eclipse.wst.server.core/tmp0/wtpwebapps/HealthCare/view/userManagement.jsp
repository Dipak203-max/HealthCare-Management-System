<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>
<style>
.badge {
    padding: 0.25rem 0.5rem;
    border-radius: 1rem;
    font-size: 0.75rem;
    font-weight: 600;
    text-transform: uppercase;
}

.badge-admin {
    background-color: rgba(124, 58, 237, 0.1);
    color: #7c3aed;
}

.badge-doctor {
    background-color: rgba(16, 185, 129, 0.1);
    color: #10b981;
}

.badge-patient {
    background-color: rgba(59, 130, 246, 0.1);
    color: #3b82f6;
}

.user-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1.5rem;
}

.user-table th, .user-table td {
    padding: 1rem;
    text-align: left;
    border-bottom: 1px solid #e2e8f0;
}

.user-table th {
    background-color: #f8fafc;
    color: #1e293b;
}

.reset-form {
    display: flex;
    gap: 0.5rem;
}

.reset-form input {
    padding: 0.5rem;
    border: 1px solid #e2e8f0;
    border-radius: 0.25rem;
}

.reset-btn {
    background-color: #3b82f6;
    color: white;
    border: none;
    padding: 0.5rem 1rem;
    border-radius: 0.25rem;
    cursor: pointer;
}

.reset-btn:hover {
    background-color: #2563eb;
}

.message {
    padding: 1rem;
    margin-bottom: 1rem;
    border-radius: 0.25rem;
}

.error {
    background-color: #fee2e2;
    color: #dc2626;
}

.success {
    background-color: #dcfce7;
    color: #16a34a;
}
</style>
</head>
<body>
    <div class="container">
        <h1>User Management</h1>
        
        <c:if test="${not empty errorMessage}">
            <div class="message error">
                ${errorMessage}
            </div>
        </c:if>
        
        <c:if test="${not empty successMessage}">
            <div class="message success">
                ${successMessage}
            </div>
        </c:if>
        
        <table class="user-table">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <td>
                            <span class="badge ${user.roleBadgeClass}">
                                ${user.role}
                            </span>
                        </td>
                        <td>
                            <form method="post" action="${pageContext.request.contextPath}/AdminUserManagementServlet" class="reset-form">
                                <input type="hidden" name="action" value="resetPassword">
                                <input type="hidden" name="userId" value="${user.userId}">
                                <input type="password" name="newPassword" placeholder="New password" required>
                                <input type="password" name="confirmPassword" placeholder="Confirm password" required>
                                <button type="submit" class="reset-btn">Reset</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>