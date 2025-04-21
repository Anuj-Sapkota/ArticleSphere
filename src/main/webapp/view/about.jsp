<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%-- Font Awesome --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/component/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/component/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/about.css">
    <script src="${pageContext.request.contextPath}/component/nav.js" defer></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - ArticleSphere</title>
</head>
<body>
    <%@ include file="../component/nav.jsp" %>

    <div class="content">
        <h1>ABOUT US</h1>
        <p class="intro">
            Welcome to ArticleSphere,<br>
            a platform where anyone can share their stories,<br>
            ideas, and knowledge with the world. Whether you're here to<br>
            read inspiring articles or publish your own, ArticleSphere is your<br>
            space to connect and create.
        </p>

        <hr>

        <h3>OUR PURPOSE</h3>
        <p>
            To empower everyone to express themselves through<br>
            writing and discover diverse perspectives from around the world.
        </p>

        <hr>

        <h3>WHO WE ARE</h3>
        <p>
            ArticleSphere was created by Group 2 from L2C7,<br>
            a team of passionate students dedicated to building a<br>
            user-friendly platform for article sharing. Meet the team:
        </p>

        <ul>
            <li>Anuj Sapkota</li>
            <li>Ajeshwori Adhikari</li>
            <li>Bardan G Neupane</li>
            <li>Rohisn Bhattarai</li>
            <li>Susan Bajgain</li>
        </ul>
    </div>

    <%@ include file="../component/footer.jsp" %>
</body>
</html>