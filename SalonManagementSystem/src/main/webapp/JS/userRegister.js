// Form submit: show loading
document.getElementById('registrationForm').addEventListener('submit', function () {
    const btn = document.querySelector('.btn-register');
    btn.classList.add('loading');
});

// Show popup (success or error)
function showPopup(message, isSuccess) {
    const popup = document.getElementById('popup');
    const popupMessage = document.getElementById('popupMessage');
    const popupIcon = document.getElementById('popupIcon');

    popupMessage.textContent = message;

    if (isSuccess) {
        popupIcon.innerHTML = '<i class="fas fa-check"></i>';
        popupIcon.style.color = '#28a745';
    } else {
        popupIcon.innerHTML = '<i class="fas fa-times"></i>';
        popupIcon.style.color = '#dc3545';
    }

    popup.style.display = 'flex';

    // Auto redirect to login if success
    if (isSuccess) {
        setTimeout(() => {
            window.location.href = 'userLogin.jsp';
        }, 3000);
    }
}

// Close popup manually
document.getElementById('closePopup').addEventListener('click', function () {
    const popup = document.getElementById('popup');
    popup.style.display = 'none';
    // Redirect only if success
    const message = document.getElementById('popupMessage').textContent;
    if (message.includes('Successfully')) {
        window.location.href = 'userLogin.jsp';
    }
});

// Show popup based on URL parameters
const urlParams = new URLSearchParams(window.location.search);

if (urlParams.get('success') === 'true') {
    showPopup('Account Created Successfully!', true);
} else if (urlParams.get('error') === 'true') {
    showPopup('Registration Failed! Please try again.', false);
}

// Prevent form resubmission on refresh
if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.pathname);
}

// Input focus animation
document.querySelectorAll('.form-control').forEach(input => {
    input.addEventListener('focus', function () {
        const group = this.closest('.input-group');
        if (group) group.style.transform = 'translateX(5px)';
    });
    input.addEventListener('blur', function () {
        const group = this.closest('.input-group');
        if (group) group.style.transform = 'translateX(0)';
    });
});
