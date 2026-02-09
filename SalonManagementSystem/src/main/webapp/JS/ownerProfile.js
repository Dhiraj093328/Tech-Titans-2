// ================= WAIT FOR DOM =================
document.addEventListener('DOMContentLoaded', function () {

    console.log('Owner Profile JS Loaded ✅');

    // ================= PROFILE PHOTO PREVIEW =================
    const photoInput = document.getElementById('photoInput');
    if (photoInput) {
        photoInput.addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (!file) return;

            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('profilePhoto').src = e.target.result;
            };
            reader.readAsDataURL(file);
        });
    }
});


// ================= MODAL FUNCTIONS =================
function openEditModal() {

    document.getElementById('editOwnerName').value =
        document.getElementById('displayOwnerName').textContent.trim();

    document.getElementById('editShopName').value =
        document.getElementById('displayShopName').textContent.trim();

    document.getElementById('editEmail').value =
        document.getElementById('displayEmail').textContent.trim();

    document.getElementById('editContact').value =
        document.getElementById('displayContact').textContent.trim();

    document.getElementById('editUsername').value =
        document.getElementById('displayUsername').textContent.trim();

    document.getElementById('editOpeningTime').value =
        document.getElementById('displayOpeningTime').textContent.trim().substring(0,5);

    document.getElementById('editClosingTime').value =
        document.getElementById('displayClosingTime').textContent.trim().substring(0,5);

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
    if (event.target.classList.contains('modal')) {
        event.target.classList.remove('active');
    }
});

document.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') {
        closeEditModal();
        closePasswordModal();
    }
});

// ================= ALERT =================
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
