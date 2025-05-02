<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" 
         import="jakarta.servlet.http.HttpSession"
         import="dao.UserDAO"
         import="model.User"
         import="java.sql.SQLException"
         import="javax.crypto.Mac"
         import="javax.crypto.spec.SecretKeySpec"
         import="java.util.Base64" %>

<%
//Get the current page name to highlight the active link
String currentPage = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
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
   <nav>
   <h1>Article Sphere</h1>
   <ul class="pages">
           <li><a href="${pageContext.request.contextPath}/view/index.jsp" class="<%= currentPage.equals("index.jsp") ? "active" : "" %>">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/view/about.jsp" class="<%= currentPage.equals("about.jsp") ? "active" : "" %>">About</a></li>
        <li><a href="${pageContext.request.contextPath}/view/contact.jsp" class="<%= currentPage.equals("contact.jsp") ? "active" : "" %>">Contact Us</a></li>
        <li><a href="${pageContext.request.contextPath}/view/category.jsp" class="<%= currentPage.equals("category.jsp") ? "active" : "" %>">Categories</a></li>
    </ul>
      <div class="nav-buttons">
            <button class="write-btn" onclick="window.location.href='Articlepublishing.jsp'">
                <i class="fa-regular fa-pen-to-square"></i>
                Write
            </button>
            <button class="icon-btn">
                <i class="fa-solid fa-bell"></i>
            </button>
            <div class="dropdown">
                <button class="profile-btn" id="profileBtn">B</button>
                <div class="dropdown-content" id="profileDropdown">
                    <a href="#">
                        <span class="menu-icon"><i class="fa-solid fa-user"></i></span>
                        Profile
                    </a>
                    <a href="#">
                        <span class="menu-icon"><i class="fa-solid fa-book"></i></span>
                        Create
                    </a>
                    <a href="#">
                        <span class="menu-icon"><i class="fa-solid fa-gear"></i></span>
                        Settings
                    </a>
                    <div class="divider"></div>
                    <a href="#">
                        <span class="menu-icon"><i class="fa-solid fa-right-from-bracket"></i></span>
                        Sign out
                    </a>
                </div>
            </div>
        </div>
   </nav>

    <%-- This is where the header lies --%>
    <header>
    <div class="logo_box">
  <div class="logo_title">
    <img src="${pageContext.request.contextPath}/assets/logo.jpg"/>
    <h1>ARTICLE SPHERE</h1>
  </div>
</div>

        <p class="hero_paragraph">Welcome to <strong>ArticleSphere</strong>, where anyone can share their stories and ideas with the world. Dive into a diverse collection of articles or <strong>sign</strong> in to publish your own today!</p>
        <div class="search_container">
            <input type="search" id="search" name="search" placeholder="Search"/>
            <i class="fa-solid fa-magnifying-glass search_icon"></i>
        </div>
    </header>

    <%-- This is where the main body which is the categories exists --%>
    <main>
    <div class='category_title'>
    <div class='line'></div> <h1>CATEGORIES</h1><div class='line'></div></div>
       
        <div class="category_box">
            <button>Category 1</button>
            <button>Category 2</button>
            <button>Category 3</button>
            <button>Category 4</button>
            <button>Category 5</button>
            <button>Category 6</button>
        </div>
    </main>

    <%-- This is the footer for the page --%>
    <%@ include file="../component/footer.jsp" %>
</body>
</html>