<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beauty Hub - Therapist Dashboard</title>

    <!-- CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/TherapistDashboard.css">
</head>

<body>

<!-- ================= HEADER ================= -->
<div class="header">
    <div class="logo">Beauty Hub Therapist</div>
    <div class="nav">
        <a href="#" class="active">Home</a>
        <a href="#">Conversation with Client</a>
        <a href="#">Ratings</a>
        <a href="#">Profile</a>
    </div>
</div>

<!-- ================= HERO SECTION ================= -->
<div class="hero">
    <div class="hero-content">
        <h1>Welcome to Your Beauty Services 👋</h1>
        <p>
            Discover our expert beauty services including hair styling, makeup, facials, and more. 
            Experience professional care and transform your clients' look with our talented therapists.
        </p>
    </div>
</div>

<!-- ================= MAIN CONTENT ================= -->
<div class="main-content">
    <div class="features">
        <div class="feature-card">
            <span class="icon">💇</span>
            <h3>Hair Styling</h3>
            <p>Expert hair cutting, coloring, and styling services. Trendy haircuts, balayage, highlights, and professional blow-drying.</p>
        </div>

        <div class="feature-card">
            <span class="icon">💄</span>
            <h3>Makeup</h3>
            <p>Professional makeup for all occasions. Bridal, party looks, natural glam, and special event makeup services.</p>
        </div>

        <div class="feature-card">
            <span class="icon">✨</span>
            <h3>Facial Treatments</h3>
            <p>Rejuvenating facials including deep cleansing, anti-aging treatments, hydrating facials, and specialized skin care.</p>
        </div>

        <div class="feature-card">
            <span class="icon">💅</span>
            <h3>Manicure & Pedicure</h3>
            <p>Complete nail care: gel polish, nail art, French manicure, spa pedicures, and luxurious hand/foot treatments.</p>
        </div>

        <div class="feature-card">
            <span class="icon">🌸</span>
            <h3>Spa & Massage</h3>
            <p>Relaxing massages, aromatherapy, hot stone therapy, and rejuvenating spa treatments for mind and body wellness.</p>
        </div>

        <div class="feature-card">
            <span class="icon">👁️</span>
            <h3>Beauty Treatments</h3>
            <p>Eyebrow threading, eyelash extensions, waxing, and specialized beauty treatments to enhance natural features.</p>
        </div>
    </div>
</div>

<!-- ================= FOOTER ================= -->
<footer class="footer">
    <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
    <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
</footer>

<!-- JS -->
<script src="<%= request.getContextPath() %>/JS/TherapistDashboard.js"></script>

</body>
</html>
