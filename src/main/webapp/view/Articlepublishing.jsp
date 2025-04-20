<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/ArticlePublish.css">
</head>
<body>
<div class="modal">
    <div class="modal-header">
    <button class="close-btn" onclick="window.location.href='profile.jsp">×</button>
      <h2>Create a New Article</h2>
      <button class="post-btn">Post</button>
    </div>
    <div class="modal-body">
      <form id="article-form">
        <div class="form-group">
          <input type="text" id="title" placeholder="title" required>
        </div>
        <div class="form-group">
          <select id="category" required>
            <option value="" disabled selected>category</option>
            <option value="technology">Technology</option>
            <option value="health">Health</option>
            <option value="business">Business</option>
            <option value="science">Science</option>
            <option value="arts">Arts</option>
          </select>
        </div>
        <div class="form-group">
          <textarea id="content" placeholder="content..." required></textarea>
        </div>
        <div class="image-upload">
          <div class="image-icon">
            
          </div>
          <input type="file" id="image-upload" class="hidden" accept="image/*">
        </div>
      </form>
    </div>
  </div>
</body>
</html>