<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" 
         import="jakarta.servlet.http.HttpSession"
         import="dao.UserDAO"
         import="model.User"
         import="java.sql.SQLException"
         import="javax.crypto.Mac"
         import="javax.crypto.spec.SecretKeySpec"
         import="java.util.Base64" %>
<%@ page import="
  java.util.List,
  model.Category
" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//Get the current page name to highlight the active link
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
    <meta charset="UTF-8">
    <title>Home - ArticleSphere</title>
    <!-- Font Awesome (required for nav.jsp icons) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Link to nav.css for styling nav.jsp -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/component/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/component/footer.css">
    <!-- Link to nav.js for hamburger menu toggle in nav.jsp -->
    <script src="${pageContext.request.contextPath}/component/nav.js" defer></script>
    <!-- Index page CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
</head>
<body>
    <!-- Include the Navigation Bar -->
    <%@ include file="../component/nav.jsp" %>
    <header>
        <div class="logo_box">
            <div class="logo_title">
                <img src="${pageContext.request.contextPath}/assets/logo.jpg"/>
                <h1>ARTICLE SPHERE</h1>
            </div>
        </div>
        <p class="hero_paragraph">Welcome to <strong>ArticleSphere</strong>, where anyone can share their stories and ideas with the world. Dive into a diverse collection of articles or <strong>sign</strong> in to publish your own today!</p>
        <div class="search_container">
            <form action="${pageContext.request.contextPath}/search" method="get">
                <input type="search" id="search" name="query" placeholder="Enter full article title and press Enter..." required/>
                <i class="fa-solid fa-magnifying-glass search_icon"></i>
            </form>
        </div>
    </header>
    <main>
        <div class="container">
            <!-- Category grid -->
            <div class="category_box">
                <c:if test="${empty categories}">
                    <p>No categories available.</p>
                </c:if>
                <c:forEach var="cat" items="${categories}">
                    <div class="category_card_link" onclick="location.href='${pageContext.request.contextPath}/articleList?categoryId=${cat.categoryId}'" style="cursor:pointer;">
    <div class="category_card">
        <h3>${cat.categoryName}</h3>
        <div class="card_overlay">
            <p>${cat.categoryDescription}</p>
        </div>
    </div>
</div>

                </c:forEach>
            </div>
        </div>
    </main>
    <%@ include file="../component/footer.jsp" %>
</body>
</html>