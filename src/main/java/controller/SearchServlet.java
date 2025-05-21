package controller;

import dao.ArticleDAO;
import dao.CategoryDAO;
import model.Article;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private ArticleDAO articleDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        articleDAO = new ArticleDAO();
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        if (query == null || query.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        HttpSession session = request.getSession();
        try {
            List categories = categoryDAO.getAllCategories();
            session.setAttribute("categories", categories);

            Article article = articleDAO.getArticleByTitle(query.trim());
            if (article != null) {
                response.sendRedirect(request.getContextPath() + "/article?action=view&id=" + article.getArticleId());
            } else {
                request.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        }
    }
}