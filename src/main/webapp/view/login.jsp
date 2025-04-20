<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--Font Awesome --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
<meta charset="UTF-8">
<title>Login - ArticleSphere</title>
</head>
<body>

<div class="form_container">
<%--This is the header section for the title and the logo --%>
<header class="title_logo">
<img src="${pageContext.request.contextPath}/assets/logo.jpg" alt="logo">
<h1>SIGN IN WITH EMAIL</h1>
</header>
<%--Display error if login fails --%>
<% if(request.getParameter("registration") != null) { %>
<p style="color: green;">Registration Successful! Please login.</p>
<%} %>

<% if(request.getParameter("error") != null) { %>
<p style="color: red;"><%= request.getAttribute("error") %></p>
<%} %>
<%= request.getAttribute("error") %>


<%--This is the section where the form lies i.e. the fields and the create button --%>
<main>
<form action="${pageContext.request.contextPath}/login" method='POST'>
<input type="email" id="email" name="email" placeholder="Email" required>
<input type="password" id="password" name="password" placeholder="Password" required>
<button type="submit" class="signin_button">SIGN IN</button>
</form>
</main>

<%--This is the button linked to login page --%>
<footer>
<button onclick="window.location.href='${pageContext.request.contextPath}/register'">NEED AN ACCOUNT?</button>
</footer>
</div>

</body>
</html>