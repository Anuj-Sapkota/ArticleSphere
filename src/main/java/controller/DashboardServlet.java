package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.UserDAO;
import dao.ArticleDAO;
import model.Article;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private UserDAO userDAO;
    private ArticleDAO articleDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        articleDAO = new ArticleDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int totalUsers = userDAO.getTotalUsers();
            int totalArticles = articleDAO.getTotalArticles();
            List<Article> articles = articleDAO.getAllArticles();

            // Combine article data with author names
            List<Map<String, Object>> articleDataList = new ArrayList<>();
            for (Article article : articles) {
                Map<String, Object> articleData = new HashMap<>();
                articleData.put("article", article);
                // Fetch author name using authorId
                String authorFullName = userDAO.getUserFullName(article.getAuthorId());
                articleData.put("authorFullName", authorFullName);
                // Convert LocalDateTime to Date for JSTL
                LocalDateTime publishDate = article.getPublishDate();
                Date date = Date.from(publishDate.atZone(ZoneId.systemDefault()).toInstant());
                articleData.put("publishDateAsDate", date);
                articleDataList.add(articleData);
            }

            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalArticles", totalArticles);
            request.setAttribute("articleDataList", articleDataList);

            request.getRequestDispatcher("/WEB-INF/view/dashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}