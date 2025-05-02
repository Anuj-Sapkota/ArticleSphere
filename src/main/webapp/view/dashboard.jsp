<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard – ArticleSphere</title>
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/dashboard.css">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
  <!-- SIDEBAR -->
<aside class="sidebar">
    <div class="logo">ArticleSphere</div>
    <nav>
      <a href="${pageContext.request.contextPath}/view/dashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i>Dashboard</a>
      <a href="${pageContext.request.contextPath}/view/categoryAdd.jsp"><i class="fas fa-th-list"></i> Categories</a>
    </nav>
  </aside>

  <!-- MAIN CONTENT -->
  <main class="main-content">
    <div class="container">
      <div class="header">
        <h1>Admin Dashboard</h1>
        <a href="logout" class="btn logout-btn">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a>
      </div>

      <!-- Stats Cards -->
      <div class="stats">
        <div class="stat-card">
          <h3>Total Users</h3>
          <p>150</p>
        </div>
        <div class="stat-card">
          <h3>Total Articles</h3>
          <p>320</p>
        </div>
      </div>

      <!-- Articles Table -->
      <h2>Recent Articles</h2>
      <table class="data-table">
        <thead>
          <tr>
            <th>Article Name</th>
            <th>Created By</th>
            <th>Created Date</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <!-- Dummy Data -->
          <tr>
            <td>The Future of AI</td>
            <td>John Doe</td>
            <td>2025-04-15</td>
            <td class="actions">
              <button class="btn btn-view">View</button>
              <button class="btn btn-delete">Delete</button>
            </td>
          </tr>
          <tr>
            <td>Exploring the Cosmos</td>
            <td>Jane Smith</td>
            <td>2025-04-10</td>
            <td class="actions">
              <button class="btn btn-view">View</button>
              <button class="btn btn-delete">Delete</button>
            </td>
          </tr>
          <tr>
            <td>Healthy Living Tips</td>
            <td>Mike Johnson</td>
            <td>2025-04-05</td>
            <td class="actions">
              <button class="btn btn-view">View</button>
              <button class="btn btn-delete">Delete</button>
            </td>
          </tr>
          <tr>
            <td>Tech Innovations 2025</td>
            <td>Emily Brown</td>
            <td>2025-03-30</td>
            <td class="actions">
              <button class="btn btn-view">View</button>
              <button class="btn btn-delete">Delete</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </main>
</body>
</html>
