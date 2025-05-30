<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Article" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Articles - ArticleSphere</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <script src="${pageContext.request.contextPath}/js/nav.js" defer></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/articleList.css">
    <script src="https://kit.fontawesome.com/bce2e24835.js" crossorigin="anonymous"></script>
</head>
<body>
    <%@ include file="nav.jsp" %>
    <header>
        <h1 class="category_name">${categoryName}</h1>
        <div class='container'>
            <c:if test="${not empty articles and not empty articles[0]}">
                <c:set var="featured" value="${articles[0]}" />
                <div class='left_header'>
                    <div class='left_header_content'>
                        <h1><a href="${pageContext.request.contextPath}/article?action=view&id=${featured.articleId}">
                            ${featured.title}
                        </a></h1>
                        <div class="content-wrapper">
                            <c:choose>
                                <c:when test="${fn:length(featured.content) > 450}">
                                    ${fn:substring(featured.content, 0, 450)}...
                                </c:when>
                                <c:otherwise>
                                    ${featured.content}
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <div class='right_header'>
                    <c:forEach var="article" items="${articles}" begin="1" end="2">
                        <div class='individual_right_header'>
                            <div class='right_header_content'>
                                <h1><a href="${pageContext.request.contextPath}/article?action=view&id=${article.articleId}">
                                    ${article.title}
                                </a></h1>
                                <div class="content-wrapper">
                                    <c:choose>
                                        <c:when test="${fn:length(article.content) > 100}">
                                            ${fn:substring(article.content, 0, 100)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${article.content}
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${empty articles or empty articles[0]}">
                <p>No articles available.</p>
            </c:if>
        </div>
    </header>
    <main>
        <div class="main_content">
            <div class="left_main">
                <h1 class='recent_articles'>Recent Articles</h1>
                 <c:if test="${empty articles or empty articles[0]}">
                <p>No articles available.</p>
            </c:if>
                <c:forEach var="article" items="${articles}">
                    <div class="individual_main">
                        <div class="individual_main_content">
                            <h1><a href="${pageContext.request.contextPath}/article?action=view&id=${article.articleId}">
                                ${article.title}
                            </a></h1>
                            <div class="content-wrapper">
                                <c:choose>
                                    <c:when test="${fn:length(article.content) > 100}">
                                        ${fn:substring(article.content, 0, 180)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${article.content}
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>
    <%@ include file="footer.jsp" %>
</body>
</html>