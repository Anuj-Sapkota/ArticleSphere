<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.ArticleDAO, java.util.List, model.Article" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/component/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/component/footer.css">
</head>
<body>
 <!-- Navigation Bar -->
   <%@ include file="../component/nav.jsp" %>
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
                        <div class="mini-avatar" id="miniUserInitial"><%= initials %></div>
                        <span id="miniUsername"><%= fullName %></span>
                    </div>
                </div>
                
                <h2 class="list-title">Reading list</h2>
                
                
                
                <div class="section-title">Your Articles</div>
                <div class="content-list" id="articles-container">
                    <%
                        Integer userId = (Integer) session.getAttribute("userId");
                        if (userId != null) {
                            ArticleDAO articleDAO = new ArticleDAO();
                            List<Article> articles = articleDAO.getArticlesByAuthor(userId);
                            if (articles != null && !articles.isEmpty()) {
                                for (Article article : articles) {
                    %>
                                    <div class="content-item">
                                        <a href="${pageContext.request.contextPath}/article?action=view&id=<%= article.getArticleId() %>"><%= article.getTitle() %></a>
                                        <div class="article-actions">
                                            <a style="background:blue; border:none; color:white; cursor:pointer; padding:0.2rem 0.8rem;;" href="${pageContext.request.contextPath}/article?action=update&id=<%= article.getArticleId() %>">Edit</a> |
                                            <form action="${pageContext.request.contextPath}/article" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this article?');">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id" value="<%= article.getArticleId() %>">
                                                <button type="submit" style="background:red; border:none; color:white; cursor:pointer; padding:0.2rem 0.8rem;;">Delete</button>
                                            </form>
                                        </div>
                                    </div>
                    <%
                                }
                            } else {
                    %>
                                <div class="content-item">No articles found.</div>
                    <%
                            }
                        } else {
                    %>
                            <div class="content-item">Please log in to see your articles.</div>
                    <%
                        }
                    %>
                </div>
                
                
                <div class="section-title">Your Comments</div>
                <div class="content-list" id="comments-container">
                    <!-- Comments will be populated dynamically -->
                    <div class="content-item">Comment 1</div>
                </div>
                
            </div>
            
            <!-- User Info Sidebar -->
            <div class="user-info">
                <div class="user-profile">
                    <div class="user-avatar" id="userAvatar"><%= initials %></div>
                    <div class="user-name" id="sidebarUsername"><%= fullName %></div>
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