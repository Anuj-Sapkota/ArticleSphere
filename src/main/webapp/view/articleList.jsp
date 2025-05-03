<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Article" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Articles - ArticleSphere</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/component/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/component/footer.css">
    <script src="${pageContext.request.contextPath}/component/nav.js" defer></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/articleList.css">
    <script src="https://kit.fontawesome.com/bce2e24835.js" crossorigin="anonymous"></script>
</head>
<body>
    <%@ include file="../component/nav.jsp" %>
    <header>
        <h1>Articles</h1>
        <div class='container'> 
            <%
                List<Article> articles = (List<Article>) request.getAttribute("articles");
                if (articles != null && !articles.isEmpty()) {
                    Article featured = articles.get(0);
            %>
            <div class='left_header'>
                <div class='left_header_content'>
                    <h1><a href="${pageContext.request.contextPath}/article?action=view&id=<%= featured.getArticleId() %>">
                        <%= featured.getTitle() %>
                    </a></h1>
                    <p>
                        <%= featured.getContent().length() > 150 ? 
                           featured.getContent().substring(0, 150) + "..." : 
                           featured.getContent() %>
                    </p>
                </div>
            </div>
            <div class='right_header'> 
                <%
                    for (int i = 1; i < Math.min(3, articles.size()); i++) {
                        Article article = articles.get(i);
                %>
                <div class='individual_right_header'>
                    <div class='right_header_content'>
                        <h1><a href="${pageContext.request.contextPath}/article?action=view&id=<%= article.getArticleId() %>">
                            <%= article.getTitle() %>
                        </a></h1>
                        <p>
                            <%= article.getContent().length() > 100 ? 
                               article.getContent().substring(0, 100) + "..." : 
                               article.getContent() %>
                        </p>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <%
                } else {
            %>
                <p>No articles available.</p>
            <%
                }
            %>
        </div> 
    </header>
    <main>
        <div class="main_content">
            <div class="left_main">
                <h1>Recents</h1>
                <%
                    if (articles != null) {
                        for (Article article : articles) {
                %>
                <div class="individual_main">
                    <div class="individual_main_content">
                        <h1><a href="${pageContext.request.contextPath}/article?action=view&id=<%= article.getArticleId() %>">
                            <%= article.getTitle() %>
                        </a></h1>
                        <p>
                            <%= article.getContent().length() > 100 ? 
                               article.getContent().substring(0, 100) + "..." : 
                               article.getContent() %>
                        </p>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
           
        </div>
    </main>
    <%@ include file="../component/footer.jsp" %>
</body>
</html>