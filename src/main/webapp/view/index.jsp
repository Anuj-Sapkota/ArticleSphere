<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" 
         import="jakarta.servlet.http.HttpSession"
         import="dao.UserDAO"
         import="model.User"
         import="java.sql.SQLException"
         import="javax.crypto.Mac"
         import="javax.crypto.spec.SecretKeySpec"
         import="java.util.Base64" %>

<%
    session = request.getSession(false);
    Object userObj = (session != null) ? session.getAttribute("user") : null;

    if (userObj == null) {
        String userToken = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userToken")) {
                    userToken = cookie.getValue();
                    break;
                }
            }
        }

        if (userToken != null) {
            try {
                // Split userToken into userId and signature
                String[] parts = userToken.split(":");
                if (parts.length != 2) {
                    throw new Exception("Invalid userToken format");
                }
                String userId = parts[0];
                String signature = parts[1];

                // Verify the signature
                String expectedSignature = null;
                String SECRET_KEY = "!)@(#*$&%^";
                Mac mac = Mac.getInstance("HmacSHA256");
                SecretKeySpec secretKeySpec = new SecretKeySpec(SECRET_KEY.getBytes(), "HmacSHA256");
                mac.init(secretKeySpec);
                byte[] hmacBytes = mac.doFinal(userId.getBytes());
                expectedSignature = Base64.getEncoder().encodeToString(hmacBytes);

                if (!signature.equals(expectedSignature)) {
                    throw new Exception("Invalid userToken signature");
                }

                // Fetch user from database using userId
                UserDAO userDAO = new UserDAO();
                User user = userDAO.getUserById(Integer.parseInt(userId));
                if (user != null) {
                    session = request.getSession(true);
                    session.setMaxInactiveInterval(60 * 30);
                    session.setAttribute("user", user);
                    session.setAttribute("userId", user.getUserId());
                    userObj = user;
                }
            } catch (Exception e) {
                response.sendRedirect(request.getContextPath() + "/view/login.jsp?error=" + e.getMessage());
                return;
            }
        }

        if (userObj == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }
    }
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
        <li><a href="${pageContext.request.contextPath}/view/index.jsp">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/view/about.jsp">About</a></li>
        <li><a href="${pageContext.request.contextPath}/view/contact.jsp">Contact Us</a></li>
    </ul>
    <div class='profile_logout'>
        <a href="${pageContext.request.contextPath}/view/profile.jsp"><i class="fa-regular fa-user nav_icon"></i></a>
        <a href="${pageContext.request.contextPath}/view/logout.jsp"><i class="fa fa-sign-out nav_icon" aria-hidden="true"></i></a>
    </div>
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
<li><a href="${pageContext.request.contextPath}/view/index.jsp">Home</a></li>
<li><a href="${pageContext.request.contextPath}/view/about.jsp">About</a></li>
<li><a href="${pageContext.request.contextPath}/view/contact.jsp">Contact</a></li>
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