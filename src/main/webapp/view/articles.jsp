<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div class='container'>
<header>
<h1>The Joy of Morning Walks</h1>
<p>By John Doe | March 2025</p>
</header>
<main>
<div class='content'>
<strong>Introduction</strong><br>
Starting your day with a morning walk can be a game-changer. It’s a simple habit that clears your mind, boosts your energy, and sets a positive tone for the hours ahead. Whether you’re strolling through a park or just around your neighborhood, the benefits are undeniable.<br>
<strong>Main Content</strong><br>
Fresh Air: Breathing in the crisp morning air wakes up your senses and helps you feel more alert.<br>
Exercise: A light walk gets your blood flowing without the intensity of a workout, making it perfect for all fitness levels.<br>
Mental Clarity: Walking gives you time to think, plan your day, or simply enjoy a moment of peace before the hustle begins.<br>
<strong>Conclusion</strong><br>
Morning walks are an easy way to invest in your well-being. They don’t require special equipment or much time—just a willingness to step outside. Try it for a week, and you might find yourself hooked on this refreshing routine.
</div>
<div class="comments">
<h1><strong>Comments</strong></h1>
<div class="comment-input">
<input type="text" placeholder="Write a comment...">
<button>Post</button>
</div>
</div>
<div class='view_comments'>
<button>Other comments</button>
<i class="fa-solid fa-caret-down down_icon"></i>
<div class='other_comments'>
<div class='profile_name_date'>
<img src="" alt="profile">
<div class="name_date">
<h1>John Doe</h1>
<h1>YYYY/MM/DD</h1>
</div>
</div>
<div class='comment_content'>
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