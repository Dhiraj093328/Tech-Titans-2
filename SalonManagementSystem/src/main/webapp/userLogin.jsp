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

    <div class="main-content">
        <div class="login-container">
            <div class="card">
                <div class="card-header text-center">
                    <h4>
                        <i class="fas fa-sign-in-alt"></i> Login Page
                    </h4>
                </div>

                <div class="card-body">

                    <!-- Error Message from Servlet -->
                    <%
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                    %>
                    <div class="alert alert-danger text-center">
                        <i class="fas fa-exclamation-circle"></i>
                        <span><%= error %></span>
                    </div>
                    <%
                        }
                    %>

                    <!-- Login Form -->
                    <form id="loginForm"
                          action="${pageContext.request.contextPath}/login"
                          method="post">

                        <!-- Username -->
                        <div class="mb-3 input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" name="username" class="form-control"
                                   placeholder="Enter your username" required>
                        </div>

                        <!-- Password -->
                        <div class="mb-3 input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" name="password" id="password"
                                   class="form-control" placeholder="Enter your password" required>
                            <span class="input-group-text">
                                <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                            </span>
                        </div>

                        <!-- Forgot Password -->
                        <div class="mb-3 text-end">
                            <a href="#" class="forgot-password">Forgot Password?</a>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">
                            <i class="fas fa-sign-in-alt"></i> Login
                        </button>
                    </form>
                </div>

                <div class="card-footer text-center">
                    New User? 
                    <a href="${pageContext.request.contextPath}/userRegister.jsp">
                        <i class="fas fa-user-plus"></i> Register Here
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer text-center mt-4">
        <p>© 2026 Salon Management System. All Rights Reserved.</p>
        <p>Crafted with ❤️ for Beauty & Wellness Professionals</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Password Toggle JS -->
    <script>
        const togglePassword = document.getElementById('togglePassword');
        const password = document.getElementById('password');

        togglePassword.addEventListener('click', () => {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            togglePassword.classList.toggle('fa-eye-slash');
        });
    </script>

</body>
</html>
