<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    // Get the current page name to highlight the active link
    String currentPage = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);

    // Get FirstName and LastName from the session
    String firstName = (String) session.getAttribute("firstname");
    String lastName = (String) session.getAttribute("lastname");
    String fullName = firstName + " " + lastName;
    String initials = "?"; 

    if (firstName != null && !firstName.trim().isEmpty() && lastName != null && !lastName.trim().isEmpty()) {
        String firstInitial = firstName.substring(0, 1).toUpperCase();
        String lastInitial = lastName.substring(0, 1).toUpperCase();
        initials = firstInitial + lastInitial; 
    } else if (firstName != null && !firstName.trim().isEmpty()) {
        initials = firstName.substring(0, 1).toUpperCase(); 
    }
%>
<nav>
   <h1>Article Sphere</h1>
   <div class="search_and_icon">
   <input type="search" id="search_bar" placeholder="Search">
    <i class="fa-solid fa-magnifying-glass mag_glass"></i></div>
   
   <ul class="pages">
       <li><a href="${pageContext.request.contextPath}/home" class="<%= currentPage.equals("index.jsp") ? "active" : "" %>">Home</a></li>
       <li><a href="${pageContext.request.contextPath}/view/about.jsp" class="<%= currentPage.equals("about.jsp") ? "active" : "" %>">About</a></li>
       <li><a href="${pageContext.request.contextPath}/view/contact.jsp" class="<%= currentPage.equals("contact.jsp") ? "active" : "" %>">Contact Us</a></li>
       <li><a href="${pageContext.request.contextPath}/article?action=list" class="<%= currentPage.equals("articleList.jsp") ? "active" : "" %>">Articles</a></li>
   </ul>
   <div class="nav-buttons">
       <button class="write-btn" onclick="window.location.href='${pageContext.request.contextPath}/publishArticle'">
           <i class="fa-regular fa-pen-to-square"></i>
           Write
       </button>
       <button class="icon-btn">
           <i class="fa-solid fa-bell"></i>
       </button>
       <div class="dropdown">
           <button class="profile-btn" id="profileBtn"><%= initials %></button>
           <div class="dropdown-content" id="profileDropdown">
               <a href="${pageContext.request.contextPath}/view/Profile.jsp">
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
               <a href="${pageContext.request.contextPath}/view/logout.jsp">
                   <span class="menu-icon"><i class="fa-solid fa-right-from-bracket"></i></span>
                   Sign out
               </a>
           </div>
       </div>
   </div>
</nav>