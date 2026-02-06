<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration - Salon Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/userRegister.css">
</head>
<body>

    <!-- Animated Background -->
    <div class="background-animation">
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <span class="sparkle"></span>
        <span class="sparkle"></span>
        <span class="sparkle"></span>
    </div>

    <div class="main-content">
        <div class="registration-container">
            <div class="card">
                <div class="card-header">
                    <h4>
                        <div class="header-icon">
                            <i class="fas fa-spa"></i>
                        </div>
                        Create Account
                    </h4>
                </div>

                <div class="card-body">
                    <form id="registrationForm"
                          action="${pageContext.request.contextPath}/UserRegisterServlet"
                          method="post">

                        <div class="input-group">
                            <label class="form-label">Full Name</label>
                            <div class="input-wrapper">
                                <input type="text" name="name" class="form-control" placeholder="Enter your full name" required>
                                <i class="fas fa-user input-icon"></i>
                            </div>
                        </div>

                        <div class="input-group">
                            <label class="form-label">Email Address</label>
                            <div class="input-wrapper">
                                <input type="email" name="email" class="form-control" placeholder="your.email@example.com" required>
                                <i class="fas fa-envelope input-icon"></i>
                            </div>
                        </div>

                        <div class="input-group">
                            <label class="form-label">Contact Number</label>
                            <div class="input-wrapper">
                                <input type="text" name="contact" class="form-control" placeholder="+91 XXXXX XXXXX" required>
                                <i class="fas fa-phone input-icon"></i>
                            </div>
                        </div>

                        <div class="input-group">
                            <label class="form-label">Username</label>
                            <div class="input-wrapper">
                                <input type="text" name="username" class="form-control" placeholder="Choose a unique username" required>
                                <i class="fas fa-user-circle input-icon"></i>
                            </div>
                        </div>

                        <div class="input-group">
                            <label class="form-label">Password</label>
                            <div class="input-wrapper">
                                <input type="password" name="password" class="form-control" placeholder="Create a strong password" required>
                                <i class="fas fa-lock input-icon"></i>
                            </div>
                        </div>

                        <button type="submit" class="btn-register">
                            <i class="fas fa-user-plus"></i> Create Account
                        </button>
                    </form>
                </div>

                <div class="card-footer">
                    Already have an account?
                    <a href="${pageContext.request.contextPath}/userLogin.jsp">
                        <i class="fas fa-sign-in-alt"></i> Login here
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Success Popup -->
    <div class="popup-overlay" id="successPopup">
        <div class="popup-content">
            <div class="success-icon">
                <i class="fas fa-check"></i>
            </div>
            <h3>Account Created Successfully!</h3>
            <button class="btn-close-popup" id="closePopup">OK</button>
        </div>
    </div>

    <footer class="footer">
        <div class="footer-content">
            <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
            <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/JS/userRegister.js"></script>

</body>
</html>
