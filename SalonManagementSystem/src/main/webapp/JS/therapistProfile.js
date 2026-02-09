/**
 * 
 */
// ================= WAIT FOR DOM =================
document.addEventListener('DOMContentLoaded', function () {

    // ================= CHANGE PROFILE PHOTO =================
    const photoInput = document.getElementById('photoInput');
    if (photoInput) {
        photoInput.addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (!file) return;

            const reader = new FileReader();
            reader.onload = function (e) {
                const img = document.getElementById('profilePhoto');
                if (img) img.src = e.target.result;
            };
            reader.readAsDataURL(file);
        });
    }

    // ================= EDIT FORM =================
    const editForm = document.getElementById('editForm');
    if (editForm) {
        editForm.addEventListener('submit', function () {
            // allow servlet submission
        });
    }

	// ================= PASSWORD FORM =================
	const passwordForm = document.getElementById('passwordmodal');

	if (passwordForm) {
	    passwordForm.addEventListener('submit', function (e) {

	        const currentPassword = document.getElementById('currentPassword').value.trim();
	        const newPassword = document.getElementById('newPassword').value.trim();
	        const confirmPassword = document.getElementById('confirmPassword').value.trim();

	        if (!currentPassword || !newPassword || !confirmPassword) {
	            e.preventDefault();
	            showErrorAlert('All fields are required!');
	            return;
	        }

	        if (newPassword.length < 6) {
	            e.preventDefault();
	            showErrorAlert('Password must be at least 6 characters!');
	            return;
	        }

	        if (newPassword !== confirmPassword) {
	            e.preventDefault();
	            showErrorAlert('Passwords do not match!');
	            return;
	        }
	    });
	}


    // ================= EMAIL VALIDATION =================
    const editEmail = document.getElementById('editEmail');
    if (editEmail) {
        editEmail.addEventListener('blur', function () {
            const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            this.style.borderColor = re.test(this.value) ? '#667eea' : '#dc3545';
        });
    }

    // ================= CONTACT NUMBER =================
    const editContact = document.getElementById('editContact');
    if (editContact) {
        editContact.addEventListener('input', function (e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length > 10) value = value.slice(0, 10);
            e.target.value = value;
        });
    }

    console.log('User Profile Page Loaded Successfully!');
});


// ================= MODAL FUNCTIONS =================
function openEditModal() {
    document.getElementById('editName').value =
        document.getElementById('fullName').textContent.trim();
    document.getElementById('editEmail').value =
        document.getElementById('email').textContent.trim();
    document.getElementById('editContact').value =
        document.getElementById('contactNo').textContent.trim();
    document.getElementById('editUsername').value =
        document.getElementById('username').textContent.replace('@', '').trim();

    document.getElementById('editModal').classList.add('active');
}

function closeEditModal() {
    document.getElementById('editModal').classList.remove('active');
}

function openPasswordModal() {
    document.getElementById('passwordModal').classList.add('active');
}

function closePasswordModal() {
    document.getElementById('passwordModal').classList.remove('active');
}


// ================= GLOBAL CLOSE HANDLERS =================
window.addEventListener('click', function (event) {
    if (event.target.classList && event.target.classList.contains('modal')) {
        event.target.classList.remove('active');
    }
});

document.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') {
        closeEditModal();
        closePasswordModal();
    }
});


// ================= SMOOTH SCROLL =================
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({ behavior: 'smooth' });
        }
    });
});

function showSuccessAlert(message) {
    const alertBox = document.createElement('div');
    alertBox.textContent = message;
    alertBox.style.position = 'fixed';
    alertBox.style.top = '20px';
    alertBox.style.right = '20px';
    alertBox.style.background = '#28a745';
    alertBox.style.color = '#fff';
    alertBox.style.padding = '14px 20px';
    alertBox.style.borderRadius = '8px';
    alertBox.style.zIndex = '9999';
    document.body.appendChild(alertBox);

    setTimeout(() => alertBox.remove(), 3000);
}
