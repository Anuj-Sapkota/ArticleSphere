<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/profile.css">

</head>
<body>

 <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="logo">Article Sphere</div>
        
        <div class="search-container">
            <span class="search-icon">
                <i class="fa-solid fa-magnifying-glass"></i>
            </span>
            <input type="text" class="search-input" placeholder="Search">
        </div>
        
        <div class="nav-buttons">
            <button class="write-btn" onclick="window.location.href='Articlepublishing.jsp'">
                <i class="fa-regular fa-pen-to-square"></i>
                Write
            </button>
            <button class="icon-btn">
                <i class="fa-solid fa-bell"></i>
            </button>
            <div class="dropdown">
                <button class="profile-btn" id="profileBtn">B</button>
                <div class="dropdown-content" id="profileDropdown">
                    <a href="#">
                        <span class="menu-icon"><i class="fa-solid fa-user"></i></span>
                        Profile
                    </a>
                    <a href="#">
                        <span class="menu-icon"><i class="fa-solid fa-book"></i></span>
                        Create
                    </a>
                    <a href="#">
                        <span class="menu-icon"><i class="fa-solid fa-gear"></i></span>
                        Settings
                    </a>
                    <div class="divider"></div>
                    <a href="#">
                        <span class="menu-icon"><i class="fa-solid fa-right-from-bracket"></i></span>
                        Sign out
                    </a>
                </div>
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="main-content">
        <!-- Profile Header -->
        <div class="profile-header">
            <div class="profile-left">
                <div class="profile-content">
                    <div class="profile-name" id="user-name">User Profile</div>
                    <div class="profile-bio" id="user-bio"></div>
                </div>
                <div class="divider"></div>
                <div class="menu-options">
                    <div class="menu-item active">Home</div>
                    <div class="menu-item">About</div>
                </div>
            </div>
            <div class="profile-actions">
                <button class="more-btn">
                    <i class="fa-solid fa-ellipsis"></i>
                </button>
            </div>
        </div>
        
        <!-- Profile Content -->
        <div class="profile-details">
            <!-- Reading List Section -->
            <div class="reading-list">
                <div class="list-header">
                    <div class="user-mini">
                        <div class="mini-avatar" id="miniUserInitial">U</div>
                        <span id="miniUsername">Username</span>
                    </div>
                </div>
                
                <h2 class="list-title">Reading list</h2>
                
                <div class="list-content">
                    <i class="fa-solid fa-lock"></i>
                    No stories
                    <div class="list-actions">
                        <button class="more-btn">
                            <i class="fa-solid fa-ellipsis"></i>
                        </button>
                    </div>
                </div>
                
                <div class="section-title">YOUR ARTICLES</div>
                <div class="content-list" id="articles-container">
                    <!-- Articles will be populated dynamically -->
                    <div class="content-item">Article 1</div>
                    <div class="content-item">Article 2</div>
                    <div class="content-item">Article 3</div>
                </div>
                <div class="view-more">
                    View More
                    <span class="arrow-down"></span>
                </div>
                
                <div class="section-title">YOUR COMMENTS</div>
                <div class="content-list" id="comments-container">
                    <!-- Comments will be populated dynamically -->
                    <div class="content-item">Comment 1</div>
                </div>
                <div class="view-more">
                    View More
                    <span class="arrow-down"></span>
                </div>
            </div>
            
            <!-- User Info Sidebar -->
            <div class="user-info">
                <div class="user-profile">
                    <div class="user-avatar" id="userAvatar">U</div>
                    <div class="user-name" id="sidebarUsername">Username</div>
                    <div class="edit-profile">Edit profile</div>
                </div>
            </div>
        </div>
    </div>

<!-- Inline JavaScript instead of external file -->
<script>
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
</script>
</body>
</html>