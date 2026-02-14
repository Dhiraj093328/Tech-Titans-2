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

<%@ page import="test.Shop_OwnerDao, test.Shop_Owner" %>

<%
Shop_Owner owner = Shop_OwnerDao.getOwnerById(ownerId);
//For Check purpose only
if (owner == null) 
{
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>

<%
String openingTime = "";
String closingTime = "";

if (owner.getOpening_time() != null) {
    openingTime = owner.getOpening_time().toString().substring(0,5);
}
if (owner.getClosing_time() != null) {
    closingTime = owner.getClosing_time().toString().substring(0,5);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Owner Profile</title>

    <!-- CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/ownerProfile.css">
    
</head>
<body>

<!-- ================= HEADER ================= -->
<header class="header">
    <div class="header-inner">
        <div class="logo">Beauty Hub</div>

        <nav class="nav">
            <a href="AdminDashboard.jsp">Home</a>
             <a href="<%=request.getContextPath()%>/ownerAppointments" class="active">Appoinments</a>

        <a href="#">Ratings</a>
            <a href="ownerProfile.jsp" class="active">Profile</a>
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
                     src="https://ui-avatars.com/api/?name=<%= owner.getOwner_name().replace(" ", "+") %>&size=150&background=667eea&color=fff&bold=true"
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

            <h1 class="profile-name" id="displayName"><%= owner.getOwner_name() %></h1>
            <p class="profile-username" id="displayUsername"><%= owner.getUsername() %></p>
            
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
                    <div class="info-label">Shop Owner ID</div>
                    <div class="info-value" id="shopownerId">UID-<%= owner.getShop_owner_id() %></div>
                </div>

                <div class="info-item">
                    <div class="info-label">Shop Name</div>
                    <div class="info-value" id="displayShopName"><%=owner.getShop_name() %></div>
                </div>

                <div class="info-item">
                    <div class="info-label">Registration No</div>
                    <div class="info-value" id="registrationNo"><%= owner.getRegistration_no() %></div>
                </div>
                
                <div class="info-item">
                    <div class="info-label">OwnerName</div>
                    <div class="info-value" id="displayOwnerName"><%= owner.getOwner_name() %></div>
                </div>
                
                <div class="info-item">
                    <div class="info-label">UserName</div>
                    <div class="info-value" id="displayUsername"><%= owner.getUsername() %></div>
                </div>
                

                <div class="info-item">
                    <div class="info-label">Email</div>
                    <div class="info-value" id="displayEmail"><%= owner.getEmail() %></div>
                </div>
                                                                        
                <div class="info-item">
                    <div class="info-label">Contact No</div>
                    <div class="info-value" id="displayContact"><%= owner.getContact_no() %></div>
                </div>
                
                 <div class="info-item">
                    <div class="info-label">Opening Time</div>
                    <div class="info-value" id="displayOpeningTime"><%= owner.getOpening_time() %></div>
                </div>
                
                <div class="info-item">
                    <div class="info-label">Closing Time</div>
                    <div class="info-value" id="displayClosingTime"><%= owner.getClosing_time() %></div>
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
                    <th>Services</th>
                    <th>Status</th>
                    <th>Amount / Duration</th>
                </tr>
                </thead>

                <tbody id="appointmentsBody">
                <tr>
                    <td>APT-2001</td>
                    <td>08 Feb 2026 · 10:30 AM</td>
                    <td>rahul_01</td>
                    <td>Haircut + Beard Trim</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>₹500 · 45 min</td>
                </tr>

                <tr>
                    <td>APT-2002</td>
                    <td>08 Feb 2026 · 01:00 PM</td>
                    <td>ananya_p</td>
                    <td>Hair Spa</td>
                    <td><span class="status-badge status-upcoming">Upcoming</span></td>
                    <td>₹900 · 60 min</td>
                </tr>

                <tr>
                   <td>APT-2003</td>
                   <td>07 Feb 2026 · 04:15 PM</td>
                   <td>vikram_k</td>
                   <td>Hair Coloring</td>
                   <td><span class="status-badge status-cancelled">Cancelled</span></td>
                   <td>₹1,800 · 90 min</td>
                </tr>

                <tr>
                    <td>APT-2004</td>
                    <td>06 Feb 2026 · 11:45 AM</td>
                    <td>neha_s</td>
                    <td>Facial + Cleanup</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>₹1,200 · 70 min</td>
                </tr>

                <tr>
                    <td>APT-2005</td>
                    <td>05 Feb 2026 · 09:30 AM</td>
                    <td>rohit_m</td>
                    <td>Haircut</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>₹300 · 30 min</td>
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

        <form id="editForm" action="UpdateShopOwnerServlet" method="post">

            <input type="hidden" name="shopOwnerId" value="<%= owner.getShop_owner_id() %>">

            <div class="form-group">
                <label>Owner Name</label>
                <input type="text" id="editOwnerName" name="ownerName" value="<%= owner.getOwner_name() %>" required>
            </div>
            
            <div class="form-group">
                <label>Username</label>
                <input type="text" id="editUsername" name="editUsername" value="<%= owner.getUsername() %>" required>
            </div>
        
            <div class="form-group">
                <label>Shop Name</label>
                <input type="text" id="editShopName" name="shopName" value="<%= owner.getShop_name() %>" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" id="editEmail" name="editEmail" value="<%= owner.getEmail() %>" required>
            </div>

            <div class="form-group">
                <label>Contact Number</label>
                <input type="tel" id="editContact" name="editContact" value="<%= owner.getContact_no() %>" required>
            </div>
            
            <div class="form-group">
                <label>Registration No</label>
                <input type="text" name="registrationNo" value="<%=owner.getRegistration_no() %>" required>
            </div>
            
            <div class="form-group">
                <label>Opening Time</label>
                <input type="time" id="editOpeningTime" name="openingTime" value="<%= openingTime %>" required>
            </div>
            
            <div class="form-group">
                <label>Closing Time</label>
                <input type="time" id="editClosingTime" name="closingTime" value="<%= closingTime %>" required>
            </div>

            <div class="modal-actions">
                <button type="submit" class="btn btn-primary">Save Changes</button>
                <button type="button" class="btn btn-secondary" onclick="closeEditModal()">Cancel</button>
            </div>

        </form>
    </div>
</div>

<!-- Change Password Modal -->
<div id="passwordModal" class="modal">
    <div class="modal-content">
        <h2 class="modal-header">Change Password</h2>

        <form id="passwordForm"
              action="<%=request.getContextPath()%>/ChangeOwnerPasswordServlet"
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
<script src="<%= request.getContextPath() %>/JS/ownerProfile.js"></script>

<!-- ================= FOOTER ================= -->
<footer class="footer">
    <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
    <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
</footer>
</body>
</html> 