<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - ArticleSphere</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
 <div id="navbar">
        <div id="nav1">
            <i class="fa-solid fa-bars"></i>
        <img src="../image.png" alt="images">  
        </div>
        <div id="nav2">
        <i class="fa-regular fa-user"></i>
        </div>
    </div>

    <div>
        <h1>Admin</h1>

    </div>

    <div id="userlist">
        <h3>User List</h3>
        <li>
            random@gmai.com <br>
        </li>
        <li>
            random@gmai.com <br>
        </li> 
        <li>
            random@gmai.com <br>
        </li>
         <li>
            random@gmai.com <br>
        </li>
         <li>
            random@gmai.com <br>
        </li>
    </div>

    <h3 id="section-Header">Articles</h3>
    <div id="Articles" >
        
        <div id="Title">
            <h3>Title</h3>
        </div>
        <div id="Author">
            <h3>Author</h3>
        </div>
        <div id="Action">
            <h3>Action</h3>
            <button>update</button>
            <button>delete</button>
        </div>
    </div>

    <div id="Footer">
        <h5>ArticleSphere © 2025</h5>
        <a href="">Home |</a>
        <a href="">About |</a>
        <a href="">Contact </a>
        <h5>Want to write or comment ? <a href="">Sign in now!</a></h5>
    </div>   
</body>
</html>