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

      <!-- Edit Category Form (Hidden by Default) -->
      <h2 id="editFormTitle" style="display: none;">Edit Category</h2>
      <% String editError = request.getParameter("editError"); %>
      <% if (editError != null) { %>
          <div class="message error"><%= editError %></div>
      <% } %>
      <% String editSuccess = request.getParameter("editSuccess"); %>
      <% if (editSuccess != null) { %>
          <div class="message success"><%= editSuccess %></div>
      <% } %>
      <form id="editCategoryForm" action="${pageContext.request.contextPath}/category" method="post" style="display: none;">
        <input type="hidden" name="action" value="update">
        <input type="hidden" id="editCategoryId" name="categoryId">
        <div class="form-group">
          <label for="editCategoryName">Category Name:</label>
          <input type="text" id="editCategoryName" name="categoryName" required>
        </div>
        <div class="form-group">
          <label for="editCategoryDescription">Category Description:</label>
          <input type="text" id="editCategoryDescription" name="categoryDescription">
        </div>
        <button type="submit" class="btn create-btn">Update Category</button>
        <button type="button" class="btn cancel-btn" onclick="hideEditForm()">Cancel</button>
      </form>

      <!-- Category Creation Form -->
     
      <% String error = request.getParameter("error"); %>
      <% if (error != null) { %>
          <div class="message error"><%= error %></div>
      <% } %>
      <% String success = request.getParameter("success"); %>
      <% if (success != null) { %>
          <div class="message success"><%= success %></div>
      <% } %>
      <form id="createCategoryForm" action="${pageContext.request.contextPath}/category" method="post">
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
      <h2 class="table_title">Existing Categories</h2>
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
                  <button class="btn edit-btn" onclick="showEditForm(<%= category.getCategoryId() %>, '<%= category.getCategoryName() %>', '<%= category.getCategoryDescription() != null ? category.getCategoryDescription() : "" %>')">Edit</button>
                  <form 
                    method="post" 
                    action="${pageContext.request.contextPath}/category" 
                    onsubmit="return confirm('Delete this category?');"
                  >
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="id" value="<%= category.getCategoryId() %>"/>
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
  function showEditForm(categoryId, categoryName, categoryDescription) {
      document.getElementById('editCategoryId').value = categoryId;
      document.getElementById('editCategoryName').value = categoryName;
      document.getElementById('editCategoryDescription').value = categoryDescription;
      document.getElementById('editCategoryForm').style.display = 'block';
      document.getElementById('createCategoryForm').style.display = 'none'; // Hide create form
      window.scrollTo(0, 0);
  }

  function hideEditForm() {
      document.getElementById('editCategoryForm').style.display = 'none';
      document.getElementById('createCategoryForm').style.display = 'block'; // Show create form
  }
    function deleteCategory(categoryId) {
      if (confirm("Are you sure you want to delete this category?")) {
        window.location.href = "${pageContext.request.contextPath}/category?action=delete&id=" + categoryId;
      }
    }
  </script>
</body>
</html>