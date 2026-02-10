<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Verify Captcha</title>
<link rel="stylesheet" href="CSS/auth.css">
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="auth-container">
<div class="auth-card">

    <div class="auth-header">
        <h2>Verify OTP</h2>
    </div>

    <form action="VerifyOtpServlet" method="post">

        <input type="hidden" name="username"
               value="${username}">

        <div class="msg">
            Your OTP: <b>${otp}</b>
        </div>

        <div class="input-group">
            <i class="fa fa-key"></i>
            <input type="text" name="otp"
                   placeholder="Enter OTP" required>
        </div>

        <button class="btn">Verify OTP</button>

    </form>

</div>
</div>

</body>
</html>