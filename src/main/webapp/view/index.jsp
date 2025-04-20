<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" 
         import="jakarta.servlet.http.HttpSession" %>

<%
    // Try to get the existing session; if none exists, do NOT create one
    session = request.getSession(false);

    // We stored the User object under "user" in LoginServlet
    Object userObj = (session != null) ? session.getAttribute("user") : null;
    if (userObj == null) {
        // No logged‑in user found: send them back to login page
        response.sendRedirect(request.getContextPath() + "/view/login.jsp");
        return;  // stop processing the rest of index.jsp
    }

    // (Optionally) cast to your User type to grab details, e.g. username/email
    // model.User user = (model.User) userObj;
%>
<!DOCTYPE html>
<html>
<head>
<%-- Font Awesome --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
<meta charset="UTF-8">
<title>Home - ArticleSphere</title>
</head>
<body>
<%-- Navigation bar --%>
<nav>
    <div class="logo_container">
        <img src="${pageContext.request.contextPath}/assets/logo.jpg" alt="ArticleSphere Logo"/>
        <h4>ARTICLE SPHERE</h4>
    </div>
    <i class="fa-solid fa-bars menu_icon"></i>
    <ul class="nav_links">
        <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/view/about.jsp">About</a></li>
        <li><a href="${pageContext.request.contextPath}/view/contact.jsp">Contact Us</a></li>
    </ul>
    <a href="${pageContext.request.contextPath}/view/profile.jsp"><i class="fa-regular fa-user nav_icon"></i></a>
</nav>
<%-- This is where the header lies --%>
<header>
<img src="${pageContext.request.contextPath}/assets/logo.jpg"/>
<h1>ARTICLE SPHERE</h1>
<p class="hero_paragraph">Welcome to <strong>ArticleSphere</strong>, where anyone can share their stories and ideas with the world. Dive into a diverse collection of articles or <strong>sign</strong> in to publish your own today!</p>
<div class="search_container">
<input type="search" id="search" name="search" placeholder="Search"/>
<i class="fa-solid fa-magnifying-glass search_icon"></i>
</div>
</header>
<%-- This is where the main body which is the categories exists --%>
<main>
<h1>CATEGORIES</h1>
<div class="category_box">
<button>Category 1</button>
<button>Category 2</button>
<button>Category 3</button>
<button>Category 4</button>
<button>Category 5</button>
<button>Category 6</button>
<button>Category 7</button>
<button>Category 8</button>
</div>
</main>
<%-- This is the footer for the page --%>
<footer>
<div class='logo_text'>
<img class='footer_logo' src="${pageContext.request.contextPath}/assets/logo.jpg"/>
<p>ArticleSphere © 2025</p>
</div>
<div class='links'>
<h3><strong>Links</strong></h3>
<ul>
<li><a href="#">Home</a></li>
<li><a href="${pageContext.request.contextPath}view/about.jsp">About</a></li>
<li>C<a href="${pageContext.request.contextPath}view/contact.jsp">Contact</a></li>
</ul>
</div>
<div class='follow_us'>
<h3>Follow Us</h3>
<ul>
<li>Twitter | <a href="#">GitHub</a></li>
<li>Share your story! <a href="#">Post Now!</a></li>
</ul>
</div>
</footer>
</body>
</html>