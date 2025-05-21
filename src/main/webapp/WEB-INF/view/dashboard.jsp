<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard – ArticleSphere</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
  <!-- SIDEBAR -->
  <aside class="sidebar">
    <div class="logo">ArticleSphere</div>
    <nav>
      <a href="${pageContext.request.contextPath}/dashboard" class="active"><i class="fas fa-tachometer-alt"></i>Dashboard</a>
      <a href="${pageContext.request.contextPath}/category"><i class="fas fa-th-list"></i> Categories</a>
    </nav>
  </aside>

  <!-- MAIN CONTENT -->
  <main class="main-content">
    <div class="container">
      <div class="header">
        <h1>Admin Dashboard</h1>
        <a href="${pageContext.request.contextPath}/view/logout.jsp" class="btn logout-btn">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a>
      </div>

      <!-- Stats Cards -->
      <div class="stats">
        <div class="stat-card">
          <h3>Total Users</h3>
          <p>${totalUsers}</p>
        </div>
        <div class="stat-card">
          <h3>Total Articles</h3>
          <p>${totalArticles}</p>
        </div>
      </div>

      <!-- Articles Table -->
      <h2>All Articles</h2>
      <table class="data-table">
        <thead>
          <tr>
            <th>Article Name</th>
            <th>Created By</th>
            <th>Created Date</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="articleData" items="${articleDataList}">
            <tr>
              <td>${articleData.article.title}</td>
              <td>${articleData.authorFullName}</td>
              <td><fmt:formatDate value="${articleData.publishDateAsDate}" pattern="yyyy-MM-dd" /></td>
              <td>
                <!-- Add actions like edit/delete here if needed -->
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </main>
</body>
</html>