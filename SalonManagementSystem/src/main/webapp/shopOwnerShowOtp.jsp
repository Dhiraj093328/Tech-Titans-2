<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Verify Captcha</title>
<link rel="stylesheet" href="CSS/authshopowner.css">
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="auth-container">
<div class="auth-card">

    <div class="auth-header">
        <h2>Verify Captcha</h2>
        <p style="margin-top:6px;color:#666;font-size:14px;">
            Shop Owner Password Recovery
        </p>
    </div>

    <form action="ShopOwnerVerifyOtpServlet" method="post">

        <!-- To keep username -->
        <input type="hidden" name="username" value="${username}">

        <div class="msg">
            Your Captcha is: <b>${otp}</b>
        </div>

        <div class="input-group">
            <i class="fa fa-key"></i>
            <input type="text"
                   name="otp"
                   placeholder="Enter Captcha"
                   required>
        </div>

        <button class="btn">Verify Captcha</button>

        <div class="link">
            <a href="adminLogin.jsp">Back to Login</a>
        </div>

    </form>

</div>
</div>

</body>
</html>
