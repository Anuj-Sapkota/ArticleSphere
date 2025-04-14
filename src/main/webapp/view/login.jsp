<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--Font Awesome --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/register.css">
<meta charset="UTF-8">
<title>Login - ArticleSphere</title>
</head>
<body>

<i class="fa-solid fa-xmark cross_mark"></i>

<div class="form_container">
<%--This is the header section for the title and the logo --%>
<header class="title_logo">
<img src="../assets/logo.jpg" alt="logo">
<h1>SIGN IN WITH EMAIL</h1>
</header>

<%--This is the section where the form lies i.e. the fields and the create button --%>
<main>
<form>
<input type="email" id="email" name="email" placeholder="Email" required>
<input type="password" id="password" name="password" placeholder="Password" required>
<button class="signin_button">SIGN IN</button>
</form>
</main>

<%--This is the button linked to login page --%>
<footer>
<button>NEED AN ACCOUNT?</button>
</footer>
</div>

</body>
</html>