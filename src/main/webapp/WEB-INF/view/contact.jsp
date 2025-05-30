<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--Font Awesome --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
 <script src="${pageContext.request.contextPath}/js/nav.js" defer></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/bce2e24835.js" crossorigin="anonymous"></script>
<title>Contact - ArticleSphere</title>
</head>
<body>



     <%@ include file="nav.jsp" %>
    <div class="main">
        <div id="header">
            <h1>Contact</h1>

            <h3>We'd love to hear from you whether you have questions, feedback, or  need support.<br>As a logged-in user, simply fill out the form below, and out team will getback to you soon. You through help us make ArtucleAphere better!</h3>
            <h3>Email us at <a href="">articlesphere@gmail.com</a></h3>
           
        </div>
        <div id="icons">
         <h2>Reach out to us on:</h2>
         <a><i  class="fa-brands fa-facebook"></i></a>
         <i class="fa-brands fa-instagram"></i>
         <i class="fa-brands fa-twitter"></i>
        </div>
<%-- Show success message if "success=true" is in URL --%>
<%
    String success = request.getParameter("success");
    if ("true".equals(success)) {
%>
    <p class="success-message" style="color: green; text-align: center; margin-top: 1rem;">Message sent successfully!</p>
<%
    }
%>
       <div id="input">
       
    <form action="${pageContext.request.contextPath}/contact" method="post">
    <textarea class="textArea" name="messageContent" placeholder="Your message..." required></textarea><br>
    <button type="submit" id="btn">Send</button>
</form>



</div>
</div>

    <%@ include file="footer.jsp" %>
    
</body>
</html>