<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HealthCare Appointment System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- This is css section --> 
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
            --success-color: #2ecc71;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
        }
        
        .navbar {
            background-color: var(--secondary-color);
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 5%;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .logo-container {
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: transform 0.3s;
        }
        
        .logo-container:hover {
            transform: scale(1.05);
        }
        
        .logo {
            width: 45px;
            height: 45px;
            margin-right: 12px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid var(--light-color);
        }
        
        .logo-name {
            font-size: 22px;
            font-weight: 700;
            letter-spacing: 1px;
        }
        
        .logo-name span {
            color: var(--primary-color);
        }
        
        .login-btn {
            background: linear-gradient(135deg, var(--primary-color) 0%, #2980b9 100%);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 4px 15px rgba(41, 128, 185, 0.3);
        }
        
        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(41, 128, 185, 0.4);
            background: linear-gradient(135deg, #2980b9 0%, var(--primary-color) 100%);
        }
        
        .login-btn i {
            font-size: 14px;
        }
        
        .hero {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 80px 5%;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
            position: relative;
            overflow: hidden;
        }
        
        .hero::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 200%;
            background: radial-gradient(circle, rgba(52, 152, 219, 0.1) 0%, rgba(0,0,0,0) 70%);
            z-index: 0;
        }
        
        .hero-content {
            flex: 1;
            max-width: 600px;
            z-index: 1;
        }
        
        .hero-content h1 {
            font-size: 42px;
            color: var(--dark-color);
            margin-bottom: 20px;
            line-height: 1.2;
        }
        
        .hero-content h1 span {
            color: var(--primary-color);
        }
        
        .hero-content p {
            color: #555;
            font-size: 18px;
            margin-bottom: 30px;
        }
        
        .cta-buttons {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .cta-btn {
            padding: 12px 25px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .primary-btn {
            background-color: var(--primary-color);
            color: white;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
        }
        
        .secondary-btn {
            background-color: white;
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
        }
        
        .cta-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }
        
        .primary-btn:hover {
            background-color: #2980b9;
        }
        
        .secondary-btn:hover {
            background-color: var(--primary-color);
            color: white;
        }
        
        .hero-image {
            flex: 1;
            max-width: 500px;
            z-index: 1;
            animation: float 6s ease-in-out infinite;
        }
        
        .hero-image img {
            width: 100%;
            height: 500px;
            border-radius: 10px;
            box-shadow: 0 25px 50px -12px rgba(0,0,0,0.25);
        }
        
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }
        
        .features {
            padding: 80px 5%;
            background-color: white;
            text-align: center;
        }
        
        .section-title {
            font-size: 36px;
            color: var(--dark-color);
            margin-bottom: 15px;
        }
        
        .section-subtitle {
            color: #777;
            font-size: 18px;
            max-width: 700px;
            margin: 0 auto 50px;
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 50px;
        }
        
        .feature-card {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s, box-shadow 0.3s;
            border: 1px solid #eee;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        
        .feature-icon {
            width: 70px;
            height: 70px;
            background-color: rgba(52, 152, 219, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: var(--primary-color);
            font-size: 30px;
        }
        
        .feature-title {
            font-size: 22px;
            color: var(--dark-color);
            margin-bottom: 15px;
        }
        
        .feature-desc {
            color: #666;
            font-size: 16px;
        }
        
        footer {
            background-color: var(--secondary-color);
            color: white;
            padding: 40px 5%;
            text-align: center;
        }
        
        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .footer-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }
        
        .footer-logo img {
            width: 50px;
            height: 50px;
            margin-right: 15px;
            border-radius: 50%;
        }
        
        .footer-logo span {
            font-size: 24px;
            font-weight: 700;
        }
        
        .footer-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 20px 0;
        }
        
        .footer-links a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-links a:hover {
            color: var(--primary-color);
        }
        
        .social-icons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 20px 0;
        }
        
        .social-icons a {
            color: white;
            font-size: 20px;
            transition: color 0.3s;
        }
        
        .social-icons a:hover {
            color: var(--primary-color);
        }
        
        .copyright {
            margin-top: 30px;
            color: rgba(255,255,255,0.7);
            font-size: 14px;
        }
        
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                padding: 15px;
            }
            
            .login-btn {
                margin-top: 15px;
                width: 100%;
                justify-content: center;
            }
            
            .hero {
                flex-direction: column;
                text-align: center;
                padding: 50px 5%;
            }
            
            .hero-content {
                margin-bottom: 40px;
            }
            
            .cta-buttons {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo-container" onclick="window.location.href='index.jsp'">
            <img src="images/1.avif" alt="Logo" class="logo">
            <span class="logo-name">Health<span>Care</span></span>
        </div>
        
        <button class="login-btn" onclick="window.location.href='view/UserLogin.jsp'">
            <i class="fas fa-sign-in-alt"></i> LOGIN
        </button>
    </nav>
    
    <section class="hero">
        <div class="hero-content">
            <h1>Your Health, Our <span>Priority</span></h1>
            <p>Book appointments with top healthcare professionals effortlessly. Our system provides seamless access to doctors, quick appointment scheduling, and personalized healthcare solutions.</p>
            
            <div class="cta-buttons">
                <a href="view/UserLogin.jsp" class="cta-btn primary-btn">
                    <i class="fas fa-calendar-check"></i> Book Appointment
                </a>
                <a href="#features" class="cta-btn secondary-btn">
                    <i class="fas fa-info-circle"></i> Learn More
                </a>
            </div>
        </div>
        
        <div class="hero-image">
            <img src="images/ab.png" alt="Healthcare professionals" width="200" height="200">
        </div>
    </section>
    
    <section class="features" id="features">
        <h2 class="section-title">Why Choose Our System</h2>
        <p class="section-subtitle">We provide comprehensive healthcare solutions tailored to your needs</p>
        
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <h3 class="feature-title">24/7 Availability</h3>
                <p class="feature-desc">Book appointments anytime, anywhere with our round-the-clock scheduling system.</p>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-search"></i>
                </div>
                <h3 class="feature-title">Find Best Doctors</h3>
                <p class="feature-desc">Access to a network of qualified and experienced healthcare professionals.</p>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-bell"></i>
                </div>
                <h3 class="feature-title">Smart Reminders</h3>
                <p class="feature-desc">Never miss an appointment with our automated reminder system.</p>
            </div>
        </div>
    </section>
    
  <footer>
    <!-- Footer content starts here -->
    <div class="footer-content">
        <!-- Footer logo section -->
        <div class="footer-logo">
            <img src="images/a.avif" alt="Logo">
            <span>HealthCare</span>
        </div>
        
        <!-- Footer links section -->
        <div class="footer-links">
            <a href="#">About Us</a>
            <a href="#">Services</a>
            <a href="#">Doctors</a>
            <a href="#">Contact</a>
            <a href="#">Privacy Policy</a>
        </div>
        
        <!-- Social media icons section -->
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
        </div>
        
        <!-- Copyright section -->
        <p class="copyright">&copy; 2023 HealthCare Appointment System. All rights reserved.</p>
    </div>
    <!-- Footer content ends here -->
</footer>
</body>
</html>
