// Password Toggle Functionality
const togglePassword = document.getElementById('togglePassword');
const passwordInput = document.getElementById('password');

if (togglePassword) {
    togglePassword.addEventListener('click', function() {
        // Toggle password visibility
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        
        // Toggle icon
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
    });
}

// Add loading animation on form submit
document.getElementById('loginForm').addEventListener('submit', function(e) {
    const btn = document.querySelector('.btn-login');
    btn.classList.add('loading');
    btn.innerHTML = '<span style="opacity: 0;">Logging in...</span>';
    
    // For testing the popup without submitting, uncomment these lines:
    // e.preventDefault();
    // setTimeout(() => showSuccessPopup(), 1000);
});

// Show success popup
function showSuccessPopup() {
    document.getElementById('successPopup').style.display = 'block';
    // Auto redirect after 2 seconds
    setTimeout(() => {
        // Redirect based on role or to dashboard
        window.location.href = 'dashboard.html';
    }, 2000);
}

// Check for error parameter in URL
const urlParams = new URLSearchParams(window.location.search);
if (urlParams.get('error') === 'true') {
    const errorMessage = document.getElementById('errorMessage');
    const errorText = document.getElementById('errorText');
    
    // Set custom error message if provided
    const errorMsg = urlParams.get('message');
    if (errorMsg) {
        errorText.textContent = decodeURIComponent(errorMsg);
    }
    
    errorMessage.style.display = 'flex';
}

// Check for success login parameter
if (urlParams.get('login') === 'success') {
    showSuccessPopup();
}

// Add floating animation to form inputs on focus/blur
const inputs = document.querySelectorAll('.form-control, .form-select');
inputs.forEach(input => {
    input.addEventListener('focus', function() {
        this.parentElement.parentElement.style.transform = 'translateX(5px)';
    });
    
    input.addEventListener('blur', function() {
        this.parentElement.parentElement.style.transform = 'translateX(0)';
    });
});

// Form validation
document.getElementById('loginForm').addEventListener('submit', function(e) {
    const role = document.querySelector('select[name="role"]').value;
    const username = document.querySelector('input[name="username"]').value.trim();
    const password = document.querySelector('input[name="password"]').value;
    
    // Basic validation
    if (!role) {
        e.preventDefault();
        showError('Please select a role');
        return false;
    }
    
    if (!username) {
        e.preventDefault();
        showError('Please enter your username');
        return false;
    }
    
    if (!password) {
        e.preventDefault();
        showError('Please enter your password');
        return false;
    }
});

// Show custom error message
function showError(message) {
    const errorMessage = document.getElementById('errorMessage');
    const errorText = document.getElementById('errorText');
    errorText.textContent = message;
    errorMessage.style.display = 'flex';
    
    // Remove loading state from button
    const btn = document.querySelector('.btn-login');
    btn.classList.remove('loading');
    btn.innerHTML = '<i class="fas fa-sign-in-alt"></i> Login';
    
    // Auto hide after 5 seconds
    setTimeout(() => {
        errorMessage.style.display = 'none';
    }, 5000);
}

// Hide error message when user starts typing
inputs.forEach(input => {
    input.addEventListener('input', function() {
        const errorMessage = document.getElementById('errorMessage');
        if (errorMessage.style.display === 'flex') {
            errorMessage.style.display = 'none';
        }
    });
});

// Prevent form resubmission on page refresh
if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
}