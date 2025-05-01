<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--Font Awesome --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<meta charset="UTF-8">
<title>Login - ArticleSphere</title>
</head>
<body>

<div class="form_container">
<%--This is the header section for the title and the logo --%>
<header class="title_logo">
<img src="${pageContext.request.contextPath}/assets/logo.jpg" alt="logo">
<h1>WELCOME BACK! <br>READY TO GET STARTED?</h1>
</header>
<%--Display error if login fails --%>
<% if(request.getParameter("registration") != null) { %>
<p style="color: green;">Registration Successful! Please login.</p>
<%} %>

<% if(request.getAttribute("error") != null) { %>
<p style="color: red;"><%= request.getAttribute("error") %></p>
<%} %>

<%--This is the section where the form lies i.e. the fields and the create button --%>
<main>

    <div class="form_wrapper">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <input type="email" name="email" id="email" placeholder="Email" required>
            <input type="password" name="password" id="password" placeholder="Password" required>
            <div class='rememerme_forgotPW'>
            <div class="remember_me">
                <input type="checkbox" id="rememberMe" name="rememberMe">
                <label for="rememberMe">Remember me</label>
            </div>
            <p>Forgot Password?</p>
            </div>
            <button type="submit">LOGIN</button>
        </form>
</div>
</main>

<%--This is the button linked to register page --%>
<footer>
<div class='other_login'><p>Or login with</p>
<div class='other_login_icons'>
<img src="${pageContext.request.contextPath}/assets/googleIcon.png"/>
<img src="${pageContext.request.contextPath}/assets/facebookIcon.png"/>
<img src="${pageContext.request.contextPath}/assets/XIcon.png"/>
</div>
</div>
<div class='register_redirect'><p>Need an account?</p><button onclick="window.location.href='${pageContext.request.contextPath}/view/register.jsp'">Click Here</button>
</div>
</footer>
</div>

</body>
</html>