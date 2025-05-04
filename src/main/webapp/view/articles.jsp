<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.CategoryDAO, model.Category" %>
<%@ page import="dao.UserDAO, model.User" %>
<%@ page import="java.time.format.DateTimeFormatter, java.time.LocalDateTime" %>

<%
//Fetch author's full name
int authorId = ((model.Article) request.getAttribute("article")).getAuthorId();
UserDAO userDAO = new UserDAO(); // replace with your actual DAO class if named differently
User author = userDAO.getUserById(authorId);
String firstname = (author != null) ? author.getFirstName() : "Unknown Author";
String lastname = (author != null) ? author.getLastName() : "";
String fullname = firstname + " " + lastname;

LocalDateTime publishDate = ((model.Article) request.getAttribute("article")).getPublishDate();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE, MMMM d");
String formattedDate = publishDate.format(formatter);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Article - ArticleSphere</title>
    <!-- Font Awesome (required for nav.jsp icons) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Google Fonts for Roboto -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <!-- Link to nav.css for styling nav.jsp -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/component/nav.css">
    <!-- Link to nav.js for hamburger menu toggle in nav.jsp -->
    <script src="${pageContext.request.contextPath}/component/nav.js" defer></script>
    <!-- Index page CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/article.css">
</head>	
<body>
    <%@ include file="../component/nav.jsp" %>
    <div class="container">
        <header>
            <h1>${article.title}</h1>
            <%
                CategoryDAO categoryDAO = new CategoryDAO();
                int categoryId = ((model.Article) request.getAttribute("article")).getCategoryId();
                Category category = categoryDAO.getCategoryById(categoryId);
                String categoryName = (category != null) ? category.getCategoryName() : "Uncategorized";
            %>
            <p>By: <%= fullname %> | <%=formattedDate %> | Category: <%= categoryName %></p>
        </header>
        <main>
            <div class="content">
                ${article.content}
            </div>
            <div class="comments">
                <h1><strong>Comments</strong></h1>
                <div class="comment-input">
                    <input type="text" placeholder="Write a comment...">
                    <button>Post</button>
                </div>
            </div>
            <div class="view_comments">
                <button>Other comments</button>
                <i class="fa-solid fa-caret-down down_icon"></i>
                <div class="other_comments">
                    <div class="profile_name_date">
                        <img src="" alt="profile">
                        <div class="name_date">
                            <h1>John Doe</h1>
                            <h1>YYYY/MM/DD</h1>
                        </div>
                    </div>
                    <div class="comment_content">
                        lorem iahlksdaidjlk khakljdsasdiuh kauiydiujkasdg hakldbjasgiuh
                    </div>
                </div>
            </div>
        </main>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const viewCommentsBtn = document.querySelector('.view_comments button');
            const viewCommentsDiv = document.querySelector('.view_comments');
            viewCommentsBtn.addEventListener('click', function() {
                viewCommentsDiv.classList.toggle('show');
            });
        });
    </script>
</body>
</html>