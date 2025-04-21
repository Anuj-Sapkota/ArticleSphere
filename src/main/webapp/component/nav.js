document.addEventListener('DOMContentLoaded', () => {
    const menuIcon = document.querySelector('.menu_icon');
    const navLinks = document.querySelector('.nav_links');

    menuIcon.addEventListener('click', () => {
        navLinks.classList.toggle('active');
    });
});