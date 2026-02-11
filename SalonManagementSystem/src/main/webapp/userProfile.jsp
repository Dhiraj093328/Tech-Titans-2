<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

Integer userId = (Integer) session.getAttribute("userId");

if (userId == null) 
{
    response.sendRedirect("userLogin.jsp");
    return;
}
%>

<%@ page import="test.UserDAO, test.User" %>

<%
User user = UserDAO.getUserById(userId);

//For Check purpose only
if (user == null) 
{
   response.sendRedirect("userLogin.jsp");
   return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>

    <!-- CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/userProfile.css">
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
    
</head>
<body>

<!-- ================= HEADER ================= -->
<header class="header">
    <div class="header-inner">
        <div class="logo">Beauty Hub</div>

        <nav class="nav">
            <a href="UserDashboard.jsp">Home</a>
            <a href="#">My Salons</a>
            <a href="#">Chat with Expert</a>
            <a href="TrendingSample.jsp">Trending Style</a>
            <a href="#">Notifications</a>
            <a href="userProfile.jsp" class="active">Profile</a>
        </nav>
    </div>
</header>

<div class="container">
    <!-- Profile Card -->
    <div class="profile-card">

        <!-- Profile Header -->
        <div class="profile-header">
            <div class="profile-photo-container">
                <img id="profilePhoto"
                     src="https://ui-avatars.com/api/?name=<%= user.getName().replace(" ", "+") %>&size=150&background=667eea&color=fff&bold=true"
                     alt="Profile Photo"
                     class="profile-photo">

                <button class="photo-upload-btn"
                        onclick="document.getElementById('photoInput').click()">
                    <span class="icon">📷</span>
                </button>

                <input type="file"
                       id="photoInput"
                       accept="image/*"
                       style="display:none;"
                       onchange="changePhoto(event)">
            </div>

            <h1 class="profile-name" id="displayName"><%= user.getName() %></h1>
            <p class="profile-username" id="displayUsername"><%= user.getUsername() %></p>
            
        </div>

        <!-- Profile Body -->
        <div class="profile-body">

            <!-- Action Buttons -->
            <div class="profile-actions">
                <button class="btn btn-primary" onclick="openEditModal()">
                    <span class="icon">✏️</span> Edit Profile
                </button>
                <button class="btn btn-secondary" onclick="openPasswordModal()">
                    <span class="icon">🔒</span> Change Password
                </button>
            </div>

            <!-- User Information -->
            <div class="info-grid">

                <div class="info-item">
                    <div class="info-label">User ID</div>
                    <div class="info-value" id="userId">UID-<%= user.getUserId() %></div>
                </div>

                <div class="info-item">
                    <div class="info-label">Full Name</div>
                    <div class="info-value" id="fullName"><%= user.getName() %></div>
                </div>

                <div class="info-item">
                    <div class="info-label">Email Address</div>
                    <div class="info-value" id="email"><%= user.getEmail() %></div>
                </div>

                <div class="info-item">
                    <div class="info-label">Contact Number</div>
                    <div class="info-value" id="contactNo"><%= user.getContactNo() %></div>
                </div>

                <div class="info-item">
                    <div class="info-label">Username</div>
                    <div class="info-value" id="username"><%= user.getUsername() %></div>
                </div>

                <div class="info-item">
                    <div class="info-label">Member Since</div>
                    <div class="info-value">January 2024</div>
                </div>

            </div>

            <!-- Recent Appointments -->
            <h2 class="section-title">
                <span class="icon">📅</span>
                Recent Appointment History
            </h2>

            <table class="appointments-table">
                <thead>
                <tr>
                    <th>User Appointment ID</th>
                    <th>Date & Time</th>
                    <th>Username</th>
                    <th>Status</th>
                    <th>Services</th>
                </tr>
                </thead>

                <tbody id="appointmentsBody">
                <tr>
                    <td>#APT-001</td>
                    <td>Feb 05, 2026 - 10:00 AM</td>
                    <td>Alex Johnsonn</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>Haircut & Styling</td>
                </tr>

                <tr>
                    <td>#APT-002</td>
                    <td>Feb 10, 2026 - 2:30 PM</td>
                    <td>Liam Johnson</td>
                    <td><span class="status-badge status-upcoming">Upcoming</span></td>
                    <td>Beard Trim</td>
                </tr>

                <tr>
                    <td>#APT-003</td>
                    <td>Jan 28, 2026 - 11:00 AM</td>
                    <td>Emily Davis</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>Facial Treatment</td>
                </tr>

                <tr>
                    <td>#APT-004</td>
                    <td>Jan 15, 2026 - 3:00 PM</td>
                    <td>Robert Wilson</td>
                    <td><span class="status-badge status-cancelled">Cancelled</span></td>
                    <td>Hair Coloring</td>
                </tr>

                <tr>
                    <td>#APT-005</td>
                    <td>Jan 10, 2026 - 9:00 AM</td>
                    <td>Ethan Davis</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>Haircut & Styling</td>
                </tr>
                </tbody>
            </table>

        </div>
    </div>
</div>

<!-- Edit Profile Modal -->
<div id="editModal" class="modal">
    <div class="modal-content">
        <h2 class="modal-header">Edit Profile</h2>

        <form id="editForm" action="UpdateProfileServlet" method="post">

            <input type="hidden" name="userId" value="<%= user.getUserId() %>">

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" id="editName" name="editName"
                       value="<%= user.getName() %>" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" id="editEmail" name="editEmail"
                       value="<%= user.getEmail() %>" required>
            </div>

            <div class="form-group">
                <label>Contact Number</label>
                <input type="tel" id="editContact" name="editContact"
                       value="<%= user.getContactNo() %>" required>
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" id="editUsername" name="editUsername"
                       value="<%= user.getUsername() %>" required>
            </div>

            <div class="modal-actions">
                <button type="submit" class="btn btn-primary">Save Changes</button>
                <button type="button" class="btn btn-secondary"
                        onclick="closeEditModal()">Cancel</button>
            </div>

        </form>
    </div>
</div>

<!-- Change Password Modal -->
<div id="passwordModal" class="modal">
    <div class="modal-content">
        <h2 class="modal-header">Change Password</h2>

        <form id="passwordForm"
              action="<%=request.getContextPath()%>/ChangePasswordServlet"
              method="post">

            <div class="form-group">
                <label>Current Password</label>
                <input type="password" id="currentPassword" name="currentPassword" required>
            </div>

            <div class="form-group">
                <label>New Password</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>

            <div class="form-group">
                <label>Confirm New Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>

            <div class="modal-actions">
                <button type="submit" class="btn btn-primary">
                    Update Password
                </button>
                <button type="button" class="btn btn-secondary" onclick="closePasswordModal()">
                    Cancel
                </button>
            </div>

        </form>
    </div>
</div>

<%
String pwdStatus = request.getParameter("pwd");
%>
<script>
document.addEventListener('DOMContentLoaded', function () {

    const pwdStatus = '<%= pwdStatus %>';

    if (pwdStatus === 'success') {
        showSuccessAlert('Password updated successfully 🔐');
    }
    else if (pwdStatus === 'wrong') {
        showSuccessAlert('Current password is incorrect ❌');
    }
    else if (pwdStatus === 'nomatch') {
        showSuccessAlert('Passwords do not match ⚠️');
    }
    else if (pwdStatus === 'error') {
        showSuccessAlert('Something went wrong. Try again 😕');
    }

});
</script>


<!-- JS -->
<script src="<%= request.getContextPath() %>/JS/userProfile.js"></script>

<!-- ================= FOOTER ================= -->
<footer class="footer">
    <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
    <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
</footer>
</body>
</html> 