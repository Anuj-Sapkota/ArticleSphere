<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--Font Awesome --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/component/nav.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/component/footer.css">
 <script src="${pageContext.request.contextPath}/component/nav.js" defer></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/category.css">
  <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Category - ArticleSphere</title>
</head>
<body>
<!--  <div id="navbar">
        <div id="nav1">
            <i class="fa-solid fa-bars"></i>
        <img src="../image.png" alt="images">  
        </div>
        <div id="nav2">
            <i class="fa-solid fa-magnifying-glass"></i>
        <i class="fa-regular fa-user"></i>
        </div>
        
        
    </div>
    -->
    
  <!-- Include the Navigation Bar -->
    <%@ include file="../component/nav.jsp" %>
    <div>
        <h1>CATEGORIES</h1>
        <h3>Browse articles by topic and find content that spark your interest.
            Click on a category to dive into a world of ideas tailored just for you!
        </h3>

        <div id="btns">
            <button id="Technology.btn">Technology</button>
            <button id="Health&Wellness.btn">Health & Wellness</button>
            <button id="Lifestyle.btn">Lifestyle</button>
            <button id="Arts&Culture.btn">Arts & Culture</button>
            <button id="Science&Nature.btn">Science & Nature</button>
            <button id="Bussiness&Finance.btn">Bussiness & Finance</button>
        </div>
    </div>
        <%@ include file="../component/footer.jsp" %>

</body>
</html>