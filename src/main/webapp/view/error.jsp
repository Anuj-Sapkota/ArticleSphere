<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error - ArticleSphere</title>
    <!-- Font Awesome (required for nav.jsp icons) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Link to nav.css for styling nav.jsp -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/component/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/component/footer.css">
    <!-- Index page CSS -->
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/error.css">
</head>
<body>
    <%@ include file="../component/nav.jsp" %>
    <div class="container">
        <header>
            <h1>Article Not Found</h1>
            <p>No article found with the title "<%= java.net.URLDecoder.decode(request.getParameter("query"), "UTF-8") %>".</p>
        </header>
        <main>
        <h1>Search another article instead</h1>
        <div class="search_container">
            <form action="${pageContext.request.contextPath}/search" method="get">
                <input type="search" id="search" name="query" placeholder="Enter full article title and press Enter..." required/>
                <i class="fa-solid fa-magnifying-glass search_icon"></i>
            </form>
        </div>
        </main>
    </div>
    <%@ include file="../component/footer.jsp" %>
</body>
</html>