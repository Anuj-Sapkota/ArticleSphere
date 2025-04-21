<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    // Retrieve currentPage from request attribute
    String thisPage = (String) request.getAttribute("currentPage");
    if (thisPage == null) {
    	thisPage = "";
    }
%>
<footer>
    <div class="logo_text">
        <img class="footer_logo" src="${pageContext.request.contextPath}/assets/logo.jpg" alt="ArticleSphere Logo"/>
        <p>ArticleSphere © 2025</p>
    </div>
    <div class="links">
        <h3><strong>Links</strong></h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/view/index.jsp" class="<%= thisPage.equals("index.jsp") ? "active" : "" %>">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/view/about.jsp" class="<%= thisPage.equals("about.jsp") ? "active" : "" %>">About</a></li>
            <li><a href="${pageContext.request.contextPath}/view/contact.jsp" class="<%= thisPage.equals("contact.jsp") ? "active" : "" %>">Contact</a></li>
        </ul>
    </div>
    <div class="follow_us">
        <h3>Follow Us</h3>
        <ul>
            <li>Twitter | <a href="#">GitHub</a></li>
            <li>Share your story! <a href="#">Post Now!</a></li>
        </ul>
    </div>
</footer>