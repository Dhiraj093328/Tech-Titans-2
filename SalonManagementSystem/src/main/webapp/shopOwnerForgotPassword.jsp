<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>
<link rel="stylesheet" href="CSS/authshopowner.css">
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="auth-container">
<div class="auth-card">

    <div class="auth-header">
        <h2>Forgot Password</h2>
        <p style="margin-top:6px;color:#666;font-size:14px;">
            Shop Owner Account Recovery
        </p>
    </div>

<!-- ERROR MESSAGE -->
<% if (request.getAttribute("error") != null) { %>
    <div class="error-alert" id="errorMsg">
        <%= request.getAttribute("error") %>
    </div>

    <script>
        setTimeout(function() 
        		{
            var msg = document.getElementById("errorMsg");
            if (msg) 
            {
                msg.style.opacity = "0";
                msg.style.transition = "opacity 0.5s ease";
                setTimeout(function() 
                		{
                    msg.style.display = "none";
                }, 500);
            }
        }, 4000); //4 seconds
    </script>
<% } %>

    <form action="ShopOwnerForgotPasswordServlet" method="post">

        <div class="input-group">
            <i class="fa fa-user"></i>
            <input type="text"
                   name="username"
                   placeholder="Enter username"
                   required>
        </div>

        <button class="btn">Generate Captcha</button>

        <div class="link">
            <a href="adminLogin.jsp">Back to Login</a>
        </div>

    </form>

</div>
</div>

</body>
</html>
