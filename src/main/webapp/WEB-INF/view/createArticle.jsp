<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Create Category</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" />
</head>
<body>
    <h1>Create New Category</h1>
    <% String error = request.getParameter("error"); %>
    <% if (error != null) { %>
        <div style="color: red;"><%= error %></div>
    <% } %>
    <% String success = request.getParameter("success"); %>
    <% if (success != null) { %>
        <div style="color: green;"><%= success %></div>
    <% } %>
    <form action="${pageContext.request.contextPath}/category" method="post">
        <input type="hidden" name="action" value="create">
        <label for="name">Category Name:</label>
        <input type="text" id="name" name="name" required>
        <button type="submit">Create Category</button>
    </form>
</body>
</html>