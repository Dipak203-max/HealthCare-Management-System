<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare Hospital - About Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <!-- AOS for Animations -->
    <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #2c3e50;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            margin: 0;
            overflow-x: hidden;
        }
        ::selection {
            background: #3498db;
            color: #fff;
        }
        .navbar {
            background-color: rgba(255, 255, 255, 0.95);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            transition: background-color 0.3s;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .navbar.scrolled {
            background-color: #fff;
        }
        .nav-link {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.1rem;
            position: relative;
            color: #2c3e50 !important;
            transition: transform 0.3s, color 0.3s;
        }
        .nav-link:hover {
            color: #3498db !important;
            transform: translateY(-3px) rotateX(10deg);
        }
        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -2px;
            left: 0;
            background: linear-gradient(45deg, #3498db, #2ecc71);
            transition: width 0.3s;
        }
        .nav-link:hover::after {
            width: 100%;
        }
        .navbar-brand {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.5rem;
            background: linear-gradient(45deg, #3498db, #2ecc71);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .section-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 3rem;
            font-weight: 700;
            text-transform: uppercase;
            background: linear-gradient(45deg, #3498db, #2ecc71);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-align: center;
            margin-bottom: 3rem;
            text-shadow: 0 0 10px rgba(52, 152, 219, 0.3);
            position: relative;
        }
        .section-title::after {
            content: '';
            position: absolute;
            width: 50px;
            height: 3px;
            background: linear-gradient(45deg, #3498db, #2ecc71);
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }
        .who-we-are {
            background: linear-gradient(to right, #ffffff, #f8f9fa);
            padding: 4rem 0;
        }
        .who-we-are img {
            height: 400px;
            object-fit: cover;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(52, 152, 219, 0.3);
            transition: transform 0.5s, box-shadow 0.5s;
        }
        .who-we-are img:hover {
            transform: scale(1.05);
            box-shadow: 0 0 30px rgba(52, 152, 219, 0.5);
        }
        .who-we-are h3 {
            font-family: 'Orbitron', sans-serif;
            font-size: 2rem;
            font-weight: 700;
            background: linear-gradient(45deg, #3498db, #2ecc71);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .who-we-are p {
            color: #34495e;
            font-size: 1.1rem;
        }
        .btn-learn-more {
            font-family: 'Orbitron', sans-serif;
            background: linear-gradient(45deg, #3498db, #2ecc71);
            color: #fff;
            padding: 0.5rem 1.5rem;
            border-radius: 25px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .btn-learn-more:hover {
            transform: translateZ(20px);
            box-shadow: 0 0 15px rgba(52, 152, 219, 0.5);
        }
        .team-card {
            background: #fff;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            transition: transform 0.5s, box-shadow 0.5s, background-color 0.5s;
            perspective: 1000px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .team-card:hover {
            transform: translateZ(20px) scale(1.05);
            box-shadow: 0 0 30px rgba(52, 152, 219, 0.4);
            background-color: #f8f9fa;
        }
        .team-card img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 3px solid #3498db;
            display: block;
            margin: 0 auto;
            transition: transform 0.5s;
        }
        .team-card:hover img {
            transform: scale(1.1) rotate(5deg);
        }
        .team-card h5 {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.5rem;
            color: #3498db;
            text-align: center;
            margin-top: 1rem;
        }
        .team-card p {
            color: #34495e;
            text-align: center;
        }
        .team-social a {
            font-size: 1.2rem;
            color: #34495e;
            margin: 0 0.5rem;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
        }
        .team-social a:hover {
            transform: translateY(-5px) scale(1.2);
        }
        .team-social a.github:hover {
            color: #333;
            text-shadow: 0 0 10px rgba(51, 51, 51, 0.5);
        }
        .team-social a.linkedin:hover {
            color: #0077b5;
            text-shadow: 0 0 10px rgba(0, 119, 181, 0.5);
        }
        .team-social a.twitter:hover {
            color: #1da1f2;
            text-shadow: 0 0 10px rgba(29, 161, 242, 0.5);
        }
        .team-social a.instagram:hover {
            color: #e1306c;
            text-shadow: 0 0 10px rgba(225, 48, 108, 0.5);
        }
        .team-social a::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 2px;
            bottom: -5px;
            left: 0;
            background: currentColor;
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }
        .team-social a:hover::after {
            transform: scaleX(1);
        }
        .bio-short, .bio-full {
            color: #34495e;
            text-align: center;
            margin-bottom: 1rem;
        }
        .bio-full {
            display: none;
        }
        .btn-toggle-bio {
            font-family: 'Orbitron', sans-serif;
            background: linear-gradient(45deg, #3498db, #2ecc71);
            color: #fff;
            padding: 0.3rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .btn-toggle-bio:hover {
            transform: translateZ(10px);
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.5);
        }
        .chat-box {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
        }
        .chat-btn {
            font-family: 'Orbitron', sans-serif;
            background: linear-gradient(45deg, #3498db, #2ecc71);
            color: #fff;
            padding: 0.75rem 1.5rem;
            border-radius: 50px;
            transition: transform 0.5s, box-shadow 0.5s;
            box-shadow: 0 0 20px rgba(52, 152, 219, 0.3);
        }
        .chat-btn:hover {
            transform: translateZ(20px) scale(1.1);
            box-shadow: 0 0 30px rgba(52, 152, 219, 0.5);
        }
        .chat-window {
            display: none;
            background: #fff;
            width: 300px;
            height: 400px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(52, 152, 219, 0.3);
            flex-direction: column;
        }
        .chat-header {
            background: linear-gradient(45deg, #3498db, #2ecc71);
            color: #fff;
            padding: 0.5rem 1rem;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .chat-header h6 {
            font-family: 'Orbitron', sans-serif;
            margin: 0;
            font-size: 1rem;
        }
        .chat-body {
            flex: 1;
            padding: 1rem;
            overflow-y: auto;
            color: #34495e;
        }
        .chat-body .message {
            margin-bottom: 1rem;
        }
        .chat-body .message.user {
            text-align: right;
        }
        .chat-body .message.user span {
            background: #3498db;
            color: #fff;
            padding: 0.5rem;
            border-radius: 10px;
            display: inline-block;
        }
        .chat-body .message.team span {
            background: #2ecc71;
            color: #fff;
            padding: 0.5rem;
            border-radius: 10px;
            display: inline-block;
        }
        .chat-footer {
            padding: 0.5rem;
            border-top: 1px solid #3498db;
        }
        .chat-footer input {
            background: #f8f9fa;
            border: 1px solid #3498db;
            color: #34495e;
            border-radius: 5px;
            padding: 0.5rem;
            width: 100%;
        }
        .chat-footer input:focus {
            outline: none;
            border-color: #2ecc71;
            box-shadow: 0 0 10px rgba(46, 204, 113, 0.5);
        }
        footer {
            background-color: #2c3e50;
            color: #fff;
            padding: 4rem 0;
            margin-top: auto;
        }
        .footer-nav a {
            font-family: 'Orbitron', sans-serif;
            color: #ecf0f1;
            margin: 0 1rem;
            position: relative;
            transition: color 0.3s, transform 0.3s;
        }
        .footer-nav a:hover {
            color: #3498db;
            transform: translateY(-3px);
        }
        .footer-social a {
            font-size: 1.5rem;
            color: #ecf0f1;
            margin: 0 1rem;
            transition: transform 0.3s, color 0.3s;
        }
        .footer-social a:hover {
            transform: scale(1.3) rotateY(15deg);
            color: #3498db;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="index.html">MediCare Hospital</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="doctors.html">Doctors</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="register.html">Register</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Who We Are Section -->
    <section class="who-we-are">
        <div class="container">
            <h2 class="section-title" data-aos="fade-up">Who We Are</h2>
            <div class="row align-items-center" data-aos="fade-up" data-aos-delay="100">
                <div class="col-md-6 mb-4">
                    <img src="https://img.freepik.com/free-photo/medical-banner-with-doctor-working-hospital_23-2149611193.jpg" alt="Hospital Team" class="w-100">
                </div>
                <div class="col-md-6">
                    <h3 class="fw-bold">About MediCare Hospital</h3>
                    <p class="text-muted">
                        MediCare Hospital is a state-of-the-art healthcare facility dedicated to providing exceptional medical care and innovative treatment solutions. With cutting-edge technology and a team of experienced healthcare professionals, we are committed to improving lives through compassionate care and medical excellence.
                    </p>
                    <a href="#team" class="btn btn-learn-more">Learn More</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section id="team" class="py-5">
        <div class="container">
            <h2 class="section-title" data-aos="fade-up">Meet Our Development Team</h2>
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4" data-aos="fade-up">
                    <div class="team-card">
                        <img src="https://scontent.fbir1-1.fna.fbcdn.net/v/t39.30808-6/491576335_2732431453617557_4004240130621438515_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=111&ccb=1-7&_nc_sid=833d8c&_nc_ohc=S3L8RV3GcJ4Q7kNvwFDwcNs&_nc_oc=AdnOaOXMtCTQbk-mATBhzxBuLz98L9Xf1Ful83qC3TTLaygqnGM7IkajvfC-uu79AeOan41-0PEhxJaShQazNCDd&_nc_zt=23&_nc_ht=scontent.fbir1-1.fna&_nc_gid=Ea4c_fiprJAJcL6YYlx5xg&oh=00_AfI3A1CH1l4uwz5OrbvxFLB0tV6TDtS6mH5evORS8pu-0g&oe=6822AD62" alt="Dipak Tolangi">
                        <h5>Dipak Tolangi</h5>
                        <p>Technical Leader</p>
                        <div class="team-social text-center mb-2">
                            <a href="https://github.com/dipaktolangi" target="_blank" class="github"><i class="fab fa-github"></i></a>
                            <a href="https://linkedin.com/in/dipaktolangi" target="_blank" class="linkedin"><i class="fab fa-linkedin-in"></i></a>
                            <a href="https://twitter.com/dipaktolangi" target="_blank" class="twitter"><i class="fab fa-twitter"></i></a>
                            <a href="https://instagram.com/dipaktolangi" target="_blank" class="instagram"><i class="fab fa-instagram"></i></a>
                        </div>
                        <div class="bio-short">Dipak leads our health appointment management system and oversees the entire coursework system development.</div>
                        <div class="bio-full">Dipak Tolangi is our technical leader who manages the health appointment management system and oversees the complete coursework system. He handles both backend and frontend development, ensuring seamless integration of all system components. His leadership ensures the system meets healthcare industry standards and user requirements.</div>
                        <div class="text-center">
                            <button class="btn btn-toggle-bio toggle-bio">Read More</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="team-card">
                        <img src="https://lh3.googleusercontent.com/a/ACg8ocJD7tq2kPo5jX4gNsvwV6zVJZ7Ma5_obXOuZnBgxLaXUm7M4xhB=s360-c-no" alt="Ameet Pokhrel">
                        <h5>Ameet Pokhrel</h5>
                        <p>Frontend Designer</p>
                        <div class="team-social text-center mb-2">
                            <a href="https://github.com/ameetpokhrel" target="_blank" class="github"><i class="fab fa-github"></i></a>
                            <a href="https://linkedin.com/in/ameetpokhrel" target="_blank" class="linkedin"><i class="fab fa-linkedin-in"></i></a>
                            <a href="https://twitter.com/ameetpokhrel" target="_blank" class="twitter"><i class="fab fa-twitter"></i></a>
                            <a href="https://instagram.com/ameetpokhrel" target="_blank" class="instagram"><i class="fab fa-instagram"></i></a>
                        </div>
                        <div class="bio-short">Ameet is our frontend designer specializing in UI/UX prototyping and comprehensive documentation.</div>
                        <div class="bio-full">Ameet Pokhrel is our frontend expert who excels in UI/UX design and prototyping. He leads the documentation efforts and creates detailed wireframes for our healthcare management system. His expertise ensures our system is both visually appealing and user-friendly.</div>
                        <div class="text-center">
                            <button class="btn btn-toggle-bio toggle-bio">Read More</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="team-card">
                        <img src="https://img.freepik.com/free-photo/female-doctor-hospital_1303-22199.jpg" alt="Himani Ghimire">
                        <h5>Himani Ghimire</h5>
                        <p>Frontend Developer</p>
                        <div class="team-social text-center mb-2">
                            <a href="https://github.com/himanighimire" target="_blank" class="github"><i class="fab fa-github"></i></a>
                            <a href="https://linkedin.com/in/himanighimire" target="_blank" class="linkedin"><i class="fab fa-linkedin-in"></i></a>
                            <a href="https://twitter.com/himanighimire" target="_blank" class="twitter"><i class="fab fa-twitter"></i></a>
                            <a href="https://instagram.com/himanighimire" target="_blank" class="instagram"><i class="fab fa-instagram"></i></a>
                        </div>
                        <div class="bio-short">Himani assists in creating wireframes and diagrams, including ERD development for our healthcare system.</div>
                        <div class="bio-full">Himani Ghimire specializes in creating detailed wireframes and system diagrams. She plays a crucial role in developing Entity Relationship Diagrams (ERD) and other technical documentation required for our healthcare management system. Her work helps visualize and optimize system architecture.</div>
                        <div class="text-center">
                            <button class="btn btn-toggle-bio toggle-bio">Read More</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4" data-aos="fade-up" data-aos-delay="300">
                    <div class="team-card">
                        <img src="" alt="Nabin Tamang">
                        <h5>Nabin Tamang</h5>
                        <p>UI/UX Designer</p>
                        <div class="team-social text-center mb-2">
                            <a href="https://github.com/nabintamang" target="_blank" class="github"><i class="fab fa-github"></i></a>
                            <a href="https://linkedin.com/in/nabintamang" target="_blank" class="linkedin"><i class="fab fa-linkedin-in"></i></a>
                            <a href="https://twitter.com/nabintamang" target="_blank" class="twitter"><i class="fab fa-twitter"></i></a>
                            <a href="https://instagram.com/nabintamang" target="_blank" class="instagram"><i class="fab fa-instagram"></i></a>
                        </div>
                        <div class="bio-short">Nabin focuses on wireframe design and provides essential documentation support for our healthcare system.</div>
                        <div class="bio-full">Nabin Tamang is our wireframe specialist who creates intuitive system layouts and interfaces. He provides crucial documentation support, ensuring all system components are well-documented and easily maintainable. His work helps bridge the gap between design and implementation.</div>
                        <div class="text-center">
                            <button class="btn btn-toggle-bio toggle-bio">Read More</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Chat Box -->
    <div class="chat-box" data-aos="fade-up">
        <button class="chat-btn" onclick="toggleChat()">Chat with Developers</button>
        <div class="chat-window d-flex" id="chatWindow">
            <div class="chat-header">
                <h6>Chat with Our Development Team</h6>
                <button class="btn-close btn-close-white" onclick="toggleChat()"></button>
            </div>
            <div class="chat-body" id="chatBody">
                <div class="message team">
                    <span>Hello! How can we help you with our Healthcare Management System?</span>
                </div>
            </div>
            <div class="chat-footer">
                <input type="text" id="chatInput" placeholder="Type your message..." onkeypress="if(event.key === 'Enter') sendMessage()">
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center">
        <div class="container">
            <h5 class="mb-3">Follow Us</h5>
            <div class="mb-3 footer-social">
                <a href="#" target="_blank"><i class="fab fa-facebook"></i></a>
                <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
                <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <div class="footer-nav mb-3">
                <a href="index.html">Home</a>
                <a href="services.html">Services</a>
                <a href="doctors.html">Doctors</a>
                <a href="about.html">About</a>
                <a href="contact.html">Contact</a>
            </div>
            <p>© 2024 MediCare Hospital. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- AOS JS -->
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        // Initialize AOS
        AOS.init({
            duration: 1000,
            once: true
        });

        // Sticky Navbar Effect
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Toggle Bio Read More/Read Less
        document.querySelectorAll('.toggle-bio').forEach(button => {
            button.addEventListener('click', function() {
                const card = this.closest('.team-card');
                const shortBio = card.querySelector('.bio-short');
                const fullBio = card.querySelector('.bio-full');
                if (fullBio.style.display === 'none' || fullBio.style.display === '') {
                    shortBio.style.display = 'none';
                    fullBio.style.display = 'block';
                    this.textContent = 'Read Less';
                } else {
                    shortBio.style.display = 'block';
                    fullBio.style.display = 'none';
                    this.textContent = 'Read More';
                }
            });
        });

        // Chat Functionality
        function toggleChat() {
            const chatWindow = document.getElementById('chatWindow');
            chatWindow.style.display = chatWindow.style.display === 'none' || chatWindow.style.display === '' ? 'flex' : 'none';
        }

        function sendMessage() {
            const chatInput = document.getElementById('chatInput');
            const chatBody = document.getElementById('chatBody');
            const messageText = chatInput.value.trim();
            
            if (messageText) {
                // Add user message
                const userMessage = document.createElement('div');
                userMessage.className = 'message user';
                userMessage.innerHTML = `<span>${messageText}</span>`;
                chatBody.appendChild(userMessage);

                // Simulate team response
                setTimeout(() => {
                    const teamMessage = document.createElement('div');
                    teamMessage.className = 'message team';
                    const responses = [
                        "Thank you for your message! Our development team will assist you shortly.",
                        "We're here to help with any technical questions about our Healthcare Management System.",
                        "For urgent support, please contact our technical team at support@medicare.com",
                        "Our team is working on enhancing the system features. Your feedback is valuable!"
                    ];
                    const randomResponse = responses[Math.floor(Math.random() * responses.length)];
                    teamMessage.innerHTML = `<span>${randomResponse}</span>`;
                    chatBody.appendChild(teamMessage);

                    // Scroll to bottom
                    chatBody.scrollTop = chatBody.scrollHeight;
                }, 1000);

                // Clear input
                chatInput.value = '';
                chatBody.scrollTop = chatBody.scrollHeight;
            }
        }
    </script>
</body>
</html>
