<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Reset Password</title>
<link rel="stylesheet" href="CSS/auththerapist.css">
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="auth-container">
<div class="auth-card">

    <div class="auth-header">
        <h2>Reset Password</h2>
    </div>

    <% if (request.getAttribute("success") != null) { %>
        <div class="success-alert">
            <i class="fa fa-circle-check"></i>
            <span>Password updated successfully!</span>
        </div>

        <script>
            setTimeout(() => {
                window.location.href = "therapistLogin.jsp";
            }, 3000);
        </script>
    <% } %>

    <form action="TherapistResetPasswordServlet" method="post">

        <input type="hidden" name="username"
               value="${username}">

        <div class="input-group">
            <i class="fa fa-lock"></i>
            <input type="password" name="password"
                   placeholder="New Password" required>
        </div>

        <div class="input-group">
            <i class="fa fa-lock"></i>
            <input type="password" name="confirm"
                   placeholder="Confirm Password" required>
        </div>

        <button class="btn">Update Password</button>

    </form>

</div>
</div>

</body>
</html>
    