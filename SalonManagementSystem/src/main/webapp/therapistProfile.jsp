<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

Integer therapistId = (Integer) session.getAttribute("therapistId");

if (therapistId == null) 
{
    response.sendRedirect("therapistLogin.jsp");
    return;
}
%>

<%@ page import="test.TherapistDao, test.Therapist" %>

<%
Therapist therapist = TherapistDao.getTherapistById(therapistId);

//For Check purpose only
if (therapist == null) 
{
   response.sendRedirect("therapistLogin.jsp");
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/therapistProfile.css">
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
            <a href="TherapistDashboard.jsp">Home</a>
            <a href="#">Chat with client</a>
            <a href="#">Ratings</a>
            <a href="therapistProfile.jsp" class="active">Profile</a>
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
                     src="https://ui-avatars.com/api/?name=<%= therapist.getName().replace(" ", "+") %>&size=150&background=667eea&color=fff&bold=true"
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

            <h1 class="profile-name" id="displayName"><%= therapist.getName() %></h1>
            <p class="profile-username" id="displayUsername"><%= therapist.getUsername() %></p>
            
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
                    <div class="info-label">Therapist ID</div>
                    <div class="info-value" id="userId">UID-<%= therapist.getTherapistId() %></div>
                </div>

                 <div class="info-item">
                    <div class="info-label">Full Name</div>
                    <div class="info-value" id="fullName"><%= therapist.getName() %></div>
                </div>
                
                <div class="info-item">
                    <div class="info-label">Username</div>
                    <div class="info-value" id="username"><%= therapist.getUsername() %></div>
                </div>
                
                <div class="info-item">
                    <div class="info-label">Email Address</div>
                    <div class="info-value" id="email"><%= therapist.getEmail() %></div>
                </div>

                <div class="info-item">
                    <div class="info-label">Contact Number</div>
                    <div class="info-value" id="contactNo"><%= therapist.getContactNo() %></div>
                </div>

                <div class="info-item">
                    <div class="info-label">Therapist Since</div>
                    <div class="info-value">January 2022</div>
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
                    <th>Appointment ID</th>
                    <th>Date & Time</th>
                    <th>Customer</th>
                    <th>Service</th>
                    <th>Status</th>
                    <th>Duration</th> 
                </tr>
                </thead>

            <tbody id="appointmentsBody">    
                    <tr>
                        <td>TAPT-501</td>
                         <td>08 Feb 2026 · 09:30 AM</td>
                         <td>arjun_r</td>
                         <td>Men Haircut</td>
                         <td><span class="status-badge status-completed">Completed</span></td>
                         <td>30 min</td>
                    </tr>

                     <tr>
                        <td>TAPT-502</td>
                        <td>08 Feb 2026 · 11:00 AM</td>
                        <td>pooja_s</td>
                        <td>Hair Spa</td>
                        <td><span class="status-badge status-upcoming">Upcoming</span></td>
                        <td>60 min</td>
                     </tr>

                      <tr>
                         <td>TAPT-503</td>
                         <td>07 Feb 2026 · 02:15 PM</td>
                         <td>manish_k</td>
                         <td>Beard Trim + Styling</td>
                         <td><span class="status-badge status-completed">Completed</span></td>
                         <td>40 min</td>
                      </tr>

                       <tr>
                          <td>TAPT-504</td>
                          <td>06 Feb 2026 · 04:30 PM</td>
                          <td>neelam_p</td>
                          <td>Facial Treatment</td>
                          <td><span class="status-badge status-cancelled">Cancelled</span></td>
                          <td>—</td>
                       </tr>

                        <tr>
                           <td>TAPT-505</td>
                           <td>05 Feb 2026 · 10:00 AM</td>
                           <td>rohan_d</td>
                           <td>Hair Coloring</td>
                           <td><span class="status-badge status-completed">Completed</span></td>
                           <td>90 min</td>
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

        <form id="editForm" action="UpdateTherapistServlet" method="post">

            <input type="hidden" name="userId" value="<%= therapist.getTherapistId() %>">

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" id="editName" name="editName"
                       value="<%= therapist.getName() %>" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" id="editEmail" name="editEmail"
                       value="<%= therapist.getEmail() %>" required>
            </div>

            <div class="form-group">
                <label>Contact Number</label>
                <input type="tel" id="editContact" name="editContact"
                       value="<%= therapist.getContactNo() %>" required>
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" id="editUsername" name="editUsername"
                       value="<%= therapist.getUsername() %>" required>
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
              action="<%=request.getContextPath()%>/ChangeTherapistPasswordServlet"
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
<script src="<%= request.getContextPath() %>/JS/therapistProfile.js"></script>

<!-- ================= FOOTER ================= -->
<footer class="footer">
    <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
    <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
</footer>
</body>
</html>