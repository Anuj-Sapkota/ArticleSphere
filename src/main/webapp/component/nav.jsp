<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    // Get the current page name to highlight the active link
    String currentPage = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
%>
<nav>
   <h1>Article Sphere</h1>
   <ul class="pages">
           <li><a href="${pageContext.request.contextPath}/home" class="<%= currentPage.equals("index.jsp") ? "active" : "" %>">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/view/about.jsp" class="<%= currentPage.equals("about.jsp") ? "active" : "" %>">About</a></li>
        <li><a href="${pageContext.request.contextPath}/view/contact.jsp" class="<%= currentPage.equals("contact.jsp") ? "active" : "" %>">Contact Us</a></li>
        <li><a href="${pageContext.request.contextPath}/view/articleList.jsp" class="<%= currentPage.equals("articleList.jsp") ? "active" : "" %>">Articles</a></li>
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
                    <a href="#">
                        <span class="menu-icon"><i class="fa-solid fa-right-from-bracket"></i></span>
                        Sign out
                    </a>
                </div>
            </div>
        </div>
   </nav>