<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>
<link rel="stylesheet" href="CSS/auththerapist.css">
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="auth-container">
<div class="auth-card">

    <div class="auth-header">
        <h2>Forgot Password</h2>
    </div>

    <form action="TherapistForgotPasswordServlet" method="post">

        <div class="input-group">
            <i class="fa fa-user"></i>
            <input type="text" name="username"
                   placeholder="Enter username" required>
        </div>

        <button class="btn">Generate Captcha</button>

        <div class="link">
            <a href="therapistLogin.jsp">Back to Login</a>
        </div>

    </form>

</div>
</div>

</body>
</html>
    