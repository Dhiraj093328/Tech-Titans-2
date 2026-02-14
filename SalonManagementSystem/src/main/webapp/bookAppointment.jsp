<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Appointment</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/userDashboard.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<!-- ================= HEADER ================= -->
<div class="header">
    <div class="logo">Beauty Hub</div>
    <div class="nav">
        <a href="UserDashboard.jsp" >Home</a>
        <a href="MySalons.jsp" class="active">My Salons</a>
        <a href="#">Chat with Expert</a>
        <a href="#">Trending Style</a>
        <a href="#">Notifications</a>
        <a href="userProfile.jsp">Profile</a>    
     </div>
</div>

<body>

<%
    String salon = request.getParameter("salon");
    String shopOwnerId = request.getParameter("shopOwnerId");
    String serviceId = request.getParameter("serviceId");

    if (salon == null) salon = "Salon";
%>

<div class="container" style="max-width:650px; margin:30px auto;">
    <div class="card p-4" style="border-radius:16px;">
        <h3 class="mb-2">Book Appointment</h3>
        <p class="mb-3"><b>Salon:</b> <%= salon %></p>

        <% if (shopOwnerId == null || shopOwnerId.trim().isEmpty()) { %>
            <div class="alert alert-warning">
                Owner ID missing. Please go back and select salon again.
            </div>
        <% } else { %>

        <form action="<%=request.getContextPath()%>/bookAppointment" method="post">

            <!-- ✅ must pass these to servlet -->
            <input type="hidden" name="salon" value="<%= salon %>">
            <input type="hidden" name="shopOwnerId" value="<%= shopOwnerId %>">

            <div class="mb-3">
                <label class="form-label"><b>Select Service</b></label>
                <select class="form-select" name="serviceId" required>
                    <option value="4" <%= "4".equals(serviceId) ? "selected" : "" %>>Haircut</option>
                    <option value="5" <%= "5".equals(serviceId) ? "selected" : "" %>>Facial</option>
                    <option value="6" <%= "6".equals(serviceId) ? "selected" : "" %>>Hair Spa</option>
                    <option value="1" <%= "1".equals(serviceId) ? "selected" : "" %>>Default Service</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label"><b>Appointment Date</b></label>
                <input type="date" class="form-control" name="appointmentDate" required>
            </div>

            <div class="mb-3">
                <label class="form-label"><b>Time Slot</b></label>
                <input type="time" class="form-control" name="timeSlot" required>
            </div>

            <button type="submit" class="btn btn-success w-100">Confirm Booking</button>
            <!-- SUCCESS POPUP -->
<div class="success-overlay" id="successPopup">
<div class="success-box">
   
</div>
</div>
        </form>

        <% } %>
    </div>
</div>

<footer class="footer">
    <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
    <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
</footer>

</body>
</html>
