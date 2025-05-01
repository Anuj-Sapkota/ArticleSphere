<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Create New Article</title>
    <link rel="stylesheet" href="../css/ArticlePublish.css">
</head>
<body>
    <div class="modal">
        <div class="modal-header">
            <button class="close-btn" onclick="window.location.href='Profile.jsp'">&times;</button>
            <h2>Create a New Article</h2>
            <button class="post-btn" onclick="submitArticle()">Post</button>
        </div>
        <div class="modal-body">
            <form id="article-form" enctype="multipart/form-data" method="post" action="ArticleServlet">
                <div class="form-group">
                    <input type="text" id="title" name="title" placeholder="Enter article title" required>
                </div>
                <div class="form-group">
                    <select id="category" name="category" required>
                        <option value="" disabled selected>Select category</option>
                        <option value="technology">Technology</option>
                        <option value="health">Health</option>
                        <option value="business">Business</option>
                        <option value="science">Science</option>
                        <option value="arts">Arts</option>
                    </select>
                </div>
                <div class="form-group">
                    <textarea id="content" name="content" placeholder="Write your content here..." required></textarea>
                </div>

                <!-- Image upload with icon and filename display -->
                <div class="form-group image-upload">
                    <label for="image-upload" class="image-icon" onclick="document.getElementById('image-upload').click()"></label>
                    <input type="file" id="image-upload" name="image" class="hidden" accept="image/*" onchange="displayFileName(this)">
                    <span class="file-name" id="file-name">No file chosen</span>
                </div>
            </form>
        </div>
    </div>

   

    <script src="../js/ArticlePublish.js"></script>
</body>
</html>
