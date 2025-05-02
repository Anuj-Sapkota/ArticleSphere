// 1. Toggle dropdown menu
document.getElementById('profileBtn').addEventListener('click', function(event) {
    event.stopPropagation(); // Prevents closing immediately
    const dropdown = document.getElementById('profileDropdown');
    dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
});

// 2. Close dropdown when clicking elsewhere
window.addEventListener('click', function(event) {
    const dropdown = document.getElementById('profileDropdown');
    if (dropdown && dropdown.style.display === 'block') {
        dropdown.style.display = 'none';
    }
});

// 3. Handle 'More' button clicks
const moreButtons = document.querySelectorAll('.more-btn');
moreButtons.forEach(btn => {
    btn.addEventListener('click', function() {
        alert('More options menu would open here');
    });
});

// 4. Menu item selection (highlighting active menu item)
const menuItems = document.querySelectorAll('.menu-item');
menuItems.forEach(item => {
    item.addEventListener('click', function() {
        menuItems.forEach(i => i.classList.remove('active'));
        this.classList.add('active');
    });
});

// Make sure the JavaScript runs after the DOM is fully loaded
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM fully loaded, all scripts initialized');
});