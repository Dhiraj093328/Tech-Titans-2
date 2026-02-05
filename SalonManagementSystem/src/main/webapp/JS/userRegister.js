// Add loading animation on form submit
document.getElementById('registrationForm').addEventListener('submit', function(e) {
    const btn = document.querySelector('.btn-register');
    btn.classList.add('loading');
    btn.innerHTML = '<span style="opacity: 0;">Processing...</span>';
    
    // For testing the popup without submitting, uncomment these lines:
    // e.preventDefault();
    // setTimeout(() => showPopup(), 1000);
});

// Show popup with confetti effect
function showPopup() {
    document.getElementById('successPopup').style.display = 'block';
    createConfetti();
}

// Create confetti animation
function createConfetti() {
    const colors = ['#667eea', '#764ba2', '#f093fb', '#48bb78', '#ffd700'];
    const popup = document.querySelector('.popup-content');
    
    for (let i = 0; i < 50; i++) {
        const confetti = document.createElement('div');
        confetti.className = 'confetti';
        confetti.style.left = Math.random() * 100 + '%';
        confetti.style.background = colors[Math.floor(Math.random() * colors.length)];
        confetti.style.animationDelay = Math.random() * 3 + 's';
        confetti.style.animationDuration = (Math.random() * 3 + 2) + 's';
        popup.appendChild(confetti);
        
        // Remove confetti after animation
        setTimeout(() => confetti.remove(), 5000);
    }
}

// Close popup and redirect to login page
function closePopup() {
    document.getElementById('successPopup').style.display = 'none';
    window.location.href = 'userLogin.html';
}

// Close popup when clicking outside the popup content
document.getElementById('successPopup').addEventListener('click', function(e) {
    if (e.target === this) {
        closePopup();
    }
});

// Check for success parameter in URL
const urlParams = new URLSearchParams(window.location.search);
if (urlParams.get('success') === 'true') {
    showPopup();
}

// Add floating animation to form inputs on focus/blur
const inputs = document.querySelectorAll('.form-control');
inputs.forEach(input => {
    input.addEventListener('focus', function() {
        this.parentElement.parentElement.style.transform = 'translateX(5px)';
    });
    
    input.addEventListener('blur', function() {
        this.parentElement.parentElement.style.transform = 'translateX(0)';
    });
});

// Prevent form resubmission on page refresh
if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
}