// Change profile photo
function changePhoto(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('profilePhoto').src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
}

// Edit Profile Modal Functions
function openEditModal() {
    document.getElementById('editName').value = document.getElementById('fullName').textContent;
    document.getElementById('editEmail').value = document.getElementById('email').textContent;
    document.getElementById('editContact').value = document.getElementById('contactNo').textContent;
    document.getElementById('editUsername').value = document.getElementById('username').textContent.replace('@', '');
    document.getElementById('editModal').classList.add('active');
}

function closeEditModal() {
    document.getElementById('editModal').classList.remove('active');
}

// Change Password Modal Functions
function openPasswordModal() {
    document.getElementById('passwordModal').classList.add('active');
}

function closePasswordModal() {
    document.getElementById('passwordModal').classList.remove('active');
}

// Handle Edit Form Submission
document.getElementById('editForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const name = document.getElementById('editName').value;
    const email = document.getElementById('editEmail').value;
    const contact = document.getElementById('editContact').value;
    const username = '@' + document.getElementById('editUsername').value;

    // Update profile display
    document.getElementById('fullName').textContent = name;
    document.getElementById('displayName').textContent = name;
    document.getElementById('email').textContent = email;
    document.getElementById('contactNo').textContent = contact;
    document.getElementById('username').textContent = username;
    document.getElementById('displayUsername').textContent = username;

    closeEditModal();
    alert('Profile updated successfully!');
});

// Handle Password Change Form Submission
document.getElementById('passwordForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const currentPassword = document.getElementById('currentPassword').value;
    const newPassword = document.getElementById('newPassword').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (newPassword !== confirmPassword) {
        alert('New passwords do not match!');
        return;
    }

    if (newPassword.length < 6) {
        alert('Password must be at least 6 characters long!');
        return;
    }

    closePasswordModal();
    alert('Password changed successfully!');
    document.getElementById('passwordForm').reset();
});

// Close modals when clicking outside
window.onclick = function(event) {
    if (event.target.classList.contains('modal')) {
        event.target.classList.remove('active');
    }
}

// Close modals with Escape key
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        closeEditModal();
        closePasswordModal();
    }
});

// Optional: Add smooth scroll behavior
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Optional: Add loading animation for profile photo
document.getElementById('photoInput').addEventListener('change', function() {
    const photoElement = document.getElementById('profilePhoto');
    photoElement.style.opacity = '0.5';
    
    setTimeout(() => {
        photoElement.style.opacity = '1';
    }, 300);
});

// Form validation helper
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

// Enhanced form validation for edit form
document.getElementById('editEmail').addEventListener('blur', function() {
    const email = this.value;
    if (!validateEmail(email)) {
        this.style.borderColor = '#dc3545';
    } else {
        this.style.borderColor = '#667eea';
    }
});

// Phone number formatting (optional)
document.getElementById('editContact').addEventListener('input', function(e) {
    let value = e.target.value.replace(/\D/g, '');
    if (value.length > 10) {
        value = value.slice(0, 10);
    }
    e.target.value = value;
});

// Console log for debugging (remove in production)
console.log('User Profile Page Loaded Successfully!');