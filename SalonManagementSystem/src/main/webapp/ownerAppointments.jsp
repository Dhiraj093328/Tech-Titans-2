<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, test.Appointment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Beauty Hub - Admin Appointments</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/ownerProfile.css">

    <style>
        body {
            margin: 0;
        }

      .page-title {
    width: 90%;
    max-width: 1100px;
    margin: 25px auto 15px auto;
    color: white;
    font-size: 28px;
    font-weight: 800;
    padding: 18px 24px;
    border-radius: 14px;

    /* SAME TEAL GRADIENT AS HEADER */
    background: linear-gradient(135deg, #00b4db, #0083b0);

    box-shadow: 0 8px 25px rgba(0,0,0,0.2);
}

        .notify-container {
            width: 90%;
            max-width: 1100px;
            margin: 20px auto 40px auto;
        }

        .notify-card {
            border-radius: 15px;
            padding: 22px;
            margin-bottom: 18px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 18px;
            transition: 0.3s ease;
        }

        /* STATUS COLORS */
        .notify-card.PENDING  { background: #fff8e1; }

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
            background: #ffe082;
            color: #795548;
        }

        .btns form {
            display: flex;
            gap: 10px;
        }

        .btn-acc, .btn-rej {
            border: none;
            padding: 10px 16px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
        }

        .btn-acc { background: #28a745; color: white; }
        .btn-rej { background: #dc3545; color: white; }

        .btn-acc:hover, .btn-rej:hover { opacity: 0.9; }

        .popup-success {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #28a745;
            color: white;
            padding: 14px 20px;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            z-index: 999;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <div class="logo">Beauty Hub Admin</div>
    <div class="nav">
        <a href="AdminDashboard.jsp">Home</a>
        <a href="<%=request.getContextPath()%>/ownerAppointments" class="active">Appointments</a>
        <a href="#">Ratings</a>
        <a href="<%= request.getContextPath() %>/ownerProfile.jsp">Profile</a>
    </div>
</div>

<div class="page-title">📌 Appointment Requests (Admin)</div>

<div class="notify-container">

<%
    List<Appointment> list = (List<Appointment>) request.getAttribute("appointments");

    if (list == null || list.isEmpty()) {
%>
        <div class="notify-card PENDING">
            <div class="left-info">
                <h3>No pending appointment requests.</h3>
                <p>When users book appointments, they will appear here.</p>
            </div>
        </div>
<%
    } else {
        for (Appointment ap : list) {

            String st = (ap.getStatus() == null) ? "PENDING" : ap.getStatus().toUpperCase();

            // SHOW ONLY PENDING
            if (!"PENDING".equals(st)) continue;
%>

        <div class="notify-card <%= st %>">
            <div class="left-info">
                <h3><%= ap.getUserName() %> (<%= ap.getUserEmail() %>)</h3>
                <p><b>Salon:</b> <%= ap.getShopName() %></p>
                <p><b>Service:</b> <%= ap.getServiceName() %></p>
                <p><b>Date:</b> <%= ap.getAppointmentDate() %> &nbsp; | &nbsp; <b>Time:</b> <%= ap.getTimeSlot() %></p>

                <span class="status">PENDING</span>
            </div>

            <div class="btns">
                <form action="<%=request.getContextPath()%>/updateAppointmentStatus" method="post">
                    <input type="hidden" name="appointmentId" value="<%= ap.getAppointmentId() %>">
                    <button class="btn-acc" type="submit" name="status" value="ACCEPTED">Accept</button>
                    <button class="btn-rej" type="submit" name="status" value="REJECTED">Reject</button>
                </form>
            </div>
        </div>

<%
        }
    }
%>

</div>

<!-- SUCCESS POPUP -->
<%
    String mailSent = request.getParameter("mailSent");
    if ("true".equals(mailSent)) {
%>
    <div class="popup-success">
        ✅ Email sent to user successfully!
    </div>
<%
    }
%>

<footer class="footer">
    <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
    <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
</footer>

</body>
</html>
