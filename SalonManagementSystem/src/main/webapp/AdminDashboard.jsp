<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Integer ownerId = (Integer) session.getAttribute("ownerId");

if (ownerId == null) 
{
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beauty Hub - Admin Dashboard</title>

    <!-- CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AdminDashboard.css">
</head>
<body>

<!-- ================= HEADER ================= -->
<div class="header">
    <div class="logo">Beauty Hub Admin</div>
    <div class="nav">
        <a href="AdminDashboard.jsp" class = "active">Home</a>
        <a href="#">Appointments</a>
        <a href="#">Ratings</a>
        <a href="<%= request.getContextPath() %>/ownerProfile.jsp">Profile</a>
    </div>
</div>

<!-- ================= HERO SECTION ================= -->
<div class="hero">
    <div class="hero-content">
        <h1>Welcome to Your Salon Dashboard 👋</h1>
        <p>Manage your appointments, track ratings, and oversee your salon operations all in one place. Your beauty business, simplified.</p>
    </div>
</div>

<!-- ================= MAIN CONTENT ================= -->
<div class="main-content">

    <!-- FEATURES SECTION -->
    <div class="features">
        <div class="feature-card">
            <span class="icon">📅</span>
            <h3>Appointment Management</h3>
            <p>View and manage all your salon appointments in real-time. Track upcoming bookings, confirm appointments, and manage your schedule efficiently.</p>
        </div>

        <div class="feature-card">
            <span class="icon">⭐</span>
            <h3>Customer Ratings & Reviews</h3>
            <p>Monitor customer feedback and ratings for your salon services. Respond to reviews and maintain your excellent reputation.</p>
        </div>

        <div class="feature-card">
            <span class="icon">💎</span>
            <h3>Service Management</h3>
            <p>Update your service offerings, pricing, and availability. Showcase your premium treatments and special packages to attract more customers.</p>
        </div>

        <div class="feature-card">
            <span class="icon">👥</span>
            <h3>Customer Insights</h3>
            <p>Track customer preferences, booking history, and loyalty patterns. Build stronger relationships with personalized service.</p>
        </div>

        <div class="feature-card">
            <span class="icon">📊</span>
            <h3>Business Analytics</h3>
            <p>Access detailed reports on revenue, popular services, and peak hours. Make data-driven decisions to grow your salon business.</p>
        </div>

        <div class="feature-card">
            <span class="icon">🔔</span>
            <h3>Smart Notifications</h3>
            <p>Receive instant alerts for new bookings, cancellations, and customer messages. Stay connected with your salon operations 24/7.</p>
        </div>
    </div>
</div>

<!-- ================= FOOTER ================= -->
<footer class="footer">
    <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
    <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
</footer>

<!-- JS -->
<script src="<%= request.getContextPath() %>/JS/AdminDashboard.js"></script>
</body>
</html>
