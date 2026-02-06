// Form submit: show loading
document.getElementById('registrationForm').addEventListener('submit', function () {
    const btn = document.querySelector('.btn-register');
    btn.classList.add('loading');
});

// Show success popup
function showSuccessPopup() {
    const popup = document.getElementById('successPopup');
    if (popup) popup.style.display = 'flex';
}

// Close popup manually and redirect
document.getElementById('closePopup').addEventListener('click', function () {
    const popup = document.getElementById('successPopup');
    popup.style.display = 'none';
    window.location.href = 'userLogin.jsp';
});

// Auto popup if registration successful
const urlParams = new URLSearchParams(window.location.search);
if (urlParams.get('success') === 'true') {
    showSuccessPopup();

    // Auto redirect after 3s
    setTimeout(() => {
        window.location.href = 'userLogin.jsp';
    }, 3000);
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
