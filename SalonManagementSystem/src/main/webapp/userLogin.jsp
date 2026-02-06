<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Salon Management</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/userLogin.css">
</head>
<body>

    <!-- Animated Background Effects -->
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
        <div class="login-container">
            <div class="card">
                <div class="card-header">
                    <h4>
                        <div class="header-icon">
                            <i class="fas fa-sign-in-alt"></i>
                        </div>
                        Login Page
                    </h4>
                </div>

                <div class="card-body">

                    <!-- Error Message from Servlet -->
                    <%
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                    %>
                    <div class="error-message">
                        <i class="fas fa-exclamation-circle"></i>
                        <span><%= error %></span>
                    </div>
                    <%
                        }
                    %>

                    <form id="loginForm"
                          action="${pageContext.request.contextPath}/LoginServlet"
                          method="post">

                        <!-- Username -->
                        <div class="input-group">
                            <label class="form-label">Username</label>
                            <div class="input-wrapper">
                                <input type="text" name="username" class="form-control"
                                       placeholder="Enter your username" required>
                                <i class="fas fa-user input-icon"></i>
                            </div>
                        </div>

                        <!-- Password -->
                        <div class="input-group">
                            <label class="form-label">Password</label>
                            <div class="input-wrapper">
                                <input type="password" name="password" id="password"
                                       class="form-control" placeholder="Enter your password" required>
                                <i class="fas fa-lock input-icon"></i>
                                <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                            </div>
                        </div>

                        <!-- Remember Me & Forgot Password -->
                        <div class="form-options">
                            
                            <a href="#" class="forgot-password">Forgot Password?</a>
                        </div>

                        <button type="submit" class="btn-login">
                            <i class="fas fa-sign-in-alt"></i> Login
                        </button>
                    </form>
                </div>

                <div class="card-footer">
                    New User?
                    <a href="${pageContext.request.contextPath}/userRegister.jsp">
                        <i class="fas fa-user-plus"></i> Register Here
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Success Login Popup -->
    <div class="popup-overlay" id="successPopup">
        <div class="popup-content">
            <div class="success-icon">
                <i class="fas fa-check"></i>
            </div>
            <h3>🎉 Login Successful!</h3>
            <p>Welcome back! Redirecting to your dashboard...</p>
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
    <script src="${pageContext.request.contextPath}/JS/userLogin.js"></script>

</body>
</html>
