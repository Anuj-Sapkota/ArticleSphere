<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.CategoryDAO, java.util.List, model.Category" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard – ArticleSphere</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/categoryAdd.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
  <!-- SIDEBAR -->
  <aside class="sidebar">
    <div class="logo">ArticleSphere</div>
    <nav>
      <a href="${pageContext.request.contextPath}/view/dashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i>Dashboard</a>
      <a href="${pageContext.request.contextPath}/category"><i class="fas fa-th-list"></i> Categories</a>
    </nav>
  </aside>

  <!-- MAIN CONTENT -->
  <main class="main-content">
    <div class="container">
      <div class="header">
        <h1>Admin Dashboard - Categories</h1>
        <a href="logout" class="btn logout-btn">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a>
      </div>

      <!-- Category Creation Form -->
      <h2>Create New Category</h2>
      <% String error = request.getParameter("error"); %>
      <% if (error != null) { %>
          <div class="message error"><%= error %></div>
      <% } %>
      <% String success = request.getParameter("success"); %>
      <% if (success != null) { %>
          <div class="message success"><%= success %></div>
      <% } %>
      <form action="${pageContext.request.contextPath}/category" method="post">
        <input type="hidden" name="action" value="create">
        <div class="form-group">
          <label for="categoryName">Category Name:</label>
          <input type="text" id="categoryName" name="categoryName" required>
        </div>
        <div class="form-group">
          <label for="categoryDescription">Category Description:</label>
          <input type="text" id="categoryDescription" name="categoryDescription">
        </div>
        <button type="submit" class="btn create-btn">Create Category</button>
      </form>

      <!-- Categories Table -->
      <h2>Existing Categories</h2>
      <table class="data-table">
        <thead>
          <tr>
            <th>Category ID</th>
            <th>Category Name</th>
            <th>Description</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
              CategoryDAO categoryDAO = new CategoryDAO();
              List<Category> categories = categoryDAO.getAllCategories();
              for (Category category : categories) {
          %>
              <tr>
                <td><%= category.getCategoryId() %></td>
                <td><%= category.getCategoryName() %></td>
                <td><%= category.getCategoryDescription() != null ? category.getCategoryDescription() : "" %></td>
                <td class="actions">
  <form 
    method="post" 
    action="${pageContext.request.contextPath}/category" 
    onsubmit="return confirm('Delete this category?');"
  >
    <input type="hidden" name="action" value="delete"/>
    <input type="hidden" name="id"     value="<%= category.getCategoryId() %>"/>
    <button type="submit" class="btn delete-btn">Delete</button>
  </form>
</td>
              </tr>
          <%
              }
              if (categories.isEmpty()) {
          %>
              <tr>
                <td colspan="4">No categories found.</td>
              </tr>
          <%
              }
          %>
        </tbody>
      </table>
    </div>
  </main>

  <script>
    function deleteCategory(categoryId) {
      if (confirm("Are you sure you want to delete this category?")) {
        window.location.href = "${pageContext.request.contextPath}/category?action=delete&id=" + categoryId;
      }
    }
  </script>
</body>
</html>