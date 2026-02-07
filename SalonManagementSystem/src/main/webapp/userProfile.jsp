<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>

    <!-- CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/userProfile.css">
</head>

<body>

<div class="container">
    <!-- Profile Card -->
    <div class="profile-card">

        <!-- Profile Header -->
        <div class="profile-header">
            <div class="profile-photo-container">
                <img id="profilePhoto"
                     src="https://ui-avatars.com/api/?name=John+Doe&size=150&background=667eea&color=fff&bold=true"
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

            <h1 class="profile-name" id="displayName">John Doe</h1>
            <p class="profile-username" id="displayUsername">@johndoe</p>
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
                    <div class="info-value" id="userId">UID-12345</div>
                </div>

                <div class="info-item">
                    <div class="info-label">Full Name</div>
                    <div class="info-value" id="fullName">John Doe</div>
                </div>

                <div class="info-item">
                    <div class="info-label">Email Address</div>
                    <div class="info-value" id="email">john.doe@example.com</div>
                </div>

                <div class="info-item">
                    <div class="info-label">Contact Number</div>
                    <div class="info-value" id="contactNo">+1 (555) 123-4567</div>
                </div>

                <div class="info-item">
                    <div class="info-label">Username</div>
                    <div class="info-value" id="username">@johndoe</div>
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
                    <th>Appointment ID</th>
                    <th>Date & Time</th>
                    <th>Service / Doctor</th>
                    <th>Status</th>
                    <th>Notes</th>
                </tr>
                </thead>

                <tbody id="appointmentsBody">
                <tr>
                    <td>#APT-001</td>
                    <td>Feb 05, 2026 - 10:00 AM</td>
                    <td>Dr. Sarah Johnson</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>Regular Checkup</td>
                </tr>

                <tr>
                    <td>#APT-002</td>
                    <td>Feb 10, 2026 - 2:30 PM</td>
                    <td>Dr. Michael Brown</td>
                    <td><span class="status-badge status-upcoming">Upcoming</span></td>
                    <td>Consultation</td>
                </tr>

                <tr>
                    <td>#APT-003</td>
                    <td>Jan 28, 2026 - 11:00 AM</td>
                    <td>Dr. Emily Davis</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>Follow-up Visit</td>
                </tr>

                <tr>
                    <td>#APT-004</td>
                    <td>Jan 15, 2026 - 3:00 PM</td>
                    <td>Dr. Robert Wilson</td>
                    <td><span class="status-badge status-cancelled">Cancelled</span></td>
                    <td>Dental Cleaning</td>
                </tr>

                <tr>
                    <td>#APT-005</td>
                    <td>Jan 10, 2026 - 9:00 AM</td>
                    <td>Dr. Lisa Anderson</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>Annual Physical</td>
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

        <form id="editForm">
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" id="editName" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" id="editEmail" required>
            </div>

            <div class="form-group">
                <label>Contact Number</label>
                <input type="tel" id="editContact" required>
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" id="editUsername" required>
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

        <form id="passwordForm">
            <div class="form-group">
                <label>Current Password</label>
                <input type="password" id="currentPassword" required>
            </div>

            <div class="form-group">
                <label>New Password</label>
                <input type="password" id="newPassword" required>
            </div>

            <div class="form-group">
                <label>Confirm New Password</label>
                <input type="password" id="confirmPassword" required>
            </div>

            <div class="modal-actions">
                <button type="submit" class="btn btn-primary">Update Password</button>
                <button type="button" class="btn btn-secondary" onclick="closePasswordModal()">Cancel</button>
            </div>
        </form>
    </div>
</div>

<!-- JS -->
<script src="<%= request.getContextPath() %>/JS/userProfile.js"></script>

</body>
</html>
