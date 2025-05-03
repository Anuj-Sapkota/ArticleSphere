package controller;

import dao.ArticleDAO;
import dao.CategoryDAO;
import model.Article;
import model.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/article")
public class ArticleServlet extends HttpServlet {
    private ArticleDAO articleDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        articleDAO = new ArticleDAO();
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    showNewArticleForm(request, response);
                    break;
                case "view":
                    viewArticle(request, response);
                    break;
                case "update":
                    showUpdateArticleForm(request, response);
                    break;
                case "list":
                default:
                    listArticles(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "create":
                    createArticle(request, response);
                    break;
                case "update":
                    updateArticle(request, response);
                    break;
                case "delete":
                    deleteArticle(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showNewArticleForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<model.Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/view/Articlepublishing.jsp").forward(request, response);
    }

    private void showUpdateArticleForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int articleId = Integer.parseInt(request.getParameter("id"));
        Article article = articleDAO.getArticleById(articleId);
        if (article != null) {
            List<model.Category> categories = categoryDAO.getAllCategories();
            request.setAttribute("article", article);
            request.setAttribute("categories", categories);
            System.out.println("Updating article: " + article.getTitle()); // Debug
            request.getRequestDispatcher("/view/Articlepublishing.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Article not found");
        }
    }

    private void listArticles(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        request.setAttribute("articles", articleDAO.getAllArticles());
        request.getRequestDispatcher("/view/articleList.jsp").forward(request, response);
    }

    private void viewArticle(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int articleId = Integer.parseInt(request.getParameter("id"));
        Article article = articleDAO.getArticleById(articleId);
        if (article != null) {
            request.setAttribute("article", article);
            request.getRequestDispatcher("/view/articles.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Article not found");
        }
    }

    private void createArticle(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String authorIdStr = request.getParameter("authorId");
        String categoryIdStr = request.getParameter("categoryId");

        if (title == null || title.trim().isEmpty() || content == null || content.trim().isEmpty() ||
            authorIdStr == null || categoryIdStr == null || categoryIdStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/publishArticle?error=All fields are required");
            return;
        }

        int authorId;
        int categoryId;
        try {
            authorId = Integer.parseInt(authorIdStr);
            categoryId = Integer.parseInt(categoryIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/publishArticle?error=Invalid author or category ID");
            return;
        }

        if (categoryId < 1) {
            response.sendRedirect(request.getContextPath() + "/publishArticle?error=Invalid category ID");
            return;
        }

        Article newArticle = new Article(title, content, authorId, LocalDateTime.now(), categoryId);
        articleDAO.createArticle(newArticle);
        response.sendRedirect(request.getContextPath() + "/article?action=list");
    }

    private void updateArticle(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Article article = articleDAO.getArticleById(articleId);
        if (article != null) {
            // Retain the existing publishDate since it's not provided by the form
            LocalDateTime publishDate = article.getPublishDate();

            article.setTitle(title);
            article.setContent(content);
            article.setPublishDate(publishDate);
            article.setCategoryId(categoryId);
            articleDAO.updateArticle(article);
            response.sendRedirect(request.getContextPath() + "/article?action=view&id=" + articleId);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Article not found");
        }
    }

    private void deleteArticle(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int articleId = Integer.parseInt(request.getParameter("id"));
        articleDAO.deleteArticle(articleId);
        response.sendRedirect(request.getContextPath() + "/view/Profile.jsp");
    }
}