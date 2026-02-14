<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beauty Hub - Home</title>

    <!-- CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/userDashboard.css">
</head>

<body>

<!-- ================= HEADER ================= -->
<div class="header">
    <div class="logo">Beauty Hub</div>
    <div class="nav">
        <a href="#" class="active">Home</a>
        <a href="MySalons.jsp">My Salons</a>
        <a href="#">Chat with Expert</a>
        <a href="TrendingSample.jsp">Trending Style</a>
        <a href="<%=request.getContextPath()%>/UserNotificationsServlet">Notifications</a>

        <a href="userProfile.jsp">Profile</a>    
     </div>
</div>

<!-- ================= HERO SECTION ================= -->
<div class="hero">
    <div class="hero-content">
        <h1>Your Beauty Journey Starts Here 👋</h1>
        <p>
            Discover expert therapists, explore trending styles, and get personalized beauty
            recommendations. Experience premium salon services at your fingertips.
        </p>
    </div>
</div>

<!-- ================= MAIN CONTENT ================= -->
<div class="main-content">

    <!-- LEFT COLUMN -->
    <div class="features">
        <div class="feature-card">
            <span class="icon">📅</span>
            <h3>Easy Scheduling</h3>
            <p>
                View salon availability in real-time and manage your appointments effortlessly.
                Get instant confirmations and timely reminders.
            </p>
        </div>

        <div class="feature-card">
            <span class="icon">💬</span>
            <h3>Chat with Therapists</h3>
            <p>
                Connect directly with beauty experts and therapists.
                Get personalized advice and recommendations instantly.
            </p>
        </div>
    </div>
    

    <!-- RIGHT COLUMN -->
    <div>
        <div class="ad-container">
            <div class="ad-box">
                <div class="ad-content">
                    <h4>🎉 Welcome Offer!</h4>
                    <p>Get 50% OFF on your first service! Choose from over 100+ premium salons.</p>
                </div>
            </div>
        </div>

        <div class="ad-container">
            <div class="ad-box ad-box-2">
                <div class="ad-content">
                    <h4>💎 Loyalty Rewards</h4>
                    <p>Earn points with every visit! Redeem for discounts and free treatments.</p>
                </div>
            </div>
        </div>

        <div class="ad-container">
            <div class="ad-box ad-box-3">
                <div class="ad-content">
                    <h4>✨ Trending Styles</h4>
                    <p>Explore this month's hottest beauty trends near you!</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ================= FOOTER ================= -->
<footer class="footer">
    <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
    <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
</footer>

<!-- JS -->
<script src="<%= request.getContextPath() %>/CSS/userDashboard.js"></script>

</body>
</html>
