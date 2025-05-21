<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    // Retrieve currentPage from request attribute
    String thisPage = (String) request.getAttribute("currentPage");
    if (thisPage == null) {
    	thisPage = "";
    }
%>
<footer>
    <div class='text_logo'>
    <h1>Article Sphere</h1>
    <p>ArticleSphere © 2025</p>
    </div>
    <div class='other_pages'>
    <h2>Links</h2>
    <p><a href="${pageContext.request.contextPath}/home">Home</a></p>
    <p><a href="${pageContext.request.contextPath}/view/about.jsp">About</a></p>
    <p><a href="${pageContext.request.contextPath}/view/contact.jsp">Contact</a></p>
    </div>
    <div class='newsletter'>
    <input type='email' placeholder='Enter your email'>
    <button>Subscribe</button>
    </div>
</footer>