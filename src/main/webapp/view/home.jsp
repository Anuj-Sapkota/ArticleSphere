<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--Font Awesome --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/home.css">
<meta charset="UTF-8">
<title>Home - ArticleSphere</title>
</head>
<body>
<%--This is where the navigation bar lies --%>
<nav>
<i class="fa-solid fa-bars nav_icon"></i>
<i class="fa-solid fa-user nav_icon"></i>
</nav>
<%--This is where the header lies --%>
<header>
<img src="../assets/logo.jpg"/>
<h1>ARTICLE SPHERE</h1>
<p class="hero_paragraph">Welcome to <strong>ArticleSphere</strong>, where anyone can share their stories and ideas with the world. Dive into a diverse collection of articles or <strong>sign</strong> in to publish your own today!</p>
<input type="search" id="search" name="search" placeholder="Search"/>
<i class="fa-solid fa-magnifying-glass"></i>
</header>

<%--This is where the main body which is the categories exists --%>
<main>
<h1>CATEGORIES</h1>
<div class="category_box">
<div>Category 1</div>
<div>Category 1</div>
<div>Category 1</div>
<div>Category 1</div>
<div>Category 1</div>
<div>Category 1</div>
</div>
</main>
<%--This is the footer for the page --%>
<footer>
<div class="footer_container">
<div>
<img src="../assets/logo.jpg"/>
<p>ArticleSphere © 2025</p>
</div>
<div>
<h3><strong>Links</strong></h3>
<ul>
<li>Home</li>
<li>About</li>
<li>Contact</li>
</ul>
</div>
<div>
<h3>Follow Us</h3>
<ul>
<li>Twitter | <a href="#">GitHub</a></li>
<li>Share your story! <a href="#">Sign In</a></li>
</ul>
</div>

</div>

</footer>
</body>
</html>