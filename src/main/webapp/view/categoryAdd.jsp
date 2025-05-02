<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Category – ArticleSphere</title>
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/addCategory.css">
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
      <h1>Add New Category</h1>
      <form action="addCategory" method="post" enctype="multipart/form-data">
        <label for="name">Category Name</label>
        <input type="text" id="name" name="name" placeholder="e.g. Technology" required>

        <label for="image">Category Image</label>
        <input type="file" id="image" name="image" accept="image/*">

        <button type="submit" class="publish-btn">Create Category</button>
      </form>
      
       <!-- ======= EXISTING CATEGORIES TABLE ======= -->
      <h2>Existing Categories</h2>
      <table class="category-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Image</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="cat" items="${categories}">
            <tr>
              <td>${cat.id}</td>
              <td>${cat.name}</td>
              <td>
                <img
                  src="${pageContext.request.contextPath}/uploads/${cat.imageFilename}"
                  alt="${cat.name}"
                  class="cat-thumb"
                />
              </td>
              <td class="actions">
                <a href="editCategory?id=${cat.id}">Edit</a> |
                <a href="deleteCategory?id=${cat.id}"
                   onclick="return confirm('Delete category “${cat.name}”?');">
                  Delete
                </a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </main>
</body>
</html>
