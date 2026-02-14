<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, test.Appointment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beauty Hub - Notifications</title>

    <!-- SAME CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/userDashboard.css">

    <style>
        .notify-container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .notify-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 18px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 18px;
        }

        .left-info h3 {
            margin: 0 0 8px 0;
            color: #222;
        }

        .left-info p {
            margin: 4px 0;
            color: #444;
        }

        .status {
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 12px;
            display: inline-block;
            margin-top: 8px;
        }

        .PENDING  { background: #fff3cd; color: #856404; }
        .ACCEPTED { background: #d4edda; color: #155724; }
        .REJECTED { background: #f8d7da; color: #721c24; }

        .page-title {
            width: 90%;
            max-width: 1100px;
            margin: 25px auto 10px auto;
            color: white;
            font-size: 28px;
            font-weight: 700;
        }
    </style>
</head>

<body>

<!-- ================= HEADER (SAME AS USER DASHBOARD) ================= -->
<div class="header">
    <div class="logo">Beauty Hub</div>
    <div class="nav">
        <a href="UserDashboard.jsp">Home</a>
        <a href="MySalons.jsp">My Salons</a>
        <a href="#">Chat with Expert</a>
        <a href="TrendingSample.jsp">Trending Style</a>
      <a href="<%=request.getContextPath()%>/UserNotificationsServlet">Notifications</a>
        <a href="userProfile.jsp">Profile</a>
    </div>
</div>

<div class="page-title">🔔 My Notifications</div>

<div class="notify-container">

    <%
        List<Appointment> list = (List<Appointment>) request.getAttribute("appointments");

        if (list == null || list.isEmpty()) {
    %>
        <div class="notify-card">
            <div class="left-info">
                <h3>No notifications found.</h3>
                <p>When you book an appointment, status updates will appear here.</p>
            </div>
        </div>
    <%
        } else {
            for (Appointment ap : list) {
                String st = (ap.getStatus() == null) ? "PENDING" : ap.getStatus().toUpperCase();
    %>

        <div class="notify-card">
            <div class="left-info">
                <h3><%= ap.getShopName() %></h3>
                <p><b>Service:</b> <%= ap.getServiceName() %></p>
                <p><b>Date:</b> <%= ap.getAppointmentDate() %> &nbsp; | &nbsp; <b>Time:</b> <%= ap.getTimeSlot() %></p>
                <span class="status <%= st %>"><%= st %></span>
            </div>
        </div>

    <%
            }
        }
    %>

</div>

<a href="ownerAppointments.jsp">Go to owner Appoinment Page</a>

<!-- ================= FOOTER (SAME AS USER DASHBOARD) ================= -->
<footer class="footer">
    <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
    <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
</footer>

<script src="<%= request.getContextPath() %>/CSS/userDashboard.js"></script>

</body>
</html>
