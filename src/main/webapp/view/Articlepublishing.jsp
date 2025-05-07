<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.CategoryDAO, java.util.List, model.Category, model.Article" %>
<% 
    // Get the current page name to highlight the active link
    String currentPage = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);

    // Get FirstName and LastName from the session
    String firstName = (String) session.getAttribute("firstname");
    String lastName = (String) session.getAttribute("lastname");
    String fullName = firstName + " " + lastName;
    String initials = "?"; 

    if (firstName != null && !firstName.trim().isEmpty() && lastName != null && !lastName.trim().isEmpty()) {
        String firstInitial = firstName.substring(0, 1).toUpperCase();
        String lastInitial = lastName.substring(0, 1).toUpperCase();
        initials = firstInitial + lastInitial; 
    } else if (firstName != null && !firstName.trim().isEmpty()) {
        initials = firstName.substring(0, 1).toUpperCase(); 
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Article</title>
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ArticlePublish.css">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="logo" onclick="window.location.href='index.jsp'">Article Sphere</div>
        <div class="search-container">
            <span class="search-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
            <input type="text" class="search-input" placeholder="Search">
        </div>
        <div class="nav-buttons">
            <button class="publish-btn" id="publishBtn">Publish</button>
            <button class="icon-btn" onclick="window.location.href='${pageContext.request.contextPath}/publishArticle'">
                <i class="fa-solid fa-ellipsis"></i>
            </button>
            <button class="icon-btn" onclick="navigateTo('notifications')">
                <i class="fa-solid fa-bell"></i>
            </button>
            <div class="dropdown">
                <button class="profile-btn" id="profileBtn"><%=initials %></button>
                <div class="dropdown-content" id="profileDropdown">
                    <a href="#" onclick="window.location.href='${pageContext.request.contextPath}/view/Profile.jsp'">
                        <span class="menu-icon"><i class="fa-solid fa-user"></i></span>Profile
                    </a>
                    <a href="#" onclick="navigateTo('stories')">
                        <span class="menu-icon"><i class="fa-solid fa-book"></i></span>Stories
                    </a>
                    <div class="divider"></div>
                    <a href="#" onclick="navigateTo('settings')">
                        <span class="menu-icon"><i class="fa-solid fa-gear"></i></span>Settings
                    </a>
                    <a href="${pageContext.request.contextPath}/view/logout.jsp" onclick="navigateTo('signout')">
                        <span class="menu-icon"><i class="fa-solid fa-right-from-bracket"></i></span>Sign out
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content - Article Editor -->
    <div class="main-content">
        <div class="formatting-toolbar">
            <button class="toolbar-btn" data-command="bold"><i class="fa-solid fa-bold"></i></button>
            <button class="toolbar-btn" data-command="italic"><i class="fa-solid fa-italic"></i></button>
            <button class="toolbar-btn" data-command="link"><i class="fa-solid fa-link"></i></button>
            <button class="toolbar-btn" data-command="image"><i class="fa-solid fa-image"></i></button>
        </div>
        <input type="text" class="article-title" id="articleTitle" name="title" placeholder="Title" value="<c:out value='${article.title}' default='' />">
        <div class="article-content" id="articleContent" contenteditable="true" placeholder="Tell your story...">
            <c:if test="${not empty article.content}">
                <c:out value="${article.content}" escapeXml="false" />
            </c:if>
        </div>
        <div id="sectionsContainer"></div>
        <button class="add-content-btn" id="addSectionBtn"><i class="fa-solid fa-plus"></i> Add section</button>
    </div>

    <!-- Publish Modal -->
    <div class="modal" id="publishModal">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/article" method="post">
                <input type="hidden" name="action" value="<c:choose><c:when test='${not empty article}'>update</c:when><c:otherwise>create</c:otherwise></c:choose>">
                <c:if test="${not empty article}">
                    <input type="hidden" name="articleId" value="${article.articleId}">
                </c:if>
                <input type="hidden" name="title" id="formTitle">
                <input type="hidden" name="content" id="formContent">
                <%
                    Integer userId = (Integer) session.getAttribute("userId");
                    if (userId == null) {
                        response.sendRedirect("login.jsp");
                        return;
                    }
                %>
                <input type="hidden" name="authorId" value="<%= userId %>">
                <div class="modal-header">
                    <div class="modal-title">Publish Article</div>
                    <button type="button" class="close-modal">×</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-label">Category</label>
                        <select name="categoryId" class="category-select" required>
                            <option value="">Select a category</option>
                            <c:forEach var="cat" items="${categories}">
                                <option value="${cat.categoryId}" <c:if test="${article.categoryId == cat.categoryId}">selected</c:if>>${cat.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="confirmPublish">Publish Now</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Notification -->
    <div class="notification" id="notification"></div>

    <script>
        // Navigation Functionality
        function navigateTo(page) {
            showNotification(`Navigating to ${page} page`, 'success');
        }

        // Profile Dropdown Functionality
        document.getElementById('profileBtn').addEventListener('click', function(event) {
            event.stopPropagation();
            const dropdown = document.getElementById('profileDropdown');
            dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
        });

        window.addEventListener('click', function(event) {
            const dropdown = document.getElementById('profileDropdown');
            if (dropdown && dropdown.style.display === 'block') {
                dropdown.style.display = 'none';
            }
        });

        // Show Publish Modal
        document.getElementById('publishBtn').addEventListener('click', function() {
            console.log('Publish button clicked'); // Debug log
            try {
                const title = document.getElementById('articleTitle').value;
                let content = document.getElementById('articleContent').innerHTML;

                // Minimal sanitization to remove editor-specific metadata
                content = content
                    .replace(/data-start="\d+" data-end="\d+" class=""/g, '') // Remove data attributes
                    .replace(/style="[^"]*"/g, '') // Remove inline styles
                    .replace(/<p>\s*<br>\s*<\/p>/g, '') // Remove empty paragraphs with <br>
                    .replace(/ /g, ' '); // Replace non-breaking spaces with regular spaces

                if (!title || !content.trim()) {
                    showNotification('Title and content are required', 'error');
                    return;
                }

                document.getElementById('formTitle').value = title;
                document.getElementById('formContent').value = content;
                console.log('Setting modal display to block'); // Debug log
                const modal = document.getElementById('publishModal');
                modal.style.display = 'block';
            } catch (error) {
                console.error('Error in publish button handler:', error);
                showNotification('An error occurred while publishing', 'error');
            }
        });

        // Close Modal
        document.querySelector('.close-modal').addEventListener('click', function() {
            console.log('Close modal clicked'); // Debug log
            document.getElementById('publishModal').style.display = 'none';
        });

        // Notification Function
        function showNotification(message, type) {
            console.log('Showing notification:', message, type); // Debug log
            const notification = document.getElementById('notification');
            notification.textContent = message;
            notification.className = `notification show ${type}`;
            setTimeout(() => {
                notification.className = 'notification';
            }, 3000);
        }
    </script>
</body>
</html>