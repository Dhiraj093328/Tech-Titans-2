<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Therapist Login Page</title>

<link href="CSS/bootstrap.min.css" rel="stylesheet">
<link href="CSS/popup.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<style>
.alert {
    transition: opacity 0.5s ease, transform 0.5s ease;
}
.alert:not(.show) {
    opacity: 0;
    transform: translateY(-10px);
}
#loginBtn {
    border-radius: 14px;
    background: linear-gradient(135deg, #667eea, #764ba2);
    border: none;
}
.card {
    animation: fadeUp 0.5s ease;
}
@keyframes fadeUp {
    from { opacity: 0; transform: translateY(10px); }
    to   { opacity: 1; transform: translateY(0); }
}
body {
    background: linear-gradient(135deg, #74ebd5, #9face6);
}
</style>
</head>

<body class="bg-light">

<div class="d-flex align-items-center" style="min-height:100vh;">
<div class="container">
<div class="row justify-content-center">
<div class="col-12 col-sm-10 col-md-6 col-lg-5">

<div class="card shadow-lg rounded-4">
<div class="card-body p-4">

<h2 class="text-center fw-bold">Therapist Login</h2>

<%
String error = (String) request.getAttribute("error");
if (error != null) {
%>
<div id="errorMsg" class="alert alert-danger text-center show mt-3">
    <i class="bi bi-exclamation-triangle-fill me-2"></i>
    <%= error %>
</div>
<%
}
%>

<form action="TherapistLoginServlet" method="post" class="needs-validation" novalidate>

<div class="input-group mt-3">
    <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
    <input type="text" class="form-control" name="tuser"
           placeholder="Enter username" required minlength="4">
    <div class="invalid-feedback">
        Please enter your username (min 4 characters)
    </div>
</div>

<div class="input-group mt-3">
    <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
    <input type="password" class="form-control" id="password"
           name="tpass" placeholder="Enter password" required minlength="6">
    <div class="invalid-feedback">
        Password must be at least 6 characters
    </div>
</div>

<div class="form-check mt-3">
    <input class="form-check-input" type="checkbox" onclick="togglePassword()">
    <label class="form-check-label">Show Password</label>
</div>

<div class="mt-3">
<button type="submit" id="loginBtn"
        class="btn btn-success w-100 py-2 fw-semibold d-flex justify-content-center align-items-center">
    <span id="btnText">Login</span>
    <span id="btnLoader" class="spinner-border spinner-border-sm ms-2 d-none"></span>
</button>
</div>

<div class="text-center mt-3 d-flex justify-content-between"
     style="max-width:260px;margin:auto;">
    <a href="forgat" class="text-decoration-none">Forgot Password?</a>
    <a href="therapistRegister.jsp" class="text-decoration-none">Create Account</a>
</div>

</form>

</div>
</div>

</div>
</div>
</div>
</div>

<!-- FLASH PARAM HANDLER -->
<script>
(function () {
    const params = new URLSearchParams(window.location.search);
    const flash = params.get("flash");

    if (!flash) return;

    if (flash === "register")
        localStorage.setItem("flashMsg", "Registration successful ✅ Please login");

    if (flash === "login")
        localStorage.setItem("flashMsg", "Login successful 🎉 Welcome!");
})();
</script>

<!-- POPUP HANDLER -->
<script src="JS/flashPopup.js"></script>

<!-- SINGLE SUBMIT HANDLER (FIXED) -->
<script>
document.querySelector("form").addEventListener("submit", function (e) {

    if (!this.checkValidity()) {
        e.preventDefault();
        this.classList.add("was-validated");
        return;
    }

    const btn = document.getElementById("loginBtn");
    const text = document.getElementById("btnText");
    const loader = document.getElementById("btnLoader");

    btn.disabled = true;
    text.textContent = "Logging in";
    loader.classList.remove("d-none");
});
</script>

<!-- AUTO HIDE ERROR -->
<script>
window.addEventListener("DOMContentLoaded", () => {
    const error = document.getElementById("errorMsg");
    if (error) {
        setTimeout(() => {
            error.classList.remove("show");
            setTimeout(() => error.remove(), 400);
        }, 5000);
    }
});
</script>

<script>
function togglePassword() {
    const p = document.getElementById("password");
    p.type = p.type === "password" ? "text" : "password";
}
</script>

<script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
