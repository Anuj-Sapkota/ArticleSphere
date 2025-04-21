<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <title>Admin Dashboard - ArticleSphere</title>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    
</head>
<body>
<div class="header">
        <h1>Admin Dashboard</h1>
        <a href="#" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

    <div class="container">
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
        <table class="articles-table">
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
                    <td>
                        <button class="btn btn-view">View</button>
                        <button class="btn btn-delete">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>Exploring the Cosmos</td>
                    <td>Jane Smith</td>
                    <td>2025-04-10</td>
                    <td>
                        <button class="btn btn-view">View</button>
                        <button class="btn btn-delete">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>Healthy Living Tips</td>
                    <td>Mike Johnson</td>
                    <td>2025-04-05</td>
                    <td>
                        <button class="btn btn-view">View</button>
                        <button class="btn btn-delete">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>Tech Innovations 2025</td>
                    <td>Emily Brown</td>
                    <td>2025-03-30</td>
                    <td>
                        <button class="btn btn-view">View</button>
                        <button class="btn btn-delete">Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>