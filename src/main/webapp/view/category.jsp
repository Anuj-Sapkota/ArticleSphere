<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--Font Awesome --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/category.css">
<meta charset="UTF-8">
<title>Category - ArticleSphere</title>
</head>
<body>
 <div id="navbar">
        <div id="nav1">
            <i class="fa-solid fa-bars"></i>
        <img src="../image.png" alt="images">  
        </div>
        <div id="nav2">
            <i class="fa-solid fa-magnifying-glass"></i>
        <i class="fa-regular fa-user"></i>
        </div>
        
        
    </div>

    <div>
        <h1>CATEGORIES</h1>
        <h3>Browse articles by topic and find content that spark your interest.
            Click on a category to dive into a world of ideas tailored just for you!
        </h3>

        <div id="btns">
            <button id="Technology.btn">Technology</button>
            <button id="Health&Wellness.btn">Health & Wellness</button>
            <button id="Lifestyle.btn">Lifestyle</button>
            <button id="Arts&Culture.btn">Arts & Culture</button>
            <button id="Science&Nature.btn">Science & Nature</button>
            <button id="Bussiness&Finance.btn">Bussiness & Finance</button>
        </div>
    </div>
    <div id="Footer">
        <h5>ArticleSphere © 2025</h5>
        <a href="">Home |</a>
        <a href="">About |</a>
        <a href="">Contact </a>
        <h5>Want to write or comment ? Sign in now!</h5>
    </div>   
</body>
</html>