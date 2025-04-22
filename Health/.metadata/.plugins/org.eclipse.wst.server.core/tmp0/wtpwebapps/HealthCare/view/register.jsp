 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Registration</title>
<style>
:root {
    --primary: #6c5ce7;
    --primary-dark: #5649c0;
    --secondary: #00cec9;
    --dark: #1e272e;
    --darker: #161d22;
    --light: #f5f6fa;
    --danger: #ff7675;
    --success: #55efc4;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: var(--dark);
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-image: radial-gradient(circle at 10% 20%, rgba(108, 92, 231, 0.1) 0%, transparent 20%),
        radial-gradient(circle at 90% 80%, rgba(0, 206, 201, 0.1) 0%, transparent 20%);
}

.register-container {
    background-color: var(--darker);
    padding: 2.5rem;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
    width: 420px;
    border: 1px solid rgba(255, 255, 255, 0.05);
    position: relative;
    overflow: hidden;
}

.register-container::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 4px;
    background: linear-gradient(90deg, var(--primary), var(--secondary));
}

.register-header {
    text-align: center;
    margin-bottom: 2rem;
    color: var(--light);
    position: relative;
}

.register-header h2 {
    margin: 0;
    font-size: 1.8rem;
    font-weight: 600;
    letter-spacing: 0.5px;
}

.register-header p {
    margin-top: 0.8rem;
    font-size: 0.9rem;
}

.register-header a {
    color: var(--secondary);
    text-decoration: none;
    transition: color 0.3s;
    display: inline-flex;
    align-items: center;
}

.error-message {
    color: var(--danger);
    text-align: center;
    margin-bottom: 1.5rem;
    padding: 0.8rem;
    background-color: rgba(255, 118, 117, 0.1);
    border-radius: 6px;
    border-left: 3px solid var(--danger);
    font-size: 0.9rem;
}

.success-message {
    color: var(--success);
    text-align: center;
    margin-bottom: 1.5rem;
    padding: 0.8rem;
    background-color: rgba(85, 239, 196, 0.1);
    border-radius: 6px;
    border-left: 3px solid var(--success);
    font-size: 0.9rem;
}

.form-group {
    margin-bottom: 1.2rem;
    position: relative;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
    color: var(--light);
    font-size: 0.9rem;
}

.form-group input {
    width: 100%;
    padding: 0.8rem 1rem;
    background-color: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 6px;
    box-sizing: border-box;
    color: var(--light);
    font-size: 0.95rem;
    transition: all 0.3s;
}

.form-group input:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 2px rgba(108, 92, 231, 0.2);
    background-color: rgba(108, 92, 231, 0.05);
}

.btn-register {
    width: 100%;
    padding: 0.9rem;
    background: linear-gradient(135deg, var(--primary), var(--primary-dark));
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 1rem;
    font-weight: 500;
    letter-spacing: 0.5px;
    margin-top: 0.5rem;
    transition: all 0.3s;
    text-transform: uppercase;
}

.btn-register:hover {
    background: linear-gradient(135deg, var(--primary-dark), var(--primary));
    box-shadow: 0 4px 12px rgba(108, 92, 231, 0.3);
    transform: translateY(-1px);
}

.login-link {
    text-align: center;
    margin-top: 1.5rem;
    font-size: 0.9rem;
    color: var(--light);
}

.login-link a {
    color: var(--secondary);
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s;
}

.login-link a:hover {
    color: var(--primary);
}

.password-requirements {
    margin-top: 0.5rem;
    font-size: 0.8rem;
    color: rgba(255, 255, 255, 0.6);
}

.password-requirements ul {
    padding-left: 1.2rem;
    margin: 0.3rem 0;
}

.password-requirements li {
    margin-bottom: 0.2rem;
}

/* Phone number validation styling */
.phone-validation {
    display: none;
    font-size: 0.8rem;
    margin-top: 0.3rem;
}

.phone-validation.valid {
    color: var(--success);
    display: block;
}

.phone-validation.invalid {
    color: var(--danger);
    display: block;
}
</style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <h2>Patient Registration</h2>
            <p>Create your account to access healthcare services</p>
        </div>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="success-message">
                <%= request.getAttribute("successMessage") %>
            </div>
        <% } %>

        <form id="registrationForm" action="${pageContext.request.contextPath}/RegisterPatientServlet" method="post">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required placeholder="Enter your full name">
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" required placeholder="Enter your phone number">
                <div id="phoneValidation" class="phone-validation"></div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Create a password">
                <div class="password-requirements">
                    <p>Password must contain:</p>
                    <ul>
                        <li>At least 8 characters</li>
                        <li>At least one uppercase letter</li>
                        <li>At least one number</li>
                    </ul>
                </div>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your password">
            </div>

            <button type="submit" class="btn-register">Register</button>

            <div class="login-link">
                Already have an account? <a href="${pageContext.request.contextPath}/view/login.jsp">Login here</a>
            </div>
        </form>
    </div>

    <script>
        // Phone number validation
        const phoneInput = document.getElementById('phone');
        const phoneValidation = document.getElementById('phoneValidation');
        
        phoneInput.addEventListener('input', function() {
            const phoneRegex = /^[0-9]{10,15}$/;
            if (phoneRegex.test(this.value)) {
                phoneValidation.textContent = 'Valid phone number';
                phoneValidation.className = 'phone-validation valid';
            } else {
                phoneValidation.textContent = 'Please enter a valid phone number (10-15 digits)';
                phoneValidation.className = 'phone-validation invalid';
            }
        });

        // Password validation
        const form = document.getElementById('registrationForm');
        const passwordInput = document.getElementById('password');
        const confirmPasswordInput = document.getElementById('confirmPassword');
        
        form.addEventListener('submit', function(event) {
            // Check password requirements
            const password = passwordInput.value;
            const passwordRegex = /^(?=.*[A-Z])(?=.*\d).{8,}$/;
            
            if (!passwordRegex.test(password)) {
                event.preventDefault();
                alert('Password must be at least 8 characters long and contain at least one uppercase letter and one number');
                return;
            }
            
            // Check password match
            if (password !== confirmPasswordInput.value) {
                event.preventDefault();
                alert('Passwords do not match');
                return;
            }
            
            // Check phone number validation
            if (phoneValidation.className.includes('invalid')) {
                event.preventDefault();
                alert('Please enter a valid phone number');
                return;
            }
        });
    </script>
</body>
</html>