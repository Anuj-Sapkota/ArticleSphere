<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="stylesheet" href="../css/profile.css">

</head>
<body>
<div class="container">
    <div class="header">
        <button class="close-btn">×</button>
        <h1>PROFILE</h1>
        <button class="create-btn" onclick="window.location.href='Articlepublishing.jsp'">create</button>
    </div>

    <div class="profile-section">
        <div class="profile-pic"></div>
        <div class="profile-name" id="user-name">${sessionScope.user.name}</div>
        <div class="profile-bio" id="user-bio">hlkjlaksdkhadia lkhakldshads lkhadslhajsd healsd agolkfja lkhsdkgas kjatakdbs</div>
    </div>

    <div class="divider"></div>

    <div class="section-title">YOUR ARTICLES</div>
    <div class="content-list" id="articles-container">
        <!-- Articles will be populated dynamically -->
        <div class="content-item"></div>
        <div class="content-item"></div>
        <div class="content-item"></div>
    </div>
    <div class="view-more">
        View More
        <div class="arrow-down"></div>
    </div>

    <div class="section-title">Your Comments</div>
    <div class="content-list" id="comments-container">
        <!-- Comments will be populated dynamically -->
        <div class="content-item"></div>
    </div>
    <div class="view-more">
        View More
        <div class="arrow-down"></div>
    </div>
</div>
<script src="../js/profile.js"></script>
</body>
</html>