package controller;

import dao.ArticleDAO;
import dao.CategoryDAO;
import model.Article;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/articleList")
public class ArticleListServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ArticleListServlet.class.getName());
    private ArticleDAO articleDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        articleDAO = new ArticleDAO();
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String categoryIdParam = request.getParameter("categoryId");
            int categoryId = 0;
            if (categoryIdParam != null && !categoryIdParam.trim().isEmpty()) {
                try {
                    categoryId = Integer.parseInt(categoryIdParam);
                } catch (NumberFormatException e) {
                    LOGGER.severe("Invalid categoryId: " + categoryIdParam);
                    response.sendRedirect(request.getContextPath() + "/view/error.jsp?message=Invalid%20category%20ID");
                    return;
                }
            }
            String categoryName = (categoryId > 0) ? categoryDAO.getCategoryById(categoryId).getCategoryName() : "Recents";
            List<Article> articles = (categoryId > 0) ? articleDAO.getArticlesByCategory(categoryId) : articleDAO.getAllArticles();
            request.setAttribute("articles", articles);
            request.setAttribute("categoryName", categoryName);
            request.getRequestDispatcher("/view/articleList.jsp").forward(request, response);
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        }
    }
}