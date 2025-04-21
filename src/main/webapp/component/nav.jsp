<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    // Get the current page name to highlight the active link
    String currentPage = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
%>
<nav>

    <div class="logo_container">
        <img src="${pageContext.request.contextPath}/assets/logo.jpg" alt="ArticleSphere Logo"/>
        <h4>ARTICLE SPHERE</h4>
    </div>
    <i class="fa-solid fa-bars menu_icon"></i>
    <ul class="nav_links">
        <li><a href="${pageContext.request.contextPath}/view/index.jsp" class="<%= currentPage.equals("index.jsp") ? "active" : "" %>">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/view/about.jsp" class="<%= currentPage.equals("about.jsp") ? "active" : "" %>">About</a></li>
        <li><a href="${pageContext.request.contextPath}/view/contact.jsp" class="<%= currentPage.equals("contact.jsp") ? "active" : "" %>">Contact Us</a></li>
        <li><a href="${pageContext.request.contextPath}/view/category.jsp" class="<%= currentPage.equals("category.jsp") ? "active" : "" %>">Categories</a></li>
    </ul>
    <div class="profile_logout">
        <a href="${pageContext.request.contextPath}/view/profile.jsp"><i class="fa-regular fa-user nav_icon"></i></a>
        <a href="${pageContext.request.contextPath}/view/logout.jsp"><i class="fa fa-sign-out nav_icon" aria-hidden="true"></i></a>
    </div>
</nav>